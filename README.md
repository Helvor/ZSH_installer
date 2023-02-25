# ZSH_installer
Bash script for installing ZSH on debian 11 (because it's annoying to do it manually) it takes 2-4 min to do it

> If you don't like all the config from this github, you can change it in the **~/.zshrc** file in the *"prompt_context()"* function at the bottom

# Update v1.1
- Check if user is not root before installing
- Add color to see if a package was installed or not
- Choose for plugins : "auto-suggestions, syntax highlight, fzf"
- Can replace automaticaly the blank config with the .zshrc in this github
- Show the plugins parameters to put into the .zshrc with plugins that you choose
- Add warning for the arrow emoji problem


# Source for the package
- official site of OhMyZSH : https://ohmyz.sh/
- powerline fonts for the agnoster theme : https://github.com/powerline/fonts.git
- fzf - file finder : https://github.com/junegunn/fzf.git
- emoji from https://github.com/rothgar/zsh-emoji-aliases/blob/master/emoji.zsh
