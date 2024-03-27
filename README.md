![Zsh installer](https://i.imgur.com/PjYJfBb.png)
Bash script for installing ZSH on debian 11 (because it's annoying to do it manually) it takes 2-4 min to do it

you can just use this command :
```bash
wget https://raw.githubusercontent.com/Helvor/ZSH_installer/main/install_zsh.sh && bash install_zsh.sh && rm install_zsh.sh
```

> If you don't like all the config from this github, you can change it in the **~/.zshrc** file in the *"prompt_context()"* function at the bottom

![Update](https://i.imgur.com/Mr4XZmf.png)

## v1.1
- Add warning for the arrow emoji problem

## V1.0

- Check if user is not root before installing
- Add color to see if a package was installed or not
- Choose for plugins : "auto-suggestions, syntax highlight, fzf"
- Can replace automaticaly the blank config with the .zshrc in this github
- Show the plugins parameters to put into the .zshrc with plugins that you choose


![References](https://i.imgur.com/1AZrU2L.png) 
- official site of OhMyZSH : https://ohmyz.sh/
- powerline fonts for the agnoster theme : https://github.com/powerline/fonts.git
- fzf - file finder : https://github.com/junegunn/fzf.git
- emoji from https://github.com/rothgar/zsh-emoji-aliases/blob/master/emoji.zsh
