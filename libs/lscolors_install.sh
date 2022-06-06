

#############################################################################################################
### Функция установки lscolors
#############################################################################################################
function lscolors_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}LSCOLORS${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/lscolors" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which lscolors) ]] ;then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}LSCOLORS${GREEN} - уже существует в: ${ORANGE}$(which lscolors)${NOFORMAT}"
else
  if wget --quiet --spider "${LSCOLORS_SOURCE}"; then
    echo -e "${GREEN}Архив ${ORANGE}lscolors${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}\n"
    wget --quiet "${LSCOLORS_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    mv "${TMP_FOLDER}"/lscolors*.tar.gz "${TMP_FOLDER}"/lscolors.tar.gz
    tar -xvf "${TMP_FOLDER}"/lscolors.tar.gz -C "${TMP_FOLDER}"
    rm "${TMP_FOLDER}"/*.tar.gz
    mv "${TMP_FOLDER}"/lscolors*/* "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/lscolors "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/lscolors
	  echo -e "${GREEN}Файл ${ORANGE}lscolors${GREEN} скопирован в папку: ${ORANGE}$(which lscolors)${NOFORMAT}" &&\
      log "Бинарный файл lscolors скопирован загружен"
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}Архив ${ORANGE}LSCOLORS: ${TMP_FOLDER}${GREEN} удалён${NOFORMAT}"
  else
    echo -e "${GREY}Архив LSCOLORS ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Архив LSCOLORS НЕДОСТУПЕН для загрузки" 
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}LSCOLORS${NOFORMAT}"
color_string
}