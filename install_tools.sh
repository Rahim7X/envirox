#!/bin/bash

# Define the download URLs and target directory
NUCLEI_URL="https://github.com/projectdiscovery/nuclei/releases/download/v3.3.5/nuclei_3.3.5_linux_amd64.zip"
HTTPX_URL="https://github.com/projectdiscovery/httpx/releases/download/v1.6.8/httpx_1.6.8_linux_amd64.zip"
GRON_URL="https://github.com/tomnomnom/gron/releases/download/v0.7.1/gron-linux-amd64-0.7.1.tgz"
GAU_URL="https://github.com/lc/gau/releases/download/v2.2.3/gau_2.2.3_linux_amd64.tar.gz"
JADX_URL="https://github.com/skylot/jadx/releases/download/v1.5.0/jadx-1.5.0.zip"
GRADLE_URL="https://services.gradle.org/distributions/gradle-8.2.1-bin.zip"
ANDROID_CLI_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
ADERYN_URL="https://github.com/Cyfrin/aderyn/releases/download/v0.3.2/aderyn-linux-amd64.tar.gz"
TARGET_DIR="/home/ubuntu/tools/web"

# Update package list and install Python, pip, OpenJDK, and JRE
echo "Updating package list and installing Python, pip, OpenJDK, and JRE..."
sudo apt update || true
sudo apt install -y python3 python3-pip openjdk-11-jdk openjdk-11-jre || true

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Navigate to the target directory
cd "$TARGET_DIR" || { echo "Failed to change directory to $TARGET_DIR"; exit 1; }

# Download the nuclei file using wget with follow redirects
echo "Downloading nuclei..."
wget --content-disposition --trust-server-names --no-check-certificate "$NUCLEI_URL" || true

# Unzip the downloaded nuclei file
echo "Unzipping nuclei..."
unzip nuclei_3.3.5_linux_amd64.zip || true

# Clean up the zip file after extraction
rm nuclei_3.3.5_linux_amd64.zip || true

# Run the nuclei command to update
echo "Running nuclei update..."
./nuclei -up || true

# Download the httpx file using wget with follow redirects
echo "Downloading httpx..."
wget --content-disposition --trust-server-names --no-check-certificate "$HTTPX_URL" || true

# Unzip the downloaded httpx file
echo "Unzipping httpx..."
unzip httpx_1.6.8_linux_amd64.zip || true

# Clean up the zip file after extraction
rm httpx_1.6.8_linux_amd64.zip || true

# Run the httpx command to check if it works (optional)
echo "Running httpx to verify installation..."
./httpx -version || true

# Install the waymore package using pip
echo "Installing waymore using pip..."
pip3 install waymore || true

# Install Subdominator from GitHub
echo "Installing Subdominator from GitHub..."
pip3 install git+https://github.com/RevoltSecurities/Subdominator || true

# Download the gron file using wget with follow redirects
echo "Downloading gron..."
wget --content-disposition --trust-server-names --no-check-certificate "$GRON_URL" || true

# Extract the downloaded gron file
echo "Extracting gron..."
tar -xzf gron-linux-amd64-0.7.1.tgz || true

# Clean up the tar.gz file after extraction
rm gron-linux-amd64-0.7.1.tgz || true

# Move gron binary to the target directory
mv gron-linux-amd64 gron || true

# Make gron executable
chmod +x gron || true

# Verify the installation of gron
echo "Running gron to verify installation..."
./gron --version || true

# Download the gau file using wget with follow redirects
echo "Downloading gau..."
wget --content-disposition --trust-server-names --no-check-certificate "$GAU_URL" || true

# Extract the downloaded gau file
echo "Extracting gau..."
tar -xzf gau_2.2.3_linux_amd64.tar.gz || true

# Clean up the tar.gz file after extraction
rm gau_2.2.3_linux_amd64.tar.gz || true

# Move gau binary to the target directory
mv gau_2.2.3_linux_amd64 gau || true

# Make gau executable
chmod +x gau || true

# Verify the installation of gau
echo "Running gau to verify installation..."
./gau --version || true

# Install Foundry using curl and run foundryup
echo "Installing Foundry..."
curl -L https://foundry.paradigm.xyz | bash || true

# Run foundryup to update Foundry
echo "Running foundryup..."
foundryup || true

# Download the jadx file using wget with follow redirects
echo "Downloading JADX..."
wget --content-disposition --trust-server-names --no-check-certificate "$JADX_URL" || true

# Unzip the downloaded jadx file
echo "Unzipping JADX..."
unzip jadx-1.5.0.zip || true

# Clean up the zip file after extraction
rm jadx-1.5.0.zip || true

# Make jadx executable
chmod +x bin/jadx || true

# Verify the installation of jadx
echo "Running JADX to verify installation..."
./bin/jadx --version || true

# Download the Gradle file using wget with follow redirects
echo "Downloading Gradle..."
wget --content-disposition --trust-server-names --no-check-certificate "$GRADLE_URL" || true

# Unzip the downloaded Gradle file
echo "Unzipping Gradle..."
unzip gradle-8.2.1-bin.zip || true

# Clean up the zip file after extraction
rm gradle-8.2.1-bin.zip || true

# Move Gradle to the target directory
mv gradle-8.2.1 gradle || true

# Verify the installation of Gradle
echo "Running Gradle to verify installation..."
./gradle/bin/gradle -v || true

# Download the Android Command Line Tools using wget with follow redirects
echo "Downloading Android Command Line Tools..."
wget --content-disposition --trust-server-names --no-check-certificate "$ANDROID_CLI_TOOLS_URL" || true

# Unzip the downloaded Android Command Line Tools
echo "Unzipping Android Command Line Tools..."
unzip commandlinetools-linux-11076708_latest.zip || true

# Clean up the zip file after extraction
rm commandlinetools-linux-11076708_latest.zip || true

# Move Android Command Line Tools to the target directory
mv cmdline-tools "$TARGET_DIR/android_cmdline_tools" || true

# Download the Aderyn file using wget with follow redirects
echo "Downloading Aderyn..."
wget --content-disposition --trust-server-names --no-check-certificate "$ADERYN_URL" || true

# Extract the downloaded Aderyn file
echo "Extracting Aderyn..."
tar -xzf aderyn-linux-amd64.tar.gz || true

# Clean up the tar.gz file after extraction
rm aderyn-linux-amd64.tar.gz || true

# Move Aderyn binary to the target directory
mv aderyn-linux-amd64 aderyn || true

# Make Aderyn executable
chmod +x aderyn || true

# Verify the installation of Aderyn
echo "Running Aderyn to verify installation..."
./aderyn --version || true

# Test the installed packages
echo "Testing installed packages..."

# Test Nuclei
echo "Testing nuclei..."
./nuclei -version || true

# Test Httpx
echo "Testing httpx..."
./httpx -version || true

# Test Gron
echo "Testing gron..."
./gron --version || true

# Test Gau
echo "Testing gau..."
./gau --version || true

# Test Foundry
echo "Testing Foundry..."
foundry --version || true

# Test JADX
echo "Testing JADX..."
./bin/jadx --version || true

# Test Gradle
echo "Testing Gradle..."
./gradle/bin/gradle -v || true

# Test Aderyn
echo "Testing Aderyn..."
./aderyn --version || true

echo "Setup complete."


