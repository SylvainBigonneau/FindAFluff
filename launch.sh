sudo systemctl stop chien_ou_chat.service
mix deps.get --only prod
MIX_ENV=prod mix compile
cd assets
npm install
MIX_ENV=prod webpack -p
cd ..
MIX_ENV=prod mix phx.digest
MIX_ENV=prod mix release
sudo systemctl start chien_ou_chat.service
