#!/bin/bash
set -e

VERSION="v1.30.0"
INSTALL_DIR="/usr/local/bin"

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
  x86_64) KUBE_ARCH="amd64" ;;
  aarch64|arm64) KUBE_ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH" && exit 1 ;;
esac

echo "Detected architecture: $ARCH ($KUBE_ARCH)"
echo "Downloading kubectl ${VERSION}..."
curl -LO "https://dl.k8s.io/release/${VERSION}/bin/linux/${KUBE_ARCH}/kubectl"
chmod +x kubectl
sudo mv kubectl "${INSTALL_DIR}/"

echo "kubectl installation complete:"
kubectl version --client
