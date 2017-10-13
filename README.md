# Docker Magento2
Welcome Magento 2 Community Edition installation with Docker.
Project contains Nginx, PHP7 and MySQL environment configuration.

# Setup

1) Get your access keys from https://marketplace.magento.com/customer/accessKeys/ to install magento2

2) Set your access keys
  - `export MAGENTO_PUBLIC_KEY=your-public-key-goes-here`
  - `export MAGENTO_PRIVATE_KEY=your-private-key-goes-here`
  - AND set magento url with this command: `export MAGENTO_BASE_URL=http://magento2.local`

  - OR you can create .env file to define all (Simply copy example.env to .env and change its content)

3) Build docker image, run this command: `docker build -t magento2 .`
4) Stand up containers using this command: `docker-compose up magento2`

PS: If you need to access containers via ssh, use these commands: 
  - `docker exec -it magento2 /bin/bash` for nginx container
  - `docker exec -it magento2_mysql /bin/bash` for mysql container
  
Enjoy it!
