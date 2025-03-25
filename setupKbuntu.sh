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
sudo usermod -aG plugdev $LOGNAME

# configure grub
GRUB_FILE="/etc/default/grub"
BACKUP_FILE="/etc/default/grub.bak"
echo "Creating a backup of the current GRUB configuration..."
sudo cp $GRUB_FILE $BACKUP_FILE
echo "Modifying GRUB configuration..."
sudo sed -i 's/GRUB_CMDLINE_LINUX="/&acpi_osi=\Windows2022 /' $GRUB_FILE
echo "Updating GRUB..."
sudo update-grub


# install gh
sudo apt install -y gh && gh auth login
gh extension install github/gh-copilot
gh extension upgrade gh-copilot
echo 'eval "$(gh copilot alias -- bash)"' >> ~/.bashrc

sudo apt-get install -y xclip
sudo apt-get install -y xsel
sudo apt install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo echo "emulate sh -c 'source /etc/profile'" >> etc/zsh/zprofile

# install programming tools
sudo apt install build-essential
sudo apt install -y git docker
sudo apt install -y mysql-server mongodb-org
sudo apt install -y python3-pip python3-venv
sudo apt install pipx
sudo apt install jupyter-notebook
sudo snap install arduino-cli
sudo apt-get install android-sdk-platform-tools-common

# Mongodb
sudo apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# installs nvm and node
sudo apt remove nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

# Go
sudo snap install go --classic
go install github.com/jesseduffield/lazygit@latest

#Install Vietnamese and Japanese input method
echo | sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install -y ibus ibus-bamboo ibus-mozc --install-recommends
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo', 'mozc-jp']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo'), ('ibus', 'mozc-jp')]"

# install neovim
sudo snap install nvim --classic --edge

# ghostty
sudo snap install ghostty --classic

# install ollama and stablecode
curl -fsSL https://ollama.com/install.sh | sh

# install flatpak and flathub
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.gdevelop.ide
flatpak install flathub com.usebottles.bottles

#VScode
sudo snap install code --classic

# install wine
sudo apt install wine32 wine64 winetricks
winetricks corefonts
sudo mkdir -p ~/opt/wine-stable/share/wine/gecko
sudo wget -O ~/opt/wine-stable/share/wine/gecko/wine-gecko-2.47.1-x86.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.msi
sudo wget -O ~/opt/wine-stable/share/wine/gecko/wine-gecko-2.47.1-x86_64.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86_64.msi

# Install dotfiles
git clone --depth 1 https://github.com/brianhuster/dotfiles
cd dotfiles
bash install.sh
cd -

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

# autopress
chmod +x my-bash-script/autopress.sh
sudo mv my-bash-script/autopress.sh /usr/local/bin/autopress

# config touchpad
sudo apt install touchpad-indicator
# Then open touchpad-indicator to disable touchpad when mouse is plugged in
