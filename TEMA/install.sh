  if [ `which apt` ]; then
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
php artisan view:clear
 
