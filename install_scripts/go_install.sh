#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e
# Define the installation directory
INSTALL_DIR="/usr/local"
# Fetch the latest version of Go from the official downloads page
echo "Fetching the latest version of Go..."
LATEST_VERSION=$(curl -s https://go.dev/VERSION?m=text | grep -e go.*)
# Construct the download URL for the latest version
GO_URL="https://go.dev/dl/${LATEST_VERSION}.linux-amd64.tar.gz"
# Download the Go tarball
echo "Downloading Go ${LATEST_VERSION}..."
wget -q $GO_URL -O /tmp/${LATEST_VERSION}.linux-amd64.tar.gz
# Remove any previous Go installation
echo "Removing previous Go installation..."
sudo rm -rf ${INSTALL_DIR}/go
# Extract the tarball to the installation directory
echo "Installing Go ${LATEST_VERSION}..."
sudo tar -C ${INSTALL_DIR} -xzf /tmp/${LATEST_VERSION}.linux-amd64.tar.gz
# Clean up the tarball
rm /tmp/${LATEST_VERSION}.linux-amd64.tar.gz

# Print the Go version to verify the installation
echo "Go installation complete. Go version:"
go version

echo "Installing go debugger:"
go install github.com/go-delve/delve/cmd/dlv@latest

