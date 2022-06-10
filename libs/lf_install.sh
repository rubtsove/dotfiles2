

#############################################################################################################
### Функция установки lf
#############################################################################################################
function lf_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}LF${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/lf" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which lf) ]] ;then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}LF${GREEN} - уже существует в: ${ORANGE}$(which lf)${NOFORMAT}"
else
  if wget --quiet --spider "${LF_SOURCE}"; then
    echo -e "${GREEN}Архив ${ORANGE}LF${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}\n"
    wget --quiet "${LF_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    mv "${TMP_FOLDER}"/lf*.tar.gz "${TMP_FOLDER}"/lf.tar.gz
    tar -xvf "${TMP_FOLDER}"/lf.tar.gz -C "${TMP_FOLDER}"
    rm "${TMP_FOLDER}"/*.tar.gz
    mv "${TMP_FOLDER}"/lf*/* "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/lf "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/lf
	  echo -e "${GREEN}Файл ${ORANGE}LF${GREEN} скопирован в папку: ${ORANGE}$(which lf)${NOFORMAT}" &&\
      log "Бинарный файл lf скопирован загружен"
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}Архив ${ORANGE}LF: ${TMP_FOLDER}${GREEN} удалён${NOFORMAT}"
  else
    echo -e "${GREY}Архив LF ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Архив LF НЕДОСТУПЕН для загрузки" 
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}LF${NOFORMAT}"
color_string
}