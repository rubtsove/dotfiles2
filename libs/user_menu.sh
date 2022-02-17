

#############################################################################################################
### Функция пользовательского меню
#############################################################################################################
function user_menu {
while true; do
  clear
  color_string
  echo -e "${GREY}Меню пользователя: ${YELLOW}$(whoami)${NOFORMAT}"
  color_string
  echo -e "${GREY}нажми ${CYAN}1${GREY} - для проверки наличия старых doftiles"
  echo -e "${GREY}нажми ${CYAN}2${GREY} - для удаления старых dotfiles"
  echo -e "${GREY}нажми ${CYAN}3${GREY} - для копрования dotfiles"
  echo -e "${GREY}нажми ${CYAN}4${GREY} - для удаления старых и установки новых dotfiles"
  echo -e "${GREY}нажми ${RED}0${GREY} - для Выхода"
  color_string
  echo
  
  echo -en "${YELLOW}$(whoami) " && read -rp $'\e[0;37mВаш Выбор: \e[m'  choose
  case "$choose" in
    1) check_dotfiles_exsist && anykey;;
    2) delete_dotfiles && anykey ;;
		3) copy_dotfiles && anykey && source_bashrc && anykey;;
    4) delete_dotfiles && anykey && copy_dotfiles && anykey && source_bashrc && anykey;;
    0) echo -e "\n${GREY}Пока !!!" && break;;
    *) echo -e "\n${RED}Чёт не то ввёл" && break ;;
  esac
done
}