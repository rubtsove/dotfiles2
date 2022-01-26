

#############################################################################################################
### Функция установки cht.sh
#############################################################################################################
function cheat_install {
clear  
TMP_FOLDER="/tmp/cheat" && mkdir -p "${TMP_FOLDER}"

###### main script block
color_string
echo -e "${GREY}Начало установки ${YELLOW}CHEAT${NOFORMAT}"
color_string
if [[ -f $(which cheat) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}CHEAT${GREEN} - уже существует в папке: ${ORANGE}$(which cheat)${NOFORMAT}"
else
  if wget --quiet --spider "${CHEAT_SOURCE}" ;then 
    echo -e "${GREEN}Файл ${ORANGE}CHEAT${GREEN} доступен для загрузки ${NOFORMAT}"
    wget --quiet "${HEAT_SOURCE}" --output-document="${TMP_FOLDER}"/cheat.gz &&\
    gzip --decompress --quiet "${TMP_FOLDER}"/cheat.gz 
    cp -rfv "${TMP_FOLDER}"/cheat "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/cheat
    rm -rf "${TMP_FOLDER}" && echo -e "${GREY}инсталяционный файл CHEAT удалён${NOFORMAT}"
    echo -e "${GREEN}Бинарник ${ORANGE}CHEAT${GREEN} скопирован в папку: ${ORANGE}$(which cheat)${NOFORMAT}"&&\
      log "Бинарник cheat скопирован" 
  else
    echo -e "${GREY}файл CHEAT ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "файл CHEAT НЕдоступен для загрузки" 
	fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}CHEAT${NOFORMAT}"
color_string

echo

###### completion block
color_string
echo -e "${GREY}Начало установки ${YELLOW}CHEAT completion${NOFORMAT}"
color_string
if [[ -f "${DEST_BASH_COMPLETION}"/cheat.bash ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}cheat.bash(completion)${GREEN} - уже существует ${NOFORMAT}"
else 
  if wget --quiet --spider "${CHEAT_COMPL}";then
    echo -e "${GREEN}файлик ${ORANGE}cheat.bash(completion)${GREEN} доступен для загрузки${NOFORMAT}"
    wget --quiet "${CHT_COMPL}" --directory-prefix="${DEST_BASH_COMPLETION}"
    echo -e "${GREEN}Файл ${ORANGE}cheat.bash${GREEN} загружен в папку: ${ORANGE}${DEST_BASH_COMPLETION}${NOFORMAT}" &&\
      log "Файл chtsh.sh загружен"    
  else
    echo -e "${GREY}файлик cheat.bash completion ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "файлик cheat.bash completion НЕ доступен для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}CHEAT completion${NOFORMAT}"
color_string
}