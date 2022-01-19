

#############################################################################################################
### Функция установки procs
#############################################################################################################
function procs_install {
clear
TMP_FOLDER="/tmp/procs" && mkdir -p "${TMP_FOLDER}"

#### bin
color_string
echo -e "${GREY}Начало установки ${YELLOW}PROCS${NOFORMAT}"
color_string

if [[ -f $(which procs) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}PROCS${GREEN} - уже существует в папке: ${ORANGE}$(which procs)${NOFORMAT}"
else
  if wget --quiet --spider "${PROCS_SOURCE_ARCH}"; then
    echo -e "${GREEN}Инсталляционынй архив ${ORANGE}PROCS ДОСТУПЕН${GREEN} для загрузки${NOFORMAT}"
    #wget --quiet "${PROCS_SOURCE_ARCH}" --directory-prefix="${TMP_FOLDER}" &&\
    wget --quiet "${PROCS_SOURCE_ARCH}" --output-document="${TMP_FOLDER}"/procs.zip &&\
    unzip -q "${TMP_FOLDER}"/procs.zip -d "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/procs "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/procs
    rm -rf "${TMP_FOLDER}" && echo -e "${GREY}инсталяционный файл PROCS удалён${NOFORMAT}"
    echo -e "${GREEN}Бинарник ${ORANGE}PROCS${GREEN} скопирован в папку: ${ORANGE}$(which procs)${NOFORMAT}"&&\
      log "Бинарник procs скопирован" 
  else
    echo -e "${GREY}Инсталляционынй архив PROCS ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "Инсталляционынй архив procs НЕДОСТУПЕН для загрузки"
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}PROCS${NOFORMAT}"
color_string
echo
#####completion
color_string
echo -e "${GREY}Начало установки ${YELLOW}PROCS completions${NOFORMAT}"
color_string

if [[ -f "${DEST_BASH_COMPLETION}procs.bash" ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}/etc/bash_completion.d/procs.bash${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${PROCS_COMPL}"; then
    echo -e "${GREY}файл ${ORANGE}procs.bash${GREY} доступен для загрузки${NOFORMAT}"
    wget --quiet "${PROCS_COMPL}" --directory-prefix="${DEST_BASH_COMPLETION}" &&\
      echo -e "${GREEN}Конфигурационный файл ${ORANGE}procs.bash${GREEN} скопирован в /etc/bash_completion.d/${NOFORMAT}"&&\
      log "Конфигурационный файл procs.bash скопирован в /etc/bash_completion.d/" 
  else
    echo -e "${GREY}файл procs.bash ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "файл procs.bash НЕ доступен для загрузки"
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}PROCS completions${NOFORMAT}"
color_string
}