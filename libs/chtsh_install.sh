

#############################################################################################################
### Функция установки cht.sh
#############################################################################################################
function ctsh_install {
clear  
#TMP_FOLDER="/tmp/chts" && mkdir -p "${TMP_FOLDER}"

###### main script block
color_string
echo -e "${GREY}Начало установки ${YELLOW}CHT.SH${NOFORMAT}"
color_string
if [[ -f $(which cht.sh) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}cht.sh${GREEN} - уже существует в папке: ${ORANGE}$(which cht.sh)${NOFORMAT}"
else
  if wget --quiet --spider "${CHT_SOURCE}" ;then 
    echo -e "${GREEN}Файл ${ORANGE}cht.sh${GREEN} доступен для загрузки ${NOFORMAT}"
    wget --quiet "${CHT_SOURCE}" --directory-prefix="${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/cht.sh
    echo -e "${GREEN}Файл ${ORANGE}cht.sh${GREEN} загружен в папку: ${ORANGE}$(which cht.sh)${NOFORMAT}" &&\
      log "cht.sh успешно установлен" 
  else
    echo -e "${GREY}файл cht.sh ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "файл cht.sh НЕдоступен для загрузки" 
	fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}CHT.SH${NOFORMAT}"
color_string

echo

###### completion block
color_string
echo -e "${GREY}Начало установки ${YELLOW}CHT.SH completion${NOFORMAT}"
color_string
if [[ -f "${DEST_BASH_COMPLETION}"/chtsh.sh ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}chtsh.sh(completion)${GREEN} - уже существует ${NOFORMAT}"
else 
  if wget --quiet --spider "${CHT_COMPL}";then
    echo -e "${GREEN}файлик ${ORANGE}chtsh.sh(completion)${GREEN} доступен для загрузки${NOFORMAT}"
    wget --quiet "${CHT_COMPL}" --directory-prefix="${DEST_BASH_COMPLETION}"
    echo -e "${GREEN}Файл ${ORANGE}chtsh.sh${GREEN} загружен в папку: ${ORANGE}${DEST_BASH_COMPLETION}${NOFORMAT}" &&\
      log "Файл chtsh.sh загружен"    
  else
    echo -e "${GREY}файлик cht.sh completion ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "файлик cht.sh completion НЕ доступен для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}CHT.SH completion${NOFORMAT}"
color_string
}