## config

```commandline
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

atlassian doc -  https://www.atlassian.com/git/tutorials/dotfiles
another example - https://medium.com/@simontoth/best-way-to-manage-your-dotfiles-2c45bb280049

#### warp command line tool
[warp](https://www.warp.dev/)

