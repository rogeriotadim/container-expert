#!/bin/bash
cp /opt/vagrant/data/etc/modules-load.d/* /etc/modules-load.d/

# Disable swap
swapoff -a && \
  sudo sed -i '/ swap / s/^/#/' /etc/fstab

# Update install docker
apt-get update \
    && apt-get upgrade \
    && apt-get install -y \
        apt-transport-https \
        bash-completion \
        curl

# install docker
curl -fsSL https://get.docker.com | bash

# Set cgroup as cgroupdriver so k8s doesn't complain
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

mkdir -p /etc/systemd/system/docker.service.d

# Restart docker.
systemctl daemon-reload
systemctl restart docker

# install k8s dependencies
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update \
    && apt-get install -y \
        kubeadm \
        kubectl \
        kubelet

# add completion commands
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash >/etc/bash_completion.d/kubectl
echo 'source /usr/share/bash-completion/bash_completion' >>~/.bashrc

# Kubelet extra args:
# - https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/
# - https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/kubelet-integration/
cat >/etc/default/kubelet <<EOF
KUBELET_EXTRA_ARGS=--node-ip=$CURRENT_NODE_PRIVATE_IP
EOF
systemctl daemon-reload \
  && systemctl restart kubelet

# start the k8s cluster on master node
kubeadm join 192.168.1.200:6443 --token fthuym.ov5ovssq8d29xlhb \
    --discovery-token-ca-cert-hash sha256:4a47e20669110275e49122b01040b50f52d417065415f8bc4d81aa5ca2fc0498