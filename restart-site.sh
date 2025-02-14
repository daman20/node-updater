pm2 delete index

cd $WEBSITE_PATh

npm install

npm run build

pm2 start "npm run dev -- --host" --name index

pm2 save
