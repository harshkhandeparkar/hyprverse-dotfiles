# Remove existing config directories
remove_dirs() {
	# .config
	mv -r ~/.config/cava ~/.config/cava.old
	mv -r ~/.config/eww ~/.config/eww.old
	mv -r ~/.config/hypr ~/.config/hypr.old
	mv -r ~/.config/rofi ~/.config/rofi.old
	mv -r ~/.config/swaylock ~/.config/swaylock.old
	mv -r ~/.config/swaync ~/.config/swaync.old
	mv -r ~/.config/kitty ~/.config/kitty.old
	mv -r ~/.config/fastfetch ~/.config/fastfetch.old
	mv ~/.config/rofimoji.rc ~/.config/rofimoji.rc.old

	# ZSH
	mv ~/.config/starship.toml ~/.config/starship.toml.old
	mv ~/.zshrc ~/.zshrc.old
	mv ~/.zshenv ~/.zshenv.old
	mv ~/.zshbindings ~/.zshbindings.old
	mv ~/.zshaliases ~/.zshaliases.old

	sudo mv /etc/sddm.conf /etc/sddm.conf.old
	sudo mv -r /etc/sddm-themes /etc/sddm-themes.old
}

# $1: command for installing
install() {
	# .config
	$1 ./cava ~/.config/
	$1 ./eww ~/.config/
	$1 ./hypr ~/.config/
	$1 ./rofi ~/.config/
	$1 ./swaylock ~/.config/
	$1 ./swaync ~/.config/
	$1 ./kitty ~/.config/
	$1 ./fastfetch ~/.config/
	$1 ./rofimoji/rofimoji.rc ~/.config/rofimoji.rc

	# ZSH
	$1 ./zsh/starship.toml ~/.config/starship.toml
	$1 ./zsh/.zshrc ~/.zshrc
	$1 ./zsh/.zshenv ~/.zshenv
	$1 ./zsh/.zshbindings ~/.zshbindings
	$1 ./zsh/.zshaliases ~/.zshaliases

	sudo $1 ./sddm/sddm.conf /etc/sddm.conf
	sudo cp -r ./sddm/themes /etc/sddm-themes
}

if [[ "$1" == "--copy" ]];
then
	remove_dirs
	install "cp -r"
else
	remove_dirs
	install "ln -srf"
fi
