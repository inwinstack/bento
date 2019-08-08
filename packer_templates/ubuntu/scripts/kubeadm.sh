#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y apt-transport-https curl

curl -fsSL https://get.docker.com/ | sh

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF


export KUBE_VERSION="1.14.5"

apt-get update
apt-get install -y kubelet=${KUBE_VERSION}-00 kubeadm=${KUBE_VERSION}-00 kubectl=${KUBE_VERSION}-00