# This is a readme on how I setup my env on my laptop

## General

1. download a browser

## Keyboard

1. download and use colemak
1. add japanese keyboard
1. to have powershell
```powershell
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
```

## Linux Environment

Note: I recomment installing tmux first so you can do multiple things at once

### Setting up wsl linux

1. follow this `https://fireship.io/lessons/windows-10-for-web-dev/`

#### Initial stuff

1. `alias pkg="sudo apt"`
1. `pkg update -y && pkg upgrade -y`

#### Tmux

1. `pkg install -y tmux`

#### Github

Note: It is better to have gh installed and setup so you can use git immediately

1. `pkg install gh -y`
1. `gh auth login`

#### Getting dotfiles from repo

<https://www.atlassian.com/git/tutorials/dotfiles>

1. `pkg install git`
1. `alias config='$PREFIX/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
1. `echo ".cfg" >> .gitignore`
1. `git clone --bare https://github.com/m0nk3ybraindead/.dotenv.git $HOME/.cfg`
1. `alias config='$PREFIX/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
1. `config checkout`
1. `config config --local status.showUntrackedFiles no`
1. `config status`
1. **I am done**

### Setting up code environment

#### Cool stuff

1. `pkg install -y fzf tree neofetch`


#### Nvim

1. Move coc-settings.json and plugin/coc.vim
    * `nvimrc`
    * `mv {coc-settings.json,plugin/coc.vim} ..`
1. Installing Plugin Manager \
    `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
1. Installing Dependencies
    * Github Copilot `pkg install nodejs -y`
    * Coc nvim `pkg install nodejs -y`
    * Telescope `pkg install ripgrep -y`
1. Installing the Plugins
    * `:PlugInstall`
1. Setting up the plugins
    * Github Copilot `:Copilot Setup`
    * Coc `:CocInstall coc-pyright`
1. Putting back Coc
    * `mv ../coc-settings.json .`
    * `mv ../coc.vim plugin/.`

#### Python

1. `pkg install python3 -y`
1. `pkg install python3-pip -y`
1. `pip install pipenv`
