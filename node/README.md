# my way of node installation

1. install nvm from brew
```
brew install nvm
```

2. create ~/.nvm directory
```
mkdir ~/.nvm
```

3. add to .zshrc lines as written in ```brew info nvm```

3.1 create list of default system packages
```
touch $NVM_DIR/default-packages
echo "yarn" > $NVM_DIR/default-packages
```

4. install required version
```
nvm ls-remote --lts

nvm install --lts=Dubnium # install latest available version for lts Dubnium
nvm install 10            # the same

nvm install --lts     # install latest lts
nvm install 12        # the same

nvm use --lts=Dubnium # use Dubnium lts
nvm use --lts         # use latest lts

nvm ls # view current installed and used versions

nvm install-latest-npm
```