

#############################################################################################################
### Функция рутового меню
#############################################################################################################
function root_menu {
while true; do
  clear
  color_string
  echo -e "${GREY}Меню пользователя: ${YELLOW}$(whoami)${NOFORMAT}"
  color_string
  echo -e "${GREY}нажми ${CYAN}1${GREY} - для установки обновлений"
  echo -e "${GREY}нажми ${CYAN}2${GREY} - для установки пакетов"
  echo -e "${GREY}нажми ${CYAN}3${GREY} - (лайт решение) - для установки cht.sh + duf + sss + procs + grc + dynmotd "
  echo -e "${GREY}нажми ${CYAN}4${GREY} - для установки cht.sh + duf + sss + procs + grc + dynmotd + exa + btm + bat"
  echo -e "${GREY}нажми ${CYAN}5${GREY} - для проверки наличия старых doftiles"
  echo -e "${GREY}нажми ${CYAN}6${GREY} - для удаления старых dotfiles"
  echo -e "${GREY}нажми ${CYAN}7${GREY} - для копрования dotfiles"
  echo -e "${GREY}нажми ${CYAN}8${GREY} - для установки FZF"
  echo -e "${GREY}нажми ${CYAN}9${GREY} - для удаления старых и установки новых dotfiles + fzf "
  echo -e "${GREY}нажми ${RED}0 ${GREY} для Выхода"
  color_string
  echo
  
  echo -en "${YELLOW}$(whoami) " && read -rp $'\e[0;37mВаш Выбор: \e[m'  choose
  case "$choose" in
    1) all_upgrade && anykey;;
    2) pkg_install && anykey;;
    3) ctsh_install && anykey && duf_install && anykey && sss_install && anykey && procs_install && anykey && grc_install && anykey && dynmotd_install && anykey;;
    4) ctsh_install && anykey && duf_install && anykey && exa_install && anykey && sss_install && anykey && procs_install && anykey && grc_install && anykey && btm_install && anykey && dynmotd_install && anykey && bat_install && anykey;;
    5) check_dotfiles_exsist && anykey;;
    6) delete_dotfiles && anykey ;;
    7) copy_dotfiles && anykey && source_bashrc && anykey;;
    8) fzf_install && source_bashrc && anykey;;
    9) delete_dotfiles && anykey&& copy_dotfiles && anykey && fzf_install && anykey && source_bashrc && anykey;;
    0) echo -e "\n${GREY}Пока !!!" && break;;
    *) echo -e "\n${RED}Чёт не то ввёл" && break ;;
  esac
done
}