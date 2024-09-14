# add repository for Intel graphic drivers
wget -qO - https://repositories.intel.com/gpu/intel-graphics.key | \
  sudo gpg --yes --dearmor --output /usr/share/keyrings/intel-graphics.gpg
echo "deb [arch=amd64,i386 signed-by=/usr/share/keyrings/intel-graphics.gpg] https://repositories.intel.com/gpu/ubuntu jammy client" | \
  sudo tee /etc/apt/sources.list.d/intel-gpu-jammy.list
sudo apt update
sudo apt install -y \
  intel-opencl-icd intel-level-zero-gpu level-zero \
  intel-media-va-driver-non-free libmfx1 libmfxgen1 libvpl2 \
  libegl-mesa0 libegl1-mesa libegl1-mesa-dev libgbm1 libgl1-mesa-dev libgl1-mesa-dri \
  libglapi-mesa libgles2-mesa-dev libglx-mesa0 libigdgmm12 libxatracker2 mesa-va-drivers \
  mesa-vdpau-drivers mesa-vulkan-drivers va-driver-all vainfo hwinfo clinfo

sudo apt install curl
sudo apt install lm-sensors
sudo apt install ubuntu-restricted-extras
sudo usermod -a -G dialout $USER

# configure grub
GRUB_FILE="/etc/default/grub"
BACKUP_FILE="/etc/default/grub.bak"
echo "Creating a backup of the current GRUB configuration..."
sudo cp $GRUB_FILE $BACKUP_FILE
echo "Modifying GRUB configuration..."
sudo sed -i 's/GRUB_CMDLINE_LINUX="/&acpi_osi=\Windows2022 /' $GRUB_FILE
echo "Updating GRUB..."
sudo update-grub


# install gh copilot
sudo apt install -y gh && gh auth login
gh extension install github/gh-copilot
gh extension upgrade gh-copilot
echo 'eval "$(gh copilot alias -- bash)"' >> ~/.bashrc

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit

sudo apt-get install -y xclip
sudo apt-get install -y xsel

# install programming tools
sudo apt install build-essential ccls
sudo apt install -y git docker
sudo apt install -y mysql-server mongodb-org
sudo apt install -y python3-pip python3-venv
sudo apt install pipx
sudo apt install jupyter-notebook
sudo snap install arduino-cli

# Mongodb
sudo apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# install Hack Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip
rm Hack.zip
mkdir -p ~/.local/share/fonts/
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
npm install -g prettier
npm install -g tree-sitter-cl

#Install Vietnamese and Japanese input method
echo | sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install -y ibus ibus-bamboo ibus-mozc --install-recommends
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo', 'mozc-jp']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo'), ('ibus', 'mozc-jp')]"

# install neovim
sudo snap install nvim --classic

# install ollama and stablecode
curl -fsSL https://ollama.com/install.sh | sh
ollama pull stable-code

# install flatpak and flathub
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.gdevelop.ide
flatpak install flathub com.brave.Browser
flatpak install flathub com.usebottles.bottles

#VScode
sudo snap install code --classic

#Jekyll
sudo apt-get install ruby-full zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler

# install wine
sudo apt install wine32 wine64 winetricks
winetricks corefonts
sudo mkdir -p ~/opt/wine-stable/share/wine/gecko
sudo wget -O ~/opt/wine-stable/share/wine/gecko/wine-gecko-2.47.1-x86.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.msi
sudo wget -O ~/opt/wine-stable/share/wine/gecko/wine-gecko-2.47.1-x86_64.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86_64.msi

# install other apps
sudo snap install spotify
sudo apt install xdotool
sudo apt install kdenlive
sudo apt install obs-studio

# install onlyofficex
sudo apt-get install ttf-mscorefonts-installer
sudo snap install onlyoffice-desktopeditors

# install newest kde desktop
sudo add-apt-repository ppa:kubuntu-ppa/backports-extra && sudo apt full-upgrade -y

# config touchpad
sudo apt install touchpad-indicator
# Then open touchpad-indicator to disable touchpad when mouse is plugged in
