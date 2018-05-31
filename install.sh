# 

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node  
echo 'export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node' >> ~/.profile   

nvm install 8
nvm install 10
nvm alias default 8
touch ~/.npmrc
echo 'registry=http://r.cnpmjs.org/' >> ~/.npmrc
nvm use 8
npm set registry https://registry.npm.taobao.org # 注册模块镜像
npm set disturl https://npm.taobao.org/dist # node-gyp 编译依赖的 node 源码镜像

## 以下选择添加
npm set chromedriver_cdnurl http://cdn.npm.taobao.org/dist/chromedriver # chromedriver 二进制包镜像
npm set operadriver_cdnurl http://cdn.npm.taobao.org/dist/operadriver # operadriver 二进制包镜像
npm set phantomjs_cdnurl http://cdn.npm.taobao.org/dist/phantomjs # phantomjs 二进制包镜像
npm set fse_binary_host_mirror https://npm.taobao.org/mirrors/fsevents # fsevents 二进制包
npm set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass # node-sass 二进制包镜像
npm set electron_mirror http://cdn.npm.taobao.org/dist/electron/ # electron 二进制包镜像

npm cache clean # 清空缓存
