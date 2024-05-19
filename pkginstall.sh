sudo apt update && sudo apt upgrade -y
sudo apt install git
sudo apt install -y npm

# install flatpak and flathub
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install gh copilot
sudo apt install gh && gh auth login
gh extension install github/gh-copilot
gh extension upgrade gh-copilot
echo 'eval "$(gh copilot alias -- bash)"' >> ~/.bashrc
