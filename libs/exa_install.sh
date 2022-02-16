

#############################################################################################################
### Функция установки exa
#############################################################################################################
function exa_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}EXA${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/exa" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which exa) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}EXA${GREEN} - уже существует в папке: ${ORANGE}$(which exa)${NOFORMAT}"
else
  if wget --quiet --spider "${EXA_SOURCE_ARCH}"; then
    echo -e "${GREY}Инсталляционный архив ${ORANGE}EXA${GREY} ДОСТУПЕН для загрузки${NOFORMAT}"
    #wget --quiet "${EXA_SOURCE_ARCH}" --directory-prefix="${TMP_FOLDER}"
    wget --quiet "${EXA_SOURCE_ARCH}" --output-document="${TMP_FOLDER}"/exa.zip
    unzip -q "${TMP_FOLDER}"/exa.zip -d "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/bin/exa "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/exa && \
    echo -e "${GREEN}Файл ${ORANGE}EXA${GREEN} скопирован в папку: ${ORANGE}$(which exa)${NOFORMAT}" &&\
      log "Файл exa скопирован" 
    cp -rfv "${TMP_FOLDER}"/man/* /usr/share/man/man1  &&\
    echo -e "${GREEN}Файл ${ORANGE}MAN${GREEN} скопирован в папку: ${ORANGE}/usr/share/man/man1${NOFORMAT}" &&\
      log "Файлы MAN exa скопированы"
    cp -rfv "${TMP_FOLDER}"/completions/exa.bash "${DEST_BASH_COMPLETION}" &&\
    echo -e "${GREEN}Файл ${ORANGE}exa.bash (completion)${GREEN} скопирован в папку: ${ORANGE}/etc/bash_completion.d/${NOFORMAT}" &&\
      log "Файл exa.bash (completion) скопирован" 
    rm -rf "${TMP_FOLDER}" && echo -e "${GREEN}инсталяционный архив ${ORANGE}EXA: ${TMP_FOLDER}${GREEN} удалён${NOFORMAT}"
  else
    echo -e "${GREY}Инсталляционный архив EXA ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "Инсталляционный архив EXA НЕдоступен для загрузки"
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}EXA${NOFORMAT}"
color_string
}