### Custom aliases
alias d1='clear && echo "---LSBLK---" && lsblk -e 7 && echo "---VGS---" && vgs && echo "---LVS---" && lvs && echo "---DUF---" && duf -only local'
alias lvm='clear && vgs && echo && lvs'
alias c='clear'
alias du1='du -ha --max-depth=1 | sort -rh|head'
alias du2='du -ha --max-depth=1 | sort -rh'
alias fzf="fzf --preview 'cat {}'"
#alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"

### Standart commands finish
alias grep='grep --color=always'
alias cp='cp -r'
alias scp='scp -r'
alias rm='rm -rv'
alias mkdir='mkdir -p'
alias vim='vim -O'
alias exa='exa --long --group-directories-first --all'
alias e='ls -lha --color --group-directories-first'
alias ccze='ccze -A'
alias brc='source ~/.bashrc'
alias fd='fdfind -Hi'
alias tree1='find . | sort | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias tree2="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

### beep an the end of commands
alias beep='echo $'\a''

hash colordiff 2>/dev/null && alias diff='colordiff'

### GRC - colored terminal output (apt install grc)
#if [ ! -f /usr/bin/grc ] ; then
# export PATH="/usr/local/bin/:$PATH" && grc_file=/usr/local/bin/grc
#else
# grc_file=/usr/bin/grc
#fi

GRC="$(which grc)"
if [ -f "${GRC}" ]; then
    alias env="grc --colour=auto env"
    alias diff="grc --colour=auto diff"
    alias mount="grc --colour=auto mount"
    alias findmnt="grc --colour=auto findmnt"
    alias showmount="grc --colour=auto showmount"
    alias ss="grc --colour=auto ss"
    alias netstat="grc --colour=auto netstat"
    alias ping="grc --colour=auto ping"
    alias dig="grc --colour=auto dig"
    alias ip="grc --colour=auto ip"
    alias ifconfig="grc --colour=auto ifconfig"
    alias iptables="grc --colour=auto iptables"
    alias mtr="grc --colour=auto mtr"
    alias tcpdump="grc --colour=auto tcpdump"
    alias traceroute="grc --colour=auto traceroute"
    alias sysctl="grc --colour=auto sysctl"
    alias systemctl="grc --colour=auto systemctl"
    alias journalctl="grc --colour=auto journalctl"
    alias stat="grc --colour=auto stat"
    alias id="grc --colour=auto id"
    alias ls="grc --colour=auto ls"
    alias last="grc --colour=auto last"
    alias w="grc --colour=auto w"
    alias who="grc --colour=auto who"
    alias uptime="grc --colour=auto uptime"
    alias lsblk="grc --colour=auto lsblk"
    alias blkid="grc --colour=auto blkid"
    alias tune2fs="grc --colour=auto tune2fs"
    alias lsof="grc --colour=auto lsof"
    alias df="grc --colour=auto df"
    alias du="grc --colour=auto du"
    alias fdisk="grc --colour=auto fdisk"
    alias ps="grc --colour=auto ps"
    alias free="grc --colour=auto free"
fi

#### Функция поиска пакетов через FZF
function fzf-pkg() {
# значение переменной $os_ver беру из файла dynmotd.sh
#os_ver="$(hostnamectl |grep -i "operating"|awk '{print $3}')"
#os_ver="${os_ver,,}"

if [[ "${OS_VER}" == "ubuntu" ]] || [[ "${OS_VER}" == "debian" ]] ; then
apt-cache search '' \
| sort \
| cut --delimiter ' ' --fields 1 \
| fzf --multi --cycle --reverse --preview 'apt-cache show {1}' \
| xargs -r sudo apt install -y
else
yum search '' \
| sort \
| cut --delimiter ' ' --fields 1 \
| fzf --multi --cycle --reverse --preview 'yum info {1}' \
| xargs -r sudo yum install -y
fi
}

### weather function
function weather() {
     curl -s --connect-timeout 3 -m 5 http://wttr.in/$1; 
}