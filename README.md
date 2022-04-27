# lvim Configuration


# Setup

## Script to reset existing configuration 

```
cat << EOF > ~/reset-lvim.sh
#!/bin/bash

set -eo pipefail

# Set branch to master unless specified by the user
declare -r LV_BRANCH=rolling
declare -r LV_REMOTE=lunarvim/lunarvim.git
declare -r LUNARVIM_RUNTIME_DIR=~/.local/share/lunarvim


rm -rf ~/.local/share/lunarvim
rm -rf ~/.cache/nvim
rm -rf ~/.config/lvim/plugin

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    "\$LUNARVIM_RUNTIME_DIR/site/pack/packer/start/packer.nvim"

git clone --branch "\$LV_BRANCH" --depth 1 "https://github.com/\${LV_REMOTE}" "\$LUNARVIM_RUNTIME_DIR/lvim"
EOF
chmod +x ~/reset-lvim.sh
```
## Script to install lvim script
```
cat <<EOF > /home/pedro/.local/bin/lvim
#!/bin/sh

export LUNARVIM_CONFIG_DIR=\${HOME}/.config/lvim
export LUNARVIM_RUNTIME_DIR=\${HOME}/.local/share/lunarvim
exec nvim -u "\${HOME}/.local/share/lunarvim/lvim/init.lua" "\$@"
EOF
chmod +x /home/pedro/.local/bin/lvim
```

## Clone lvim configuration files
```
git clone --depth 1 git@github.com:PellePedro/lvim.git ~/.config/lvim
```
