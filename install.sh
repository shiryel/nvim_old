SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

export red=`tput setaf 1`
export green=`tput setaf 2`
export reset=`tput sgr0`

if [ `whoami` == "root" ]; then
    mv $SCRIPTPATH ../nvim
    pacman -S powerline2 powerline-fonts fzf
else
    echo "${red}ERROR: Run with root${reset}"
fi

echo "${green}open nvim and run :PlugInstall${reset}"
