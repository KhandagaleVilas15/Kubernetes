#!/bin/bash
set -e  # Exit if any command fails

# === Install kind ===
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
  KIND_URL="https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64"
elif [ "$ARCH" = "aarch64" ]; then
  KIND_URL="https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-arm64"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

curl -Lo ./kind "$KIND_URL"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# === Install kubectl ===
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo " kind and kubectl installed successfully!"
