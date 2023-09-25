#!/bin/bash
# Update the package repository
sudo yum update -y

# Install Apache web server
sudo yum install httpd -y

# Start Apache and enable it to start on boot
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a basic HTML page
echo '<html><head><title>My AWS Web Page</title></head><body><h1>Welcome to My AWS Web Page</h1><p>This is a basic webpage hosted on an AWS EC2 instance.</p></body></html>' > /var/www/html/index.html

# Set permissions to make sure Apache can serve the HTML file
sudo chown apache:apache /var/www/html/index.html

# Restart Apache to apply changes
sudo systemctl restart httpd

