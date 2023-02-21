#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Must be root for user : $USER\n"
    exit 1
elif [[ $UID == 0 ]];
then
    echo "User has root privileges\n"

    read -r -p "Install ZSH ? (y|n) : " choiceZSH
    #to lowercase
    choiceZSH = $(echo $choiceZSH | tr [:upper:] [:lower:])

    if [ "$choiceZSH" == "y" ];
    then
        apt install zsh -y   
    else
        echo "ZSH wasn't installed !\n" 
    fi

    read -r -p "Install Oh my zsh ? (y|n) : " choiceOHMYZSH
    #to lowercase
    choiceOHMYZSH = $(echo $choiceOHMYZSH | tr [:upper:] [:lower:])

    if [ "$choiceOHMYZSH" == "y" ];
    then
        sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    else
        echo "Oh My ZSH wasn't installed !\n"
    fi

    read -r -p "Install auto suggestions (recommended) ? (y|n) : " choiceAutoSg
    #to lowercase
    choiceAutoSg = $(echo $choiceAutoSg | tr [:upper:] [:lower:])

    if [ "$choiceAutoSg" == "y" ];
    then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    else
        echo "Auto suggestions wasn't installed !\n"
    fi

    read -r -p "Install syntax higlight (recommended) ? (y|n) : " choiceSyntHighlgt
    #to lowercase
    choiceSyntHighlgt = $(echo $choiceSyntHihglgt | tr [:upper:] [:lower:])

    if [ "$choiceSyntHighlgt" == "y" ];
    then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi

    read -r -p "Install fzf (recommended file finder) ? (y|n) : " choiceFZF
    #to lowercase
    choiceFZF = $(echo $choiceFZF | tr [:upper:] [:lower:])

    if [ "$choiceFZF" == "y" ];
    then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    else
        echo "FZF wasn't installed !\n"
    fi

    echo "--------------------------------"

    echo "Memet config plugins : git, zsh-autosuggestions, colored-man-pages
    , command-not-found, zsh-syntax-highlighting, fzf, web-search\n"

    read -r -p "Do you want the memet config ? (y|n) : " choiceMemetConfig
    #to lowercase
    choiceMemetConfig = $(echo $choiceMemetConfig | tr [:upper:] [:lower:])

    if [ "$choiceMemetConfig" == "y" ];
    then
        wget "http://paste.staffe.net/raw/e7DfCFCfx0" -O ~/.zshrc
        git clone https://github.com/powerline/fonts.git --depth=1
        cd fonts
        ./install.sh
        #clean-up a bit
        cd ..
        rm -rf fonts

        echo "Memet config is setup with the theme Agnoster (installed the powerline fonts for it just before)"
    else
        echo "Memet config wasn't setup !\n"
    fi

    echo "Running a zsh shell with the command : zsh\n"

    echo "If there's a problem with some plugins for the memet config, you have to installed all 
    of the plugins proposed here or delete the lines in the .zshrc file (in your home directory)"

    echo "Visit https://ohmyz.sh/ if you want to browse the theme and plugins\n"

    exit 0
    
fi
