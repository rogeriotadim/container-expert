#!/bin/bash
docker_machine_name=$MN
docker_ssh_user=$(docker-machine inspect $docker_machine_name --format={{.Driver.SSHUser}})
docker_ssh_key=$(docker-machine inspect $docker_machine_name --format={{.Driver.SSHKeyPath}})
docker_ssh_port=$(docker-machine inspect $docker_machine_name --format={{.Driver.SSHPort}})

ssh -i $docker_ssh_key -p $docker_ssh_port $docker_ssh_user@localhost  

