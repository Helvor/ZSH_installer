#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

ZSH_CONFIG="git"

syntax_higlighter_activator=""

if [[ $UID == 0 ]]; then
    echo -e "${RED}Must not be root - Login to another account or don't use sudo${NC}"

    exit 1

elif [[ $UID != 0 ]];
then
    echo -e "${GREEN}User has not root privileges${NC}"

    read -r -p "Install ZSH ? (y|n) : " choiceZSH

    if [ "${choiceZSH,,}" == "y" ];
    then
        sudo apt install zsh -y

        echo -e "${GREEN}ZSH installed !${NC}"
    else
        echo -e "${RED}ZSH wasn't installed !${NC}" 
    fi

    read -r -p "Install Oh my zsh ? (y|n) : " choiceOHMYZSH

    if [ "${choiceOHMYZSH,,}" == "y" ];
    then
        sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

        echo -e "${GREEN}Oh My Zsh installed !${NC}"

        read -r -p "Do you want to install the fonts for the theme ? (recommended) (y|n) : " choiceFONTS

        if [ "${choiceFONTS,,}" =="y" ];
        then
            git clone https://github.com/powerline/fonts.git --depth=1
            cd fonts
            ./install.sh
            #clean-up a bit
            cd ..
            rm -rf fonts

            echo -e "${GREEN}Powerline fonts installed !${NC}"
        else
            echo -e "${RED}Fonts not installed !${NC}"
        fi

        
    else
        echo -e "${RED}Oh My ZSH wasn't installed !${NC}"
    fi

    read -r -p "Install auto suggestions (recommended) ? (y|n) : " choiceAutoSg

    if [ "${choiceAutoSg,,}" == "y" ];
    then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

        ZSH_CONFIG="$ZSH_CONFIG zsh-autosuggestions"

        echo -e "${GREEN}Auto suggestions installed !${NC}"
    else
        echo -e "${RED}Auto suggestions wasn't installed !${NC}"
    fi

    read -r -p "Install syntax higlight (recommended) ? (y|n) : " choiceSyntHighlight

    if [ "${choiceSyntHighlight,,}" == "y" ];
    then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        
        ZSH_CONFIG="$ZSH_CONFIG zsh-syntax-highlighting"

        syntax_higlighter_activator="on"

        echo -e "${GREEN}Syntax highligter installed !${NC}"
    else
        echo -e "${RED}Syntax highlight wasn't installed !${NC}"
    fi

    read -r -p "Install fzf (recommended file finder) ? (y|n) : " choiceFZF

    if [ "${choiceFZF,,}" == "y" ];
    then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
        
        ZSH_CONFIG="$ZSH_CONFIG fzf"

        echo -e "${GREEN}FZF installed !${NC}"
    else
        echo -e "${RED}FZF wasn't installed !${NC}"
    fi

    echo -e "\n------------------------------------------------\n"

    echo -e "${GREEN}Running a zsh shell with the command : zsh${NC}\n"

    echo -e "Visit ${GREEN}https://ohmyz.sh/${NC} if you want to browse the themes and plugins\n"

    read -r -p "Do you want to replace the blank config with the config in this github ? (y|n) " choiceCONFIG

    if [ "${choiceCONFIG,,}" == "y" ];
    then
        echo -e "\n${GREEN}replacing .zshrc into${NC} -> $HOME/.zshrc \n"
    else
        echo -e "\n${RED}Blank config was'nt replaced !${NC}\n"
    fi

    echo -e "${GREEN}Your configuration for the plugins :${NC} plugins=($ZSH_CONFIG)\n"

    if [ "${syntax_higlighter_activator,,}" == "on" ];
    then
        echo -e "${GREEN}Since syntax higlighter is installed, you have to copy this line into your $HOME/.zshrc${NC} \n -> ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)\n"
    fi

    exit 0
    
fi
