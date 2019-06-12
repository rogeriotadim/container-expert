#!/bin/bash
apt update && apt upgrade -y
apt install -y git nano
git confing --global user.name "Rogerio Tadim"
git config --global user.email "rogeriotadim@gmail.com"
