#!/bin/bash
# package-service-setup.sh

echo "📦 Starting package and service automation..."

# List of packages to install
PACKAGES=("httpd" "mariadb105-server" "php")

# Loop to install each package
for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    sudo dnf install -y $package
done

# Start and enable services
SERVICES=("httpd" "mariadb")

for service in "${SERVICES[@]}"; do
    echo "Enabling and starting $service..."
    sudo systemctl enable $service
    sudo systemctl start $service
done

# Status check
echo -e "\n🔍 Checking service statuses..."
for service in "${SERVICES[@]}"; do
    systemctl status $service --no-pager
done

echo -e "\n✅ Package and service setup completed!"
