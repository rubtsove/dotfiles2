

# Системные переменные
APT_PACKAGES="vim,wget,curl,htop,lnav,tree,ccze,needrestart,python3,git,unzip,iproute2,bash-completion"
YUM_PACKAGES="vim,wget,curl,htop,lnav,tree,ccze,needrestart,python3,mtr,git,unzip,NetworkManager-tui,bash-completion"
OS_VER="$(hostnamectl |grep -i "operating"|awk '{print tolower($3)}')"
Field_Separator="$IFS"

if [[ "${OS_VER}" == "ubuntu" ]] || [[ "${OS_VER}" == "debian" ]] ; then
  PKG_MANAGER="apt" && SOURCE_PACKAGES="${APT_PACKAGES}"
else
  PKG_MANAGER="yum" && SOURCE_PACKAGES="${YUM_PACKAGES}"
fi

SOURCE_BASH_ALIASES="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.bash_aliases"
SOURCE_BASHRC="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.bashrc"
SOURCE_FUZZYSYS="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.fuzzy-sys.plugin.sh"
SOURCE_INPUTRC="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.inputrc"
SOURCE_PROFILE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.profile"
SOURCE_VIMRC="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.vimrc"

DYNMOTD_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/bins/dynmotd.sh"
DYNMOTD_DEST="/etc/profile.d/dynmotd.sh"

DEST_FOLDERS="$HOME/.config/,$HOME/.vim/autoload/"
DEST_BIN="/usr/bin"
DEST_LOCALBIN="/usr/local/bin"
DEST_BASH_COMPLETION="/etc/bash_completion.d"
DEST_MAN="/usr/share/man/man1"

CHT_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/cht.sh/cht.sh"
CHT_COMPL="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/cht.sh/chtsh.bash"

CHEAT_SOURCE="https://github.com/cheat/cheat/releases/download/4.2.3/cheat-linux-amd64.gz"
CHEAT_COMPL="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/cheat/cheat.bash"

SSS_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/bins/sss"

DUF_SOURCE_DEB="https://github.com/muesli/duf/releases/download/v0.7.0/duf_0.7.0_linux_amd64.deb"
DUF_SOURCE_RPM="https://github.com/muesli/duf/releases/download/v0.7.0/duf_0.7.0_linux_amd64.rpm"

PROCS_SOURCE_ARCH="https://github.com/dalance/procs/releases/download/v0.12.0/procs-v0.12.0-x86_64-lnx.zip"
PROCS_COMPL="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/procs/procs.bash"
PROCS_CONFIG="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/procs/config.toml"

GRC_SOURCE_ARCH="https://github.com/garabik/grc/archive/master.zip"

EXA_SOURCE_ARCH="https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip"

BTM_SOURCE_ARCH="https://github.com/ClementTsang/bottom/releases/download/0.6.6/bottom_x86_64-unknown-linux-gnu.tar.gz"
BTM_CONFIG="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/bottom/bottom.toml"

BAT_SOURCE="https://github.com/sharkdp/bat/releases/download/v0.19.0/bat-v0.19.0-x86_64-unknown-linux-musl.tar.gz"

FZF_BIN_SOURCE="https://github.com/junegunn/fzf/releases/download/0.29.0/fzf-0.29.0-linux_amd64.tar.gz"
FZF_MAN_SOURCE="https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf.1"
FZF_COMPL_SOURCE="https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash"
FZF_KEYS_SOURCE="https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash"

GDU_SOURCE="https://github.com/dundee/gdu/releases/download/v5.13.1/gdu_linux_amd64.tgz"

DISKUS_SOURCE="https://github.com/sharkdp/diskus/releases/download/v0.7.0/diskus-v0.7.0-x86_64-unknown-linux-musl.tar.gz"

FDFIND_SOURCE="https://github.com/sharkdp/fd/releases/download/v8.3.2/fd-v8.3.2-x86_64-unknown-linux-musl.tar.gz"

RIPGREP_SOURCE="https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz"

DS_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/bins/ds"

DOG_SOURCE="https://github.com/ogham/dog/releases/download/v0.1.0/dog-v0.1.0-x86_64-unknown-linux-gnu.zip"

TLDR_BIN_SOURCE="https://github.com/dbrgn/tealdeer/releases/download/v1.5.0/tealdeer-linux-x86_64-musl"
TLDR_COMPL_SOURCE="https://github.com/dbrgn/tealdeer/releases/download/v1.5.0/completions_bash"


# Пользовательске переменные
#DEST_FILES="\
#$HOME/.bash_aliases,\
#$HOME/.bashrc,\
#$HOME/.fuzzy-sys.plugin.sh,\
#$HOME/.inputrc,\
#$HOME/.profile,\
#$HOME/.vimrc"

#DYNMOTD_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/dynmotd.sh"
#GITHUB_PATH="https://raw.githubusercontent.com/rubtsove/dotfiles2/master/sources"
#CHT_SOURCE="${GITHUB_PATH}/.config/cht.sh/cht.sh"
#CHT_COMPL="${GITHUB_PATH}/.config/cht.sh/chtsh.bash"
#CHEAT_COMPL="${GITHUB_PATH}/.config/cheat/cheat.bash"
#SSS_SOURCE="${GITHUB_PATH}/.config/sss"
#PROCS_CONFIG="${GITHUB_PATH}/.config/procs/config.toml"
#PROCS_COMPL="${GITHUB_PATH}/.config/procs/procs.bash"
#BTM_CONFIG="${GITHUB_PATH}/.config/bottom/bottom.toml"
#DS_SOURCE="${GITHUB_PATH}/bins/ds"