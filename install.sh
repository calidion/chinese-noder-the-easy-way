# 

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node  
echo 'export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node' >> ~/.profile   

nvm install 6
nvm install 7
nvm alias default 6
touch ~/.npmrc
echo 'registry=http://r.cnpmjs.org/' >> ~/.npmrc
