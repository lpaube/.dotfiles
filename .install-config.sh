#Creating alias and put in .bashrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'" >> $HOME/.bashrc
source $HOME/.bashrc

function config {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

git clone --bare git@github.com:lpaube/.dotfiles.git $HOME/.cfg

#Config git to not show unnecessary files
config config --local status.showUntrackedFiles no

#Creating backup dotfiles directory
mkdir -p .config-backup && config checkout 2>&1 \
| egrep "\s+" | sed -n '1!p' | sed -n '$!p' | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

#Get the dotfiles and self-destruct
config checkout
#rm -rf $HOME/README.md $HOME/.install-config.sh
