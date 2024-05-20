sudo apt update && sudo apt upgrade -y

# install gh copilot
sudo apt install gh && gh auth login
gh extension install github/gh-copilot
gh extension upgrade gh-copilot
echo 'eval "$(gh copilot alias -- bash)"' >> ~/.bashrc

# install programming tools
sudo apt install build-essential
sudo apt install git
sudo apt install -y mysql-server
sudo apt install -y mongodb-org
sudo apt install -y python3-pip python3-venv

# installs nvm and node
sudo apt remove nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

#Install Vietnamese and Japanese input method
echo | sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install -y ibus ibus-bamboo ibus-mozc --install-recommends
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo', 'mozc-jp']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo'), ('ibus', 'mozc-jp')]"

#install neovim
sudo apt install neovim
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install ollama and stablecode
curl -fsSL https://ollama.com/install.sh | sh
ollama pull stable-code

# install flatpak and flathub
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#VScode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

#Jekyll
sudo apt-get install ruby-full zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler

#install gdevelop
flatpak install flathub io.gdevelop.ide

#teams
flatpak install -y flathub com.github.IsmaelMartinez.teams_for_linux

# config touchpad
sudo apt install touchpad-indicator
# Then open touchpad-indicator to disable touchpad when mouse is plugged in
