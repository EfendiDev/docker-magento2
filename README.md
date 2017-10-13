# Docker Magento2
Welcome Magento 2 Community Edition installation with Docker.
Project contains Nginx, PHP7 and MySQL environment configuration.

# Setup

1) Firstly, checkout this repo in your local machine `~/Sites` directory
  - `cd ~/Sites && git clone https://github.com/gokhanefendi/docker-magento2.git`

2) Get your access keys from https://marketplace.magento.com/customer/accessKeys/ to install magento2

3) Set your access keys
  - `export MAGENTO_PUBLIC_KEY=your-public-key-goes-here`
  - `export MAGENTO_PRIVATE_KEY=your-private-key-goes-here`
  - AND set magento url with this command: `export MAGENTO_BASE_URL=http://magento2.local`

  - OR you can create .env file to define all (Simply copy example.env to .env and change its content)

4) Build docker image, run this command: `docker build -t magento2 .`
5) Stand up containers using this command: `docker-compose up magento2`

PS: If you need to access containers via ssh, use these commands: 
  - `docker exec -it magento2 /bin/bash` for nginx container
  - `docker exec -it magento2_mysql /bin/bash` for mysql container
  
Please feel free to contribute the project and enjoy it!
