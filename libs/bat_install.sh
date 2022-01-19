

#############################################################################################################
### Функция установки bat
#############################################################################################################
function bat_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}BAT${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/bat" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which bat) ]] ;then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}BAT${GREEN} - уже существует в $(which bat)${NOFORMAT}"
else
  if [[ "${OS_VER}" == "ubuntu" ]] || [[ "${OS_VER}" == "debian" ]] ; then
    if wget --quiet --spider "${BAT_SOURCE_DEB}"; then
      echo -e "${GREEN}Архив с установщиком ${ORANGE}BAT${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}\n"
      wget --quiet "${BAT_SOURCE_DEB}" --directory-prefix="${TMP_FOLDER}"
      dpkg -i "${TMP_FOLDER}"/bat*.deb
      echo -e "\n${ORANGE}BAT${GREEN} установлен в папку: ${ORANGE}$(which bat)${NOFORMAT}" &&\
        log "bat.deb успешно установлен" 
      rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}инсталяционный файл ${ORANGE}BAT${GREEN} удалён${NOFORMAT}"
    else
      echo -e "${GREY}Файлик bat.deb ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
        err "Файлик bat.deb НЕДОСТУПЕН для загрузки" 
    fi
  else
      echo -e "${GREY}У нас ${RED}НЕ deb like${GREY} система - НЕ могу установить${NOFORMAT}"
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}BAT${NOFORMAT}"
color_string
}