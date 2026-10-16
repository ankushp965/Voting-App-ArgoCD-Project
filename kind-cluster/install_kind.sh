#!/bin/bash
set -e

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
  x86_64) KIND_ARCH="amd64" ;;
  aarch64|arm64) KIND_ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH" && exit 1 ;;
esac

echo "Detected architecture: $ARCH ($KIND_ARCH)"
echo "Downloading Kind v0.24.0..."
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-${KIND_ARCH}"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

echo "Kind installation complete:"
kind --version
