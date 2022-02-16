

#############################################################################################################
### Функция установки DS
#############################################################################################################
function ds_install {
clear

color_string
echo -e "${GREY}Начало установки ${YELLOW}DS${NOFORMAT}"
color_string

if [[ -f $(which ds) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}DS${GREEN} - уже существует в папке: ${ORANGE}$(which ds)${NOFORMAT}"
else
  if wget --quiet --spider "${DS_SOURCE}"; then
    echo -e "${GREY}Файлик ${ORANGE}DS${GREY} ДОСТУПЕН для загрузки${NOFORMAT}"
    wget --quiet "${DS_SOURCE}" --directory-prefix="${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}/ds"
    echo -e "${GREEN}Файлик ${ORANGE}DS${GREEN} загружен в папку : ${ORANGE}$(which ds)${NOFORMAT}"&&\
      log "DS успешно установлен" 
  else
    echo -e "${GREY}Файлик DS ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Файлик DS НЕДОСТУПЕН для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}DS${NOFORMAT}"
color_string
}