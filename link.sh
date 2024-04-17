# Remove existing config directories
remove_dirs() {
	# .config
	rm -r ~/.config/cava
	rm -r ~/.config/eww
	rm -r ~/.config/hypr
	rm -r ~/.config/rofi
	rm -r ~/.config/swaync
	rm -r ~/.config/kitty
	rm -r ~/.config/fastfetch
	rm ~/.config/rofimoji.rc
	rm -r ~/.config/nvim

	# ZSH
	rm ~/.config/starship.toml
	rm ~/.zshrc
	rm ~/.zshenv
	rm ~/.zshbindings
	rm ~/.zshaliases

	sudo rm /etc/sddm.conf
	sudo rm -r /etc/sddm-themes

	# Spotify flags (enables wayland native)
	sudo rm ~/.config/spotify-flags.conf
}

# $1: command for installing
install() {
	# .config
	$1 ./cava ~/.config/
	$1 ./eww ~/.config/
	$1 ./hypr ~/.config/
	$1 ./rofi ~/.config/
	$1 ./swaync ~/.config/
	$1 ./kitty ~/.config/
	$1 ./fastfetch ~/.config/
	$1 ./rofimoji/rofimoji.rc ~/.config/rofimoji.rc
	$1 ./nvim ~/.config/
	$1 ./spotify/-flags.conf ~/.config

	# ZSH
	$1 ./zsh/starship.toml ~/.config/starship.toml
	$1 ./zsh/.zshrc ~/.zshrc
	$1 ./zsh/.zshenv ~/.zshenv
	$1 ./zsh/.zshbindings ~/.zshbindings
	$1 ./zsh/.zshaliases ~/.zshaliases

	sudo $1 ./sddm/sddm.conf /etc/sddm.conf
	sudo cp -r ./sddm/themes /etc/sddm-themes

	# Spotify flags (enables wayland native)
	$1 ./spotify/spotify-flags.conf ~/.config/spotify-flags.conf
}

if [[ "$1" == "--copy" ]];
then
	remove_dirs
	install "cp -r"
else
	remove_dirs
	install "ln -srf"
fi
