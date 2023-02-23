#!/bin/bash

if [ $UID == 0 ]; then
    echo "Must not be root for user"
    exit 1
elif [ $UID != 0 ];
then
    echo "User has not root privileges"

    read -r -p "Install ZSH ? (y|n) : " choiceZSH
    #to lowercase
    choiceZSH = $(echo $choiceZSH | tr [:upper:] [:lower:])

    if [ "$choiceZSH" == "y" ];
    then
        sudo apt install zsh -y   
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
    
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    #clean-up a bit
    cd ..
    rm -rf fonts
    
    echo "--------------------------------"
    
    echo "Copying the .zshrc into $HOME"
    
    cp -i ./.zshrc $HOME
    
    echo "Copying done !"

    echo "--------------------------------"

    echo "Running a zsh shell with the command : zsh\n"

    echo "Visit https://ohmyz.sh/ if you want to browse the theme and plugins\n"

    exit 0
    
fi
