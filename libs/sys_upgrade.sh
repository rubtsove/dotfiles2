

#############################################################################################################
### Функция обновления системы - на свой страх и риск
#############################################################################################################
function all_upgrade {
clear
color_string
echo -e "${GREY}Начало обновления ${YELLOW}ОС${NOFORMAT}"
color_string

if [[ "${PKG_MANAGER}" == "apt" ]];then
  "${PKG_MANAGER}" update -y && "${PKG_MANAGER}" upgrade -y &&\
  "${PKG_MANAGER}" autoremove -y && "${PKG_MANAGER}" autoclean
else
  "${PKG_MANAGER}" update -y
fi

color_string
echo -e "${GREY}Конец обновления ${YELLOW}ОС${NOFORMAT}"
color_string
}