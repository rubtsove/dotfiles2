

#############################################################################################################
### Функция установки sss
#############################################################################################################
function sss_install {
clear
#TMP_FOLDER="/tmp/sss" && mkdir -p "${TMP_FOLDER}"

color_string
echo -e "${GREY}Начало установки ${YELLOW}SSS${NOFORMAT}"
color_string

if [[ -f $(which sss) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}SSS${GREEN} - уже существует в папке: ${ORANGE}$(which sss)${NOFORMAT}"
else
  if wget --quiet --spider "${SSS_SOURCE}"; then
    echo -e "${GREY}Файлик ${ORANGE}SSS${GREY} ДОСТУПЕН для загрузки${NOFORMAT}"
    wget --quiet "${SSS_SOURCE}" --directory-prefix="${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}/sss"
    echo -e "${GREEN}Файлик ${ORANGE}SSS${GREEN} загружен в папку : ${ORANGE}$(which sss)${NOFORMAT}"&&\
      log "sss успешно установлен" 
  else
    echo -e "${GREY}Файлик SSS ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Файлик sss НЕДОСТУПЕН для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}SSS${NOFORMAT}"
color_string
}