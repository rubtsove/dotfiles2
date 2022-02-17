

#############################################################################################################
### Функция установки grc
#############################################################################################################
function grc_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}GRC${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/grc" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which grc) ]];then
  echo -e "${GREEN}Упсик, а файл ${ORANGE}GRC${GREEN} уже существует в папке: ${ORANGE}$(which grc)${NOFORMAT}"
else
  if wget --quiet --spider "${GRC_SOURCE_ARCH}"; then
    echo -e "${GREEN}Архив с установщиком ${ORANGE}GRC${GREEN} - ДОСТУПЕН для загрузки${NOFORMAT}"
    #wget --quiet "${GRC_SOURCE_ARCH}" --directory-prefix="${TMP_FOLDER}"
    wget --quiet "${GRC_SOURCE_ARCH}" --output-document="${TMP_FOLDER}"/grc.zip
    unzip -q "${TMP_FOLDER}"/grc.zip -d "${TMP_FOLDER}"
    cp -rvf "${TMP_FOLDER}"/grc-master/grc.conf /etc/
    echo -e "${GREEN}Файл ${ORANGE}grc.conf${GREEN} скопирован в папку ${ORANGE}/etc/${NOFORMAT}" &&\
      log "Файл exa скопирован"
    cp -rfv /"${TMP_FOLDER}"/grc-master/grc "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/grc
    echo -e "${GREEN}Файл ${ORANGE}grc${GREEN} скопирован в папку: ${ORANGE}$(which grc)${NOFORMAT}" &&\
      log "Файл exa скопирован"
    cp -rfv "${TMP_FOLDER}"/grc-master/grcat "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/grcat
    echo -e "${GREEN}Файл ${ORANGE}grcat${GREEN} скопирован в папку: ${ORANGE}$(which grcat)${NOFORMAT}" &&\
      log "Файл exa скопирован"
    mkdir -p /usr/local/share/grc/ && \
    cp -rfv "${TMP_FOLDER}"/grc-master/colourfiles/conf.* /usr/local/share/grc/
    echo -e "${GREEN}Файлы ${ORANGE}conf.*${GREEN} скопированы в папку ${ORANGE}/usr/local/share/grc/${NOFORMAT}" &&\
      log "Файл exa скопирован"
    cp -rfv "${TMP_FOLDER}"/grc-master/grc.1 ${DEST_MAN}
    echo -e "${GREEN}Файл ${ORANGE}grc.${GREEN}1 скопирован в папку: ${ORANGE}${DEST_MAN}${NOFORMAT}" &&\
      log "Файл exa скопирован"
    cp -rfv "${TMP_FOLDER}"/grc-master/grcat.1 ${DEST_MAN}
    echo -e "${GREEN}Файл ${ORANGE}grcat.1${GREEN} скопирован в папку: ${ORANGE}${DEST_MAN}${NOFORMAT}" &&\
      log "Файл exa скопирован"
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}инсталяционный архив ${ORANGE}GRC: ${TMP_FOLDER}${GREEN} - удалён${NOFORMAT}"
    echo -e "${GREEN}ресурсы GRC скопированы${NOFORMAT}" &&\
      log "ресурсы GRC скопированы" 
  else
    echo -e "${GREY}Архив с установщиком GRC - ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "Архив с установщиком GRC - НЕдоступен для загрузки" 
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}GRC${NOFORMAT}"
color_string
}