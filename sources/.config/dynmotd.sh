#!/bin/bash
clear
################ Начало блока переменных
#OS version
OS_VER="$(hostnamectl |grep -i "operating"|awk '{print tolower($3)}')"

#System date
DATEN="$(date +%H:%M-%d.%m.%y)"

#System load
LOAD1="$(cat /proc/loadavg | awk {'print $1'})"
LOAD5="$(cat /proc/loadavg | awk {'print $2'})"
LOAD15="$(cat /proc/loadavg | awk {'print $3'})"

#System uptime
uptime="$(cat /proc/uptime | cut -f1 -d.)"
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

#Root fs info
root_usage="$(df -h / | awk '/\// {print $4}'|grep -v "^$")"
fsperm=$(mount | grep root | awk '{print $6}' | awk -F"," '{print $1}')

#Memory Usage
memory_usage="$(free -m | awk '/Mem:/ { total=$2 } /buffers\/cache/ { used=$3 } END { printf("%3.1f%%", used/total*100)}')"
swap_usage="$(free -m | awk '/Swap/ { printf("%3.1f%%", $3/$2*100) }')"

#Users
users="$(users | wc -w)"
USER="$(whoami)"

#Processes
processes="$(ps aux | wc -l)"

#Interfaces
INTERFACE="$(ip -4 ad | grep 'state UP' | awk -F ":" '!/^[0-9]*: ?lo/ {print $2}')"

#Services
FIREWALL="firewalld,iptables,nftables"

Field_Separator="$IFS"
################ Конец блока переменных

### Colors
function in_script_colors {
if [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
  NOFORMAT='\e[0m' RED='\e[0;31m' GREEN='\e[0;32m' ORANGE='\e[0;33m' BLUE='\e[0;34m' PURPLE='\e[0;35m' CYAN='\e[0;36m' YELLOW='\e[0;33m' GREY='\e[0;37m'
else
  NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW='' GREY=''
fi
}
in_script_colors

### Функия повторения символа -
repeat () {
 for i in {1..100} ; do
   echo -ne "${BLUE}$1${NOFORMAT}"
 done
echo
}

###Main block
repeat "-"
echo -ne "${GREY}Системная информация на: ${NOFORMAT} ${RED}${DATEN}${NOFORMAT}\n"
echo -ne "${GREY}Аптайм Дней: ${NOFORMAT} ${RED}$upDays ${NOFORMAT} ${GREY}Часов: ${NOFORMAT} ${RED}$upHours ${NOFORMAT} ${GREY}Минут: ${RED}$upMins \n"
repeat "-"
echo -ne "${GREY}Количество ядер процессора: ${NOFORMAT} ${RED}$(cat /proc/cpuinfo | grep "^processor" |wc -l)${NOFORMAT}\n"
echo -ne "${GREY}Всего ОЗУ: ${NOFORMAT}${RED}$(cat /proc/meminfo |grep -i memtotal|awk '{print int($2/1000000+0.5)}')${NOFORMAT} ${GREY}GB\n"
repeat "-"
echo -ne "${GREY}System Load 1m: ${NOFORMAT}${RED}$LOAD1${NOFORMAT}\t ${GREY}System Load 5m: ${NOFORMAT} ${RED}$LOAD5\t${NOFORMAT} ${GREY}System Load 15m: ${NOFORMAT} ${RED}$LOAD15${NOFORMAT}\n"
echo -ne "${GREY}Использьзование памяти: ${NOFORMAT}${RED}${memory_usage}\t${NOFORMAT} ${GREY}Использьзование Swap: ${RED}${swap_usage}${NOFORMAT}\n"
echo -ne "${GREY}Количество процессов: ${NOFORMAT}${RED}${processes}${NOFORMAT}\n"
echo -ne "${GREY}Всего on-line пользователей в системе: ${NOFORMAT} ${RED}${users}${NOFORMAT}\t ${GREY}Текущий пользователь: ${NOFORMAT}${RED}${USER}${NOFORMAT}\n"
repeat "-"
echo -ne "${GREY}Сетевые параметры: ${NOFORMAT}\n"
echo -ne "${RED}$(ip --brief address show|column -t|grep -v lo)${NOFORMAT}\n"
repeat "-"
echo -ne "${GREY}Задания Crontab: ${NOFORMAT}\n"
echo -ne "${RED}$(crontab -l | grep -v '^ *#')${NOFORMAT}\n"
repeat "-"
echo -ne "${GREY}Прослушиваемые порты: ${NOFORMAT}\n"
echo -ne "${GREY}$(netstat -lanet4|grep -i listen)${NOFORMAT}\n"
repeat "-"
echo -ne "${GREY}Файловые системы: ${NOFORMAT}\n"
echo -ne "${GREY}$(df -Th | grep -vE "tmpfs|overlay|squashfs")${NOFORMAT}\n"
repeat "-"
IFS=","
for SVC in ${FIREWALL};do
  if [[ $(systemctl is-active "${SVC}") == "active" ]] ;then
    echo -ne "${GREY}Сервис ${CYAN}${SVC}: ${RED}ACTIVE${NOFORMAT}\n"
  else
    echo -ne "${GREY}Сервиса ${CYAN}${SVC}: ${GREEN}не найдено${NOFORMAT}\n"
  fi
done
IFS="$Field_Separator"
echo 
repeat "-"
if [[ "${OS_VER}" == "centos" ]] ; then
  echo -ne "${GREY}SEStatus:${NOFORMAT}\n"
  sestatus |grep -E "SELinux status|mode"
  repeat "-"
fi

### unset vars block
unset BLACK RED GREEN YELLOW BLUE MAGENTA CYAN GREY PURPLE ORANGE DATEN\
 LOAD1 LOAD5 LOAD15 uptime upDays upHours upMins upSecs root_usage\
 fsperm memory_usage swap_usage users USER processes INTERFACE \
 FIREWALL SVC