sudo apt install ansible

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

# Mongodb
sudo apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

curl https://mise.run | sh
mise install node

# Coccoc
curl https://browser-linux.coccoc.com/deb/public.gpg | sudo gpg --yes --dearmor -o /etc/apt/trusted.gpg.d/coccoc-browser.gpg
echo "deb [arch=any] https://browser-linux.coccoc.com/deb/ stable main" | sudo tee /etc/apt/sources.list.d/coccoc-browser.list > /dev/null
sudo apt update
sudo apt install -y coccoc-browser-stable

# Go
sudo snap install go --classic

# install neovim
sudo snap install nvim --classic --edge

# ghostty
sudo snap install ghostty --classic

# install ollama and stablecode
curl -fsSL https://ollama.com/install.sh | sh

# config touchpad
sudo apt install touchpad-indicator
# Then open touchpad-indicator to disable touchpad when mouse is plugged in

ansible-playbook playbook.yml -K -vvvv
