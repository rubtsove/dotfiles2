

# Системные переменные
APT_PACKAGES="vim,wget,curl,htop,lnav,tree,ccze,needrestart,python3,git,unzip,iproute2,bash-completion,net-tools,ncat,smem"
YUM_PACKAGES="vim,wget,curl,htop,lnav,tree,ccze,needrestart,python3,mtr,git,unzip,NetworkManager-tui,bash-completion,smem"
OS_VER="$(hostnamectl |grep -i "operating"|awk '{print tolower($3)}')"
Field_Separator="$IFS"

if [[ "${OS_VER}" == "ubuntu" ]] || [[ "${OS_VER}" == "debian" ]] ; then
  PKG_MANAGER="apt" && SOURCE_PACKAGES="${APT_PACKAGES}"
else
  PKG_MANAGER="yum" && SOURCE_PACKAGES="${YUM_PACKAGES}"
fi

SOURCE_BASH_ALIASES="https://raw.githubusercontent.com/rubtsove/dotfiles/master/ascetic/.bash_aliases"
SOURCE_BASHRC="https://raw.githubusercontent.com/rubtsove/dotfiles/master/ascetic/.bashrc"
SOURCE_FUZZYSYS="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.fuzzy-sys.plugin.sh"
SOURCE_INPUTRC="https://raw.githubusercontent.com/rubtsove/dotfiles/master/ascetic/.inputrc"
SOURCE_PROFILE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/ascetic/.profile"
SOURCE_VIMRC="https://raw.githubusercontent.com/rubtsove/dotfiles/master/ascetic/.vimrc"

DYNMOTD_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/ascetic/dynmotd.sh"
DYNMOTD_DEST="/etc/profile.d/dynmotd.sh"

DEST_FOLDERS="$HOME/.config/,$HOME/.vim/autoload/"
DEST_BIN="/usr/bin"
DEST_LOCALBIN="/usr/local/bin"
DEST_BASH_COMPLETION="/etc/bash_completion.d"
DEST_MAN="/usr/share/man/man1"

#### Custom binaries in alphabet order

BAT_SOURCE="https://github.com/sharkdp/bat/releases/download/v0.21.0/bat-v0.21.0-x86_64-unknown-linux-musl.tar.gz"
BTM_SOURCE_ARCH="https://github.com/ClementTsang/bottom/releases/download/0.6.8/bottom_x86_64-unknown-linux-musl.tar.gz"
BTM_CONFIG="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/bottom/bottom.toml"

CHT_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/cht.sh/cht.sh"
CHT_COMPL="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/cht.sh/chtsh.bash"

CHEAT_SOURCE="https://github.com/cheat/cheat/releases/download/4.2.3/cheat-linux-amd64.gz"
CHEAT_COMPL="https://raw.githubusercontent.com/cheat/cheat/master/scripts/cheat.bash"
CHEATSHEETS_SOURCE="https://raw.githubusercontent.com/cheat/cheat/master/scripts/git/cheatsheets"

DISKUS_SOURCE="https://github.com/sharkdp/diskus/releases/download/v0.7.0/diskus-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
DOG_SOURCE="https://github.com/ogham/dog/releases/download/v0.1.0/dog-v0.1.0-x86_64-unknown-linux-gnu.zip"
DS_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/bins/ds"
DUF_SOURCE_DEB="https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb"
DUF_SOURCE_RPM="https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.rpm"

EXA_SOURCE_ARCH="https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip"

FDFIND_SOURCE="https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-v8.4.0-x86_64-unknown-linux-musl.tar.gz"
FZF_BIN_SOURCE="https://github.com/junegunn/fzf/releases/download/0.30.0/fzf-0.30.0-linux_amd64.tar.gz"
FZF_MAN_SOURCE="https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf.1"
FZF_COMPL_SOURCE="https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash"
FZF_KEYS_SOURCE="https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash"

GDU_SOURCE="https://github.com/dundee/gdu/releases/download/v5.14.0/gdu_linux_arm64.tgz"
GRC_SOURCE_ARCH="https://github.com/garabik/grc/archive/master.zip"

LF_SOURCE="https://github.com/gokcehan/lf/releases/download/r27/lf-linux-amd64.tar.gz"
LSCOLORS_SOURCE="https://github.com/sharkdp/lscolors/releases/download/v0.10.0/lscolors-v0.10.0-x86_64-unknown-linux-musl.tar.gz"

PROCS_SOURCE_ARCH="https://github.com/dalance/procs/releases/download/v0.12.3/procs-v0.12.3-x86_64-linux.zip"
PROCS_COMPL="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/procs/procs.bash"
PROCS_CONFIG="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/.config/procs/config.toml"

RIPGREP_SOURCE="https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz"

SSS_SOURCE="https://raw.githubusercontent.com/rubtsove/dotfiles/master/local/bins/sss"

TLDR_BIN_SOURCE="https://github.com/dbrgn/tealdeer/releases/download/v1.5.0/tealdeer-linux-x86_64-musl"
TLDR_COMPL_SOURCE="https://github.com/dbrgn/tealdeer/releases/download/v1.5.0/completions_bash"

VIVID_SOURCE="https://github.com/sharkdp/vivid/releases/download/v0.8.0/vivid-v0.8.0-x86_64-unknown-linux-musl.tar.gz"