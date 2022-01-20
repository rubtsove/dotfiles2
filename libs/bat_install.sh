

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
  if wget --quiet --spider "${BAT_SOURCE}"; then
    echo -e "${GREEN}Архив ${ORANGE}BAT${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}\n"
    wget --quiet "${BAT_SOURCE_DEB}" --directory-prefix="${TMP_FOLDER}"
    mv "${TMP_FOLDER}"/bat*.tar.gz "${TMP_FOLDER}"/bat.tar.gz
    tar -xvf "${TMP_FOLDER}"/bat.tar.gz -C "${TMP_FOLDER}"
    rm "${TMP_FOLDER}"/*.tar.gz
    mv "${TMP_FOLDER}"/bat*/* "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/bat "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/bat
	  echo -e "${GREEN}Файл ${ORANGE}BAT${GREEN} скопирован в папку: ${ORANGE}$(which bat)${NOFORMAT}" &&\
      log "Бинарный файл bam скопирован загружен"
    cp -rfv "${TMP_FOLDER}"/autocomplete/bat.bash "${DEST_BASH_COMPLETION}"
	  echo -e "${GREEN}Файл ${ORANGE}bat.bash${GREEN} скопирован в папку ${ORANGE}/etc/bash_completion.d/${NOFORMAT}" &&\
      log "Файл bat.bash скопирован в папку /etc/bash_completion.d/"
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}Архив ${ORANGE}BAT${GREEN} удалён${NOFORMAT}"
  else
    echo -e "${GREY}Архив BAT ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Архив BAT НЕДОСТУПЕН для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}BAT${NOFORMAT}"
color_string
}