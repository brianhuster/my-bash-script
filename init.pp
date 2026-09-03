$packages = [
	'curl',
	'lm-sensors',
	'ubuntu-restricted-extras',
	'fish',
	'build-essential',
	'git',
	'python3-pip',
	'python3-venv',
	'pipx',
	'jupyter-notebook',
	'flatpak',
	'plasma-discover-backend-flatpak',
	'kdenlive', 'obs-studio',
	'ttf-mscorefonts-installer',
	'gnupg',
	"fcitx5", "fcitx5-unikey", "fcitx5-mozc", "fcitx5-pinyin",
	"mysql-server",
	"nodejs", "npm",
	"golang-go",
	"neovim",
	"gh"
]

package { $packages:
	ensure => present,
}
