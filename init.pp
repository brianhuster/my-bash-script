$packages = [
	'curl',
	'lm-sensors',
	'fish',
	'git',
	'python3-pip',
	'python3-venv',
	'pipx',
	'jupyter-notebook',
	'kdenlive', 'obs-studio',
	'gnupg',
	"fcitx5", "fcitx5-unikey", "fcitx5-mozc", "fcitx5-pinyin",
	"mysql-server",
	"nodejs", "npm",
	"golang",
	"gcc", "g++", "make",
	"neovim",
	"gh",
	'flatpak',
	'plasma-discover-backend-flatpak',
]

package { $packages:
	ensure => present,
}
