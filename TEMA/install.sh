#clear
cd /var/www/pterodactyl

if [ `which yum` ]; then
  if ! command -v node -v &> /dev/null
  then
    curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
    yum install nodejs
  fi
elif [ `which apt` ]; then
  if ! command -v node -v &> /dev/null
  then
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    apt-get install -y nodejs
  fi
else
   echo "Your OS is unsupported"
fi

if ! command -v yarn -v &> /dev/null
then
    npm i -g yarn
fi
yarn 
yarn build:production
#clear
php artisan view:clear
php artisan config:clear
