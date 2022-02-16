

#############################################################################################################
### Функция установки DUF
#############################################################################################################
function duf_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}DUF${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/duf" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which duf) ]];then
  echo -e "${GREEN}Упсик, а файл ${ORANGE}DUF${GREEN} уже существует в папке: ${ORANGE}$(which duf)${NOFORMAT}"
else 
  if [[ "${OS_VER}" == "ubuntu" ]] || [[ "${OS_VER}" == "debian" ]] ; then
    if wget --quiet --spider "${DUF_SOURCE_DEB}"; then
      echo -e "${GREEN}Файлик ${ORANGE}duf.deb${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}\n"
      wget --quiet "${DUF_SOURCE_DEB}" --directory-prefix="${TMP_FOLDER}" &&\
      dpkg -i "${TMP_FOLDER}"/*.deb &&\
      echo -e "\n${ORANGE}DUF${GREEN} установлен в папку: ${ORANGE}$(which duf)${NOFORMAT}" &&\
        log "DUF.deb успешно установлен" 
      rm -rf "${TMP_FOLDER}" && echo -e "${GREY}инсталяционный файл ${ORANGE}DUF.deb${GREY} удалён${NOFORMAT}"
    else
      echo -e "${GREY}Файлик duf.deb ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "Файлик duf.deb НЕДОСТУПЕН для загрузки" 
    fi
  else
    if wget --quiet --spider "${DUF_SOURCE_RPM}"; then
      echo -e "${GREEN}Файлик ${ORANGE}duf.rpm${GREEN} ДОСТУПЕН для загрузки${NOFORMAT}"
      wget --quiet "${DUF_SOURCE_RPM}" --directory-prefix="${TMP_FOLDER}" &&\
      rpm -ivh "${TMP_FOLDER}"/*.rpm
      echo -e "DUF${GREEN} установлен в папку: ${ORANGE}$(which duf)${NOFORMAT}" &&\
        log "DUF.rpm успешно установлен" 
      rm -rf "${TMP_FOLDER}" && echo -e "${GREY}инсталяционный файл ${ORANGE}DUF: ${TMP_FOLDER}${GREY} удалён${NOFORMAT}"
    else
      echo -e "${GREY}Файлик duf.rpm ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
       err "Файлик duf.rpm НЕДОСТУПЕН для загрузки" 
    fi
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}DUF${NOFORMAT}"
color_string
}