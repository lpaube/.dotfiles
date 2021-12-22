git clone --bare git@github.com:lpaube/.dotfiles.git $HOME/.cfg

function config {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

#Creating alias and put in .bashrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'" >> $HOME/.bashrc

#Config git to not show unnecessary files
config config --local status.showUntrackedFiles no

#Creating backup dotfiles directory
mkdir -p .config-backup && config checkout 2>&1 \
| egrep "\s+" | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

#Get the dotfiles and self-destruct
config checkout
rm -rf $HOME/README.md $HOME/.install-config.sh
