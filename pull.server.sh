#!/bin/bash
npm run build
git add .

echo "Mensagem do commit: "
read message
git commit -am "$message"
git push
ssh 35.247.228.10 \
  'git -C /home/rob/api/' \
  'pull origin master && ' \
  'pm2 restart api && sudo systemctl restart nginx'
