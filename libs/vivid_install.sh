

#############################################################################################################
### Функция установки vivid
#############################################################################################################
function vivid_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}VIVID${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/vivid" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which vivid) ]] ;then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}VIVID${GREEN} - уже существует в: ${ORANGE}$(which vivid)${NOFORMAT}"
else
  if wget --quiet --spider "${VIVID_SOURCE}"; then
    echo -e "${GREEN}Архив ${ORANGE}VIVID${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}\n"
    wget --quiet "${VIVID_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    mv "${TMP_FOLDER}"/vivid*.tar.gz "${TMP_FOLDER}"/vivid.tar.gz
    tar -xvf "${TMP_FOLDER}"/vivid.tar.gz -C "${TMP_FOLDER}"
    rm "${TMP_FOLDER}"/*.tar.gz
    mv "${TMP_FOLDER}"/vivid*/* "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/vivid "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/vivid
	  echo -e "${GREEN}Файл ${ORANGE}VIVID${GREEN} скопирован в папку: ${ORANGE}$(which vivid)${NOFORMAT}" &&\
      log "Бинарный файл vivid скопирован загружен"
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}Архив ${ORANGE}VIVID: ${TMP_FOLDER}${GREEN} удалён${NOFORMAT}"
  else
    echo -e "${GREY}Архив VIVID ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Архив VIVID НЕДОСТУПЕН для загрузки" 
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}VIVID${NOFORMAT}"
color_string
}