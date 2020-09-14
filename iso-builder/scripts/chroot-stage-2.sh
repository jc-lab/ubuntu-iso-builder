#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

echo "ubuntu-live" > /etc/hostname

useradd -m -s /bin/bash live -p ''
usermod -a -G sudo live

cat > /etc/sudoers.d/live <<EOF
%sudo ALL=NOPASSWD: ALL
EOF

apt clean


