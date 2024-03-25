#!/bin/bash

set -x 

# change default shell to zsh
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/install

# install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/install/powerlevel10k
echo 'source ~/install/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc


# add dot files
cd ~/install/
git clone https://github.com/YuMS/dotfiles.git

for f in dotfiles/.*
do
  ln -sf ~/install/$f ~/
done
