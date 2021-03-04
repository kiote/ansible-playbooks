# It’s a good practice not to use a root user to login to the server, so we’ll create a new user to use from now on.
adduser emily
# Add the user to sudo group
usermod -aG sudo emily
# Copy root account’s SSH key to a new user account
rsync --archive --chown=emily:emily ~/.ssh /home/emily
# Try to login as emily (in a new terminal session)
# Edit file /etc/ssh/sshd_config and change PermitRootLogin to no and PasswordAuthentication to no.
sudo service ssh restart
sudo apt update
sudo apt upgrade -y
# Set up a repository for nginx
echo "deb http://nginx.org/packages/mainline/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sudo apt update
sudo apt install nginx nginx-full
mkdir -p /var/www/myblog
sudo chown -R www-data:www-data /var/www/myblog
sudo chmod -R 755 /var/www/myblog
# Create file /var/www/myblog/index.html with any html
# let’s create a configuration file for your website /etc/nginx/conf.d/myblog.conf
#server {
#   root /var/www/myblog;
#   
#   index index.html;

#   server_name myblog.com www.myblog.com;

#   location / {
#       try_files $uri $uri/ =404;
#   }

#   include custom/general.conf;
#   include custom/security.conf;
#}
sudo apt install snapd
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
# >>> install pip, install gandi plugin: https://github.com/obynio/certbot-plugin-gandi
