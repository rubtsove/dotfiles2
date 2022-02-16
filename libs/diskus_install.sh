

#############################################################################################################
### Функция установки diskus
#############################################################################################################
function diskus_install {
clear

color_string
echo -e "${GREY}Начало установки ${YELLOW}DISKUS${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/DISKUS" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which diskus) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}DISKUS${GREEN} - уже существует в папке: ${ORANGE}$(which diskus)${NOFORMAT}"
else
  if wget --quiet --spider "${DISKUS_SOURCE}"; then
    echo -e "${GREY}Архив ${ORANGE}DISKUS${GREY} ДОСТУПЕН для загрузки${NOFORMAT}"
    
    wget --quiet "${DISKUS_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    tar -xvf "${TMP_FOLDER}"/diskus*.tar.gz -C "${TMP_FOLDER}" && rm "${TMP_FOLDER}"/diskus*.tar.gz
    mv "${TMP_FOLDER}"/diskus*/ "${TMP_FOLDER}"/diskus/
    cp -rfv "${TMP_FOLDER}"/diskus/diskus "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/diskus
	  echo -e "${GREEN}Файл ${ORANGE}DISKUS${GREEN} скопирован в папку: ${ORANGE}$(which diskus)${NOFORMAT}" &&\
      log "Бинарный файл DISKUS скопирован загружен"
    cp -rfv "${TMP_FOLDER}"/diskus/diskus.1 /usr/share/man/man1/
    echo -e "${GREEN}MAN Файл ${ORANGE}diskus.1${GREEN} скопирован в папку: ${ORANGE}/usr/share/man/man1/${NOFORMAT}" &&\
      log "Бинарный файл DISKUS скопирован загружен"
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}Архив ${ORANGE}DISKUS: ${TMP_FOLDER}${GREEN} удалён${NOFORMAT}"
  else
    echo -e "${GREY}Архив DISKUS ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Архив DISKUS НЕДОСТУПЕН для загрузки" 
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}DISKUS${NOFORMAT}"
color_string
}