#!/usr/bin/bash



REPO_BASE_URL='https://github.com/vortexdude/'
REPOS=
NERDFONT_URL='https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip'
REQUIRED_PYTHON=3.11

install_base_packages(){
	sudo apt update -y && \
	sudo apt-get install git curl 
	sudo add-apt-repository ppa:${repo}/ppa
  	sudo apt update -y
}

install_python(){
	sudo apt install -y python${REQUIRED_PYTHON} \
    python${REQUIRED_PYTHON}-distutils \
    python${REQUIRED_PYTHON}-venv
    echo "Installing pip3"
    python3_bin=$(which python3)
    curl -sS https://bootstrap.pypa.io/get-pip.py | "${python3_bin}"
}


setup_nerdfont(){
	curl $NERDFONT_URL -L -o /tmp/JetBrainsMono.zip 
	mkdir -p ~/.local/share/fonts/
	unzip /tmp/JetBrainsMono.zip ~/.local/share/fonts/
}

install_startship(){
	curl -sS https://starship.rs/install.sh | sh
	echo 'eval "$(starship init bash)"' >> ~/.bashrc
}


def main(){
	install_base_packages
	install_python
	setup_nerdfont
	install_startship
	dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
	echo -e "PLease Re open the terminal"
}


main