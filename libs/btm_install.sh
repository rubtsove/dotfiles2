

#############################################################################################################
### Функция установки btm
#############################################################################################################
function btm_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}BTM${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/btm" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which btm) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}BTM${GREEN} - уже существует в: ${ORANGE}$(which btm)${NOFORMAT}"
else
  if wget --quiet --spider "${BTM_SOURCE_ARCH}"; then
    echo -e "${GREEN}Инсталляционный архив ${ORANGE}BotTom${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}\n"
    wget --quiet "${BTM_SOURCE_ARCH}" --directory-prefix="${TMP_FOLDER}"
    tar -xvf "${TMP_FOLDER}"/bottom*.tar.gz -C "${TMP_FOLDER}"
	  cp -rfv "${TMP_FOLDER}"/btm "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/btm
	  echo -e "${GREEN}Файл ${ORANGE}BTM${GREEN} скопирован в папку: ${ORANGE}$(which btm)${NOFORMAT}" &&\
      log "Файл btm скопирован загружен"
    cp -rfv "${TMP_FOLDER}"/completion/btm.bash "${DEST_BASH_COMPLETION}"
	  echo -e "${GREEN}Файл ${ORANGE}btm.bash${GREEN} скопирован в папку ${ORANGE}/etc/bash_completion.d/${NOFORMAT}" &&\
      log "Файл btm.bash скопирован в папку /etc/bash_completion.d/"
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}инсталяционный архив ${ORANGE}BotTom: ${TMP_FOLDER}${GREEN} удалён${NOFORMAT}"
  else
    echo -e "${GREY}Инсталляционный архив BotTom ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Инсталляционный архив BotTom НЕДОСТУПЕН для загрузки" 
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}BTM${NOFORMAT}"
color_string
}