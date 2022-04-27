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
cat <<EOF > $(HOME)/.local/bin/lvim
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

# Tools

## Lazygit
```
git clone https://github.com/jesseduffield/lazygit.git
cd lazygit
go install
```

## Delta (git diff)
```
curl -L -o git-delta_0.12.1_amd64.deb https://github.com/dandavison/delta/releases/download/0.12.1/git-delta_0.12.1_amd64.deb
sudo dpkg -i git-delta_0.12.1_amd64.deb

```

## Configuration

### Delta
```
add delta to ~/.gitconfig

[core]
    pager = delta --side-by-side -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}

[pager]
  diff = delta --side-by-side -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}
  log = delta --side-by-side -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}
  reflog = delta --side-by-side -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}
  show = delta --side-by-side -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}

[core]
  pager = delta

[interactive]
  diffFilter = delta --color-only

[delta]
  side-by-side = true

```

### Lazygit
```

~/.config/jesseduffield/lazygit/config.yml
keybinding:
  universial:
    return 'c-\'
git:
  paging:
    colorArg: never
    pager: delta --dark --paging=never

```

