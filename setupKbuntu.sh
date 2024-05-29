# add repository for Linux graphic drivers
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt update && sudo apt upgrade -y

# install gh copilot
sudo apt install gh && gh auth login
gh extension install github/gh-copilot
gh extension upgrade gh-copilot
echo 'eval "$(gh copilot alias -- bash)"' >> ~/.bashrc

# install programming tools
sudo apt install build-essential
sudo apt install -y git docker
sudo apt install -y mysql-server mongodb-org
sudo apt install -y python3-pip python3-venv
pip install -y jupyterlab sckit-learn

# install Hack Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip
rm Hack.zip
mv *.ttf ~/.local/share/fonts/
fc-cache -fv

# set up Konsole terminal
if [[ $XDG_CURRENT_DESKTOP == *"KDE"* ]]; then
       sudo apt-get install konsole -y
       touch -p echo -e "[Appearance]\nFont=Hack Nerd Font,14,-1,5,50,0,0,0,0,0\n\n[General]\nName=Brianhuster\nParent=FALLBACK/" > ~/.local/share/konsole/Brianhuster.profile
       {
              echo "[Appearance]"
              echo "ColorScheme=Linux"
              echo "Font=Hack Nerd Font,14,-1,5,50,0,0,0,0,0"
              echo        
              echo "[General]"
              echo "Name=Brianhuster"
              echo "Parent=FALLBACK/"
       } > ~/.local/share/konsole/Brianhuster.profile
fi

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
sudo apt-get install software-properties-common
echo | sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
mkdir ~/.config
git clone https://github.com/brianhuster/neovim-config/
mv neovim-config nvim
mv nvim ~/.config

# install ollama and stablecode
curl -fsSL https://ollama.com/install.sh | sh
ollama pull stable-code

# install flatpak and flathub
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo apt install xdotool

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

#install from flatpak
flatpak install flathub io.gdevelop.ide
flatpak install -y flathub com.github.IsmaelMartinez.teams_for_linux

# install wine
sudo apt install wine32 wine64 winetricks
winetricks corefonts
sudo mkdir -p ~/opt/wine-stable/share/wine/gecko
sudo wget -O ~/opt/wine-stable/share/wine/gecko/wine-gecko-2.47.1-x86.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.msi
sudo wget -O ~/opt/wine-stable/share/wine/gecko/wine-gecko-2.47.1-x86_64.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86_64.msi

# config touchpad
sudo apt install touchpad-indicator
# Then open touchpad-indicator to disable touchpad when mouse is plugged in
