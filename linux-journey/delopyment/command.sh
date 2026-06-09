# ⚙️ Deployment Steps

## Update System
```bash
sudo apt update

sudo apt install -y nodejs npm
node -v && npm -v

sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

git clone https://github.com/pravinmishraaws/my-react-app.git
cd my-react-app

cd src
vim App.js

cd ..
npm install
npm run build

sudo rm -rf /var/www/html/*
sudo cp -r build/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html


---

# 📄 **3. configuration/nginx-config.md**

```markdown
# 🌐 Nginx Configuration

```nginx
server {
  listen 80;
  server_name _;
  root /var/www/html;
  index index.html;

  location / {
    try_files $uri /index.html;
  }

  error_page 404 /index.html;
}

sudo systemctl restart nginx
