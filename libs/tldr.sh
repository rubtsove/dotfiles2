

#################################################################################################
# Установка tldr
#################################################################################################
function tldr_install {
clear

color_string
echo -e "${GREY}Начало установки бинарника ${YELLOW}tldr${NOFORMAT}"
color_string

if [[ -f $(which tldr) ]];then
  echo -e "${GREEN}Упсик,а бинарный файлик ${ORANGE}tldr${GREEN} - уже существует в папке: ${ORANGE}$(which tldr)${NOFORMAT}"
else
  if wget --quiet --spider "${TLDR_BIN_SOURCE}"; then
    echo -e "${GREY}Бинарный файл ${ORANGE}tldr${GREY} ДОСТУПЕН для загрузки${NOFORMAT}"
    wget --quiet "${TLDR_BIN_SOURCE}" --output-document="${DEST_LOCALBIN}"/tldr && chmod +x "${DEST_LOCALBIN}"/tldr
	  echo -e "${GREEN}Бинарный Файл ${ORANGE}tldr${GREEN} скопирован в папку: ${ORANGE}$(which tldr)${NOFORMAT}" &&\
      log "Бинарный файл tldr загружен"
  else
    echo -e "${GREY}Бинарный файл tldr ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Файлик tldr НЕДОСТУПЕН для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}tldr${NOFORMAT}"
color_string

echo

#####completion
color_string
echo -e "${GREY}Начало установки ${YELLOW}tldr completions${NOFORMAT}"
color_string

if [[ -f "${DEST_BASH_COMPLETION}"/tldr.bash ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}${DEST_BASH_COMPLETION}/tldr.bash${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${TLDR_COMPL_SOURCE}"; then
    echo -e "${GREY}Completion файл ${ORANGE}tldr.bash${GREY} доступен для загрузки${NOFORMAT}"
    wget --quiet "${TLDR_COMPL_SOURCE}" --output-document="${DEST_BASH_COMPLETION}"/tldr.bash
	  echo -e "${GREEN}Completion файл ${ORANGE}tldr.bash${GREEN} скопирован в папку:${ORANGE}${DEST_BASH_COMPLETION}" &&\
      log "Конфигурационный файл tldr.bash скопирован в /etc/bash_completion.d/" 
  else
    echo -e "${GREY}Completion файл tldr.bash ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Completion файл tldr.bash НЕ доступен для загрузки"
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}tldr completions${NOFORMAT}"
color_string
}