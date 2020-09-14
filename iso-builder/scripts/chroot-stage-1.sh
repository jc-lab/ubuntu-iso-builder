#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

APT_REPO=$(cat /tmp/mirror.txt | head -n 1)
echo "APT_REPO: $APT_REPO"
cat > /etc/apt/sources.list <<EOF
deb $APT_REPO focal main restricted universe multiverse
deb $APT_REPO focal-updates main restricted universe multiverse
deb $APT_REPO focal-backports main restricted universe multiverse
deb $APT_REPO focal-security main restricted universe multiverse
EOF

apt-get update -y
apt-get install -y \
    bash vim sudo \
    linux-image-generic live-boot \
    curl wget tar squashfs-tools openssl \
    openssh-server openssh-sftp-server openssh-client \
    network-manager net-tools wireless-tools wpagui \
    blackbox xserver-xorg-core xserver-xorg xinit xterm

