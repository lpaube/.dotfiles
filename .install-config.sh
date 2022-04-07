#Creating alias and put in .bashrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'" >> $HOME/.bashrc
source $HOME/.bashrc

function config {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

#Removing pre-existing $HOME/.cfg
rm -rf $HOME/.cfg

#Cloning
git clone --bare --branch test git@github.com:lpaube/.dotfiles.git $HOME/.cfg

#Config git to not show unnecessary files
config config --local status.showUntrackedFiles no

#Creating backup dotfiles directory
mkdir -p $HOME/.config-backup
mkdir -p $HOME/.config-backup/.config
mkdir -p $HOME/.config-backup/.config/i3
mkdir -p $HOME/.config-backup/.config/nvim
mkdir -p $HOME/.config-backup/.config/nvim/lua
mkdir -p $HOME/.config-backup/.config/nvim/lua/plugin
mkdir -p $HOME/.config-backup/.config/nvim/lua/user
mkdir -p $HOME/.config-backup/.config/nvim/lua/user/lsp
mkdir -p $HOME/.config-backup/.config/nvim/lua/user/lsp/settings

config checkout 2>&1 | egrep "\s+" | sed -n '1!p' | sed -n '$!p' | awk {'print $1'} | \
	xargs -I% mv $HOME/% $HOME/.config-backup/%

#Get the dotfiles and self-destruct
config checkout


#Download and install fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
