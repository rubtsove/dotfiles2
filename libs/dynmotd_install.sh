

#################################################################################################
# Функция кпорирования dynmotd 
#################################################################################################
function dynmotd_install {
clear
color_string
echo -e "${GREY}Начало копирования ${YELLOW}dynmotd.sh${NOFORMAT}"
color_string

if [[ -f "${DYNMOTD_DEST}" ]];then
  rm -rf "${DYNMOTD_DEST}" && \
  echo -e "${GREY}Файл ${ORANGE}/etc/profile.d/dynmotd.sh${GREY} был удален и будет скопирован заново${NOFORMAT}"
else
  if wget --quiet --spider "${DYNMOTD_SOURCE}"; then
    echo -e "${GREEN} файл ${ORANGE}dymotd.sh${GREEN} доступен для загрузки${NOFORMAT}\n"
    wget --quiet "${DYNMOTD_SOURCE}" --directory-prefix=/etc/profile.d/ &&\
     chmod +x /etc/profile.d/dynmotd.sh
    echo -e "${GREEN} Конфигурационный файл ${ORANGE}dymotd.sh${GREEN} скопирован в папку: ${ORANGE}/etc/profile.d/${NOFORMAT}"&&\
      log "dymotd.sh успешно скопирован" 
  else
    echo -e "${GREY}файл dymotd.sh ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "файл dymotd.sh НЕдоступен для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец копирования ${YELLOW}dynmotd.sh${NOFORMAT}"
color_string
}