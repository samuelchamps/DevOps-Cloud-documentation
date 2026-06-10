#!/bin/bash -xe

exec > /var/log/user-data.log 2>&1

sudo apt update -y
sudo apt install nginx git curl -y

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

sudo systemctl enable nginx
sudo systemctl start nginx

cd /home/ubuntu

git clone https://github.com/pravinmishraaws/my-react-app.git || exit 1
cd my-react-app

# REMOVE THIS if app folder doesn't exist
# cd app

npm install
npm run build

sudo rm -rf /var/www/html/*
sudo cp -r build/* /var/www/html/

cat <<EOF | sudo tee /etc/nginx/sites-available/default
server {
    listen 80;
    server_name _;
    root /var/www/html;
    index index.html;

    location / {
        try_files \$uri /index.html;
    }
}
EOF

sudo systemctl restart nginx