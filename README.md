# chinese-noder-the-easy-way
对于中国的开发者来说，快速搭建一个开发环境的指导及脚本（基于Linux，测试平台Ubuntu）


# 一次性脚本安装

```
curl -o- https://raw.githubusercontent.com/calidion/chinese-noder-the-easy-way/master/install.sh | bash
```
或者
```
wget -qO- https://raw.githubusercontent.com/calidion/chinese-noder-the-easy-way/master/install.sh | bash

```

# 详细分步骤安装

## 1. 安装nvm


### 基于curl安装

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
```
### 基于wget安装

```bash

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

```

## 2.进入nvm环境

在命令行里打入如下命令

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
```

打入<code>nvm</code>命令，得到下面的结果，则表明安装成功！

```bash

$ nvm

Node Version Manager

Note: <version> refers to any version-like string nvm understands. This includes:
  - full or partial version numbers, starting with an optional "v" (0.10, v0.1.2, v1)
  - default (built-in) aliases: node, stable, unstable, iojs, system
  - custom aliases you define with `nvm alias foo`

 Any options that produce colorized output should respect the `--no-colors` option.

Usage:
  nvm --help                                Show this message
  nvm --version                             Print out the latest released version of nvm
  nvm install [-s] <version>                Download and install a <version>, [-s] from source. Uses .nvmrc if available
    --reinstall-packages-from=<version>     When installing, reinstall packages installed in <node|iojs|node version number>
    --lts                                   When installing, only select from LTS (long-term support) versions
    --lts=<LTS name>                        When installing, only select from versions for a specific LTS line
  nvm uninstall <version>                   Uninstall a version
  nvm uninstall --lts                       Uninstall using automatic LTS (long-term support) alias `lts/*`, if available.
  nvm uninstall --lts=<LTS name>            Uninstall using automatic alias for provided LTS line, if available.
  nvm use [--silent] <version>              Modify PATH to use <version>. Uses .nvmrc if available
    --lts                                   Uses automatic LTS (long-term support) alias `lts/*`, if available.
    --lts=<LTS name>                        Uses automatic alias for provided LTS line, if available.
  nvm exec [--silent] <version> [<command>] Run <command> on <version>. Uses .nvmrc if available
    --lts                                   Uses automatic LTS (long-term support) alias `lts/*`, if available.
    --lts=<LTS name>                        Uses automatic alias for provided LTS line, if available.
  nvm run [--silent] <version> [<args>]     Run `node` on <version> with <args> as arguments. Uses .nvmrc if available
    --lts                                   Uses automatic LTS (long-term support) alias `lts/*`, if available.
    --lts=<LTS name>                        Uses automatic alias for provided LTS line, if available.
  nvm current                               Display currently activated version
  nvm ls                                    List installed versions
  nvm ls <version>                          List versions matching a given <version>
  nvm ls-remote                             List remote versions available for install
    --lts                                   When listing, only show LTS (long-term support) versions
  nvm ls-remote <version>                   List remote versions available for install, matching a given <version>
    --lts                                   When listing, only show LTS (long-term support) versions
    --lts=<LTS name>                        When listing, only show versions for a specific LTS line
  nvm version <version>                     Resolve the given description to a single local version
  nvm version-remote <version>              Resolve the given description to a single remote version
    --lts                                   When listing, only select from LTS (long-term support) versions
    --lts=<LTS name>                        When listing, only select from versions for a specific LTS line
  nvm deactivate                            Undo effects of `nvm` on current shell
  nvm alias [<pattern>]                     Show all aliases beginning with <pattern>
  nvm alias <name> <version>                Set an alias named <name> pointing to <version>
  nvm unalias <name>                        Deletes the alias named <name>
  nvm reinstall-packages <version>          Reinstall global `npm` packages contained in <version> to current version
  nvm unload                                Unload `nvm` from shell
  nvm which [<version>]                     Display path to installed node version. Uses .nvmrc if available
  nvm cache dir                             Display path to the cache directory for nvm
  nvm cache clear                           Empty cache directory for nvm

Example:
  nvm install v0.10.32                  Install a specific version number
  nvm use 0.10                          Use the latest available 0.10.x release
  nvm run 0.10.32 app.js                Run app.js using node v0.10.32
  nvm exec 0.10.32 node app.js          Run `node app.js` with the PATH pointing to node v0.10.32
  nvm alias default 0.10.32             Set default node version on a shell

Note:
  to remove, delete, or uninstall nvm - just remove the `$NVM_DIR` folder (usually `~/.nvm`)

```
这时你就可以安装node.js了。
我们选择使用nvm的原因是nvm可以快速的切换node.js版本，方便你的开发与测试

## 3. 几个重要的nvm命令
在上面列举出来的一些命令中，下面几个比常用：

1. <code>nvm ls</code>列举安装的node.js版本

2. <code>nvm ls-remote</code>查看所有的node.js版本，需要联网

3. <code>nvm alias</code>指定别名，特别是用于设置默认的node.js版本时特别有用

4. <code>nvm install</code>安装新的node版本

下面我们就要使用这些命令配置我们的运行环境。


## 4. 安装node

默认情况下，我会认为你的网络环境不会太好。
当我们执行:

```bash
nvm ls-remote
```

可能会半天没有结果。

所以我们通常需要在环境变量里加入淘宝的镜像，所以需要执行如下的脚本：

```bash
# 加入到当前的环境
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node  

# 加入启动脚本上
echo 'export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node' >> ~/.profile   
```

这时我们执行

```bash
nvm ls-remote
```
就可以得到正常的结果了。
选择一个适合的版本安装即可。比如6

```bash
nvm install 6
```

这时候node6的是高版本就会被安装。如果你想安装6的指定版本，可以这样安装：

```bash
nvm install v6.10.1
```

这时我们执行，


```bash
nvm use v6.10.1
```


就可以进入到v6.10.1的环境里了。
这时打入node，应该就会进入node的REPL环境了。

## 5. 配置npm

如果这个时候你执行<code>npm install</code>，你会发现非常慢。
这时你需要创建一个<code>~/.npmrc</code>文件. 
并输入如下的内容： 

```
registry=http://r.cnpmjs.org/
```

保存后再执行<code>npm installl</code>就会发现速度快了很多。

## 6. 小结

由于你懂的原因，国内的网络环境是非常差的。对于nodejs开发者来说，经常需要重新配置环境，这里记录的是经常会使用的内容，方便重装时提高速度。

