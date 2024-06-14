#!/bin/bash

# Update package list
sudo apt update

# Install wget and gpg if not already installed
sudo apt install -y wget gpg

#install curl
echo "Installing curl"
sudo apt install curl -y
echo "curl install completed"

#install git
echo "Installing git"
sudo apt install git -y
echo "git install completed"

#install libfuse2
echo "Installing libfuse2"
sudo apt install libfuse2
echo "libfuse2 install completed"

# Install Visual Studio Code
echo "Installing vscode"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
echo "vscode install completed"

# adminer
echo "Installing adminer"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo systemctl enable apache2 && sudo systemctl start apache2
sudo apt-get install php8.1 php8.1-cli php8.1-common php8.1-imap php8.1-redis php8.1-snmp php8.1-xml php8.1-zip php8.1-mbstring php8.1-curl php8.1-mysqli libapache2-mod-php php8.1-fpm -y
sudo apt install adminer -y
sudo a2enconf php*-fpm
sudo a2enconf adminer
sudo systemctl reload apache2
echo "adminer install completed"

# Install NVM
echo "Installing NVM..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
echo "NVM installation completed."

# Install AWS VPN Client
echo "Installing AWS VPN Client..."
# Download the AWS VPN Client package
# wget https://d20adtppz83p9s.cloudfront.net/ubuntu/latest/amd64/aws-vpn-client.deb
# Install the package
# sudo apt install -y ./aws-vpn-client.deb
# Clean up
# rm -f aws-vpn-client.deb
curl https://d20adtppz83p9s.cloudfront.net/GTK/latest/awsvpnclient_amd64.deb -o awsvpnclient_amd64.deb
sudo dpkg -i awsvpnclient_amd64.deb
echo "AWS VPN Client installation completed."

# Install MySQL
echo "Installing mysql server"
sudo apt install -y mysql-server
echo "mysql server installation completed"

# Install Flameshot
echo "Installing flameshot"
sudo apt install -y flameshot
echo "flameshot installation completed"

# Install Sublime Text
echo "Installing sublime"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt install -y sublime-text
echo "sublime installation completed"

# Install Skype
echo "Installing skype"
wget https://go.skype.com/skypeforlinux-64.deb
sudo apt install -y ./skypeforlinux-64.deb
echo "skype installation completed"

# Install Google Chrome
echo "Installing google chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
echo "google chrome installation completed"

# Install Meld
echo "Installing meld"
sudo apt install -y meld
echo "meld installation completed"

# Install anydesk
echo "Installing anydesk"
wget https://download.anydesk.com/linux/anydesk_6.3.2-1_amd64.deb
sudo apt install -y ./anydesk_6.3.2-1_amd64.deb
echo "anydesk installation completed"

# Cleanup
rm -f google-chrome-stable_current_amd64.deb skypeforlinux-64.deb packages.microsoft.gpg awsvpnclient_amd64.deb

echo "All applications installed successfully."	