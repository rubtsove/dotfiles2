#############################################################################################################
### Функция установки gdu
#############################################################################################################
function gdu_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}GDU${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/GDU" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which gdu) ]] ;then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}GDU${GREEN} - уже существует в: ${ORANGE}$(which gdu)${NOFORMAT}"
else
  if wget --quiet --spider "${GDU_SOURCE}"; then
    echo -e "${GREEN}Архив ${ORANGE}GDU${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}\n"
    wget --quiet "${GDU_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    tar -xvf "${TMP_FOLDER}"/gdu_linux_amd64.tgz -C "${TMP_FOLDER}"
    mv "${TMP_FOLDER}"/gdu_linux_amd64 "${TMP_FOLDER}"/gdu
    cp -rfv "${TMP_FOLDER}"/gdu "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/gdu
	  echo -e "${GREEN}Файл ${ORANGE}GDU${GREEN} скопирован в папку: ${ORANGE}$(which gdu)${NOFORMAT}" &&\
      log "Бинарный файл GDU скопирован загружен"
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}Архив ${ORANGE}GDU : ${TMP_FOLDER} ${GREEN} удалён${NOFORMAT}"
  else
    echo -e "${GREY}Архив GDU ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Архив GDU НЕДОСТУПЕН для загрузки" 
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}GDU${NOFORMAT}"
color_string
}