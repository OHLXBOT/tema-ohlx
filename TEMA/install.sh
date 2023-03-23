sudo curl https://raw.githubusercontent.com/ahmadsailpil/PteroFreeStuffinstaller/V1.10.1/resources/DarkNBlue/OHLX.tar.gz | sudo tar -xz
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
yarn install
yarn
yarn build:production
php artisan view:clear
echo "pemasangan telah selesai"
