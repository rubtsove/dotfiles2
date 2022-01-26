

# Системные переменные
APT_PACKAGES="vim,wget,curl,htop,lnav,tree,ccze,needrestart,python3,git,unzip,net-tools"
YUM_PACKAGES="vim,wget,curl,htop,lnav,tree,ccze,needrestart,python3,mtr,git,unzip,net-tools"
OS_VER="$(hostnamectl |grep -i "operating"|awk '{print tolower($3)}')"
Field_Separator="$IFS"

if [[ "${OS_VER}" == "ubuntu" ]] || [[ "${OS_VER}" == "debian" ]] ; then
  PKG_MANAGER="apt" && SOURCE_PACKAGES="${APT_PACKAGES}" #&& color_font "Система у нас ${os_ver},а пакетный манагер у нас ${pkg_manager}"
else
  PKG_MANAGER="yum" && SOURCE_PACKAGES="${YUM_PACKAGES}" #&& color_font "Система у нас ${os_ver},а пакетный манагер у нас ${pkg_manager}"
fi

# Пользовательске переменные
DEST_FILES="\
$HOME/.bash_aliases,\
$HOME/.bashrc,\
$HOME/.fuzzy-sys.plugin.sh,\
$HOME/.inputrc,\
$HOME/.profile,\
$HOME/.vimrc"

DEST_FOLDERS="$HOME/.fzf/,$HOME/.config/,$HOME/.vim/autoload/"
DEST_BIN="/usr/bin"
DEST_LOCALBIN="/usr/local/bin"
DEST_BASH_COMPLETION="/etc/bash_completion.d"

GITHUB_PATH="https://raw.githubusercontent.com/rubtsove/dotfiles2/master/sources"

CHT_SOURCE="${GITHUB_PATH}/.config/cht.sh/cht.sh"
CHT_COMPL="${GITHUB_PATH}/.config/cht.sh/chtsh.bash"

CHEAT_SOURCE="https://github.com/cheat/cheat/releases/download/4.2.3/cheat-linux-amd64.gz"
CHEAT_COMPL="${GITHUB_PATH}/.config/cheat/cheat.bash"

SSS_SOURCE="${GITHUB_PATH}/.config/sss"

DYNMOTD_SOURCE="${GITHUB_PATH}/.config/dynmotd.sh"
DYNMOTD_DEST="/etc/profile.d/dynmotd.sh"

DUF_SOURCE_DEB="https://github.com/muesli/duf/releases/download/v0.7.0/duf_0.7.0_linux_amd64.deb"
DUF_SOURCE_RPM="https://github.com/muesli/duf/releases/download/v0.7.0/duf_0.7.0_linux_amd64.rpm"

PROCS_SOURCE_ARCH="https://github.com/dalance/procs/releases/download/v0.12.0/procs-v0.12.0-x86_64-lnx.zip"
PROCS_COMPL="${GITHUB_PATH}/.config/procs/procs.bash"
PROCS_CONFIG="${GITHUB_PATH}/.config/procs/config.toml"

GRC_SOURCE_ARCH="https://github.com/garabik/grc/archive/master.zip"

EXA_SOURCE_ARCH="https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip"

BTM_SOURCE_ARCH="https://github.com/ClementTsang/bottom/releases/download/0.6.6/bottom_x86_64-unknown-linux-gnu.tar.gz"
BTM_CONFIG="${GITHUB_PATH}/.config/bottom/bottom.toml"

BAT_SOURCE="https://github.com/sharkdp/bat/releases/download/v0.19.0/bat-v0.19.0-x86_64-unknown-linux-musl.tar.gz"

FZF_SOURCE="https://github.com/junegunn/fzf.git"
FZF_DIR="$HOME/.fzf"