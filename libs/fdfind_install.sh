

#############################################################################################################
### Функция установки fd-find
#############################################################################################################
function fdfind_install {
clear

color_string
echo -e "${GREY}Начало установки бинарника ${YELLOW}FDFIND${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/fdfind" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which fdfind) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}FDFIND${GREEN} - уже существует в папке: ${ORANGE}$(which fdfind)${NOFORMAT}"
else
  if wget --quiet --spider "${FDFIND_SOURCE}"; then
    echo -e "${GREY}Архив ${ORANGE}FDFIND${GREY} ДОСТУПЕН для загрузки${NOFORMAT}"
    wget --quiet "${FDFIND_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    tar -xvf "${TMP_FOLDER}"/fd*.tar.gz -C "${TMP_FOLDER}" && rm "${TMP_FOLDER}"/fd*.tar.gz
    mv "${TMP_FOLDER}"/fd*/ "${TMP_FOLDER}"/fdfind/
    cp -rfv "${TMP_FOLDER}"/fdfind/fd "${DEST_LOCALBIN}"/fdfind && chmod +x "${DEST_LOCALBIN}"/fdfind
	  echo -e "${GREEN}Файл ${ORANGE}FDFIND${GREEN} скопирован в папку: ${ORANGE}$(which fdfind)${NOFORMAT}" &&\
      log "Бинарный файл fdfind скопирован загружен"
  else
    echo -e "${GREY}Архив fdfind ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Файлик fdfind НЕДОСТУПЕН для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}FDFIND${NOFORMAT}"
color_string

echo

#####completion
color_string
echo -e "${GREY}Начало установки ${YELLOW}FDFIND completions${NOFORMAT}"
color_string

if [[ -f "${DEST_BASH_COMPLETION}/fd.bash" ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}/etc/bash_completion.d/fd.bash${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${FDFIND_SOURCE}"; then
    echo -e "${GREY}Архив ${ORANGE}FDFIND${GREY} доступен для загрузки${NOFORMAT}"
    wget --quiet "${FDFIND_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    tar -xvf "${TMP_FOLDER}"/fd*.tar.gz -C "${TMP_FOLDER}" && rm "${TMP_FOLDER}"/fd*.tar.gz
    mv "${TMP_FOLDER}"/fd*/ "${TMP_FOLDER}"/fdfind/
    cp -rfv "${TMP_FOLDER}"/fdfind/autocomplete/fd.bash "${DEST_BASH_COMPLETION}"
	  echo -e "${GREEN}Файл ${ORANGE}fd.bash${GREEN} скопирован в папку: /etc/bash_completion.d/" &&\
      log "Конфигурационный файл fd.bash скопирован в /etc/bash_completion.d/" 
    cp -rfv "${TMP_FOLDER}"/fdfind/fd.1 /usr/share/man/man1
	  echo -e "${GREEN}MAN Файл ${ORANGE}rg.1${GREEN} скопирован в папку: /usr/share/man/man1/" &&\
      log "MAN файл fd.1 скопирован в /usr/share/man/man1"
  else
    echo -e "${GREY}Архив fdfind ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Архив fdfind НЕ доступен для загрузки"
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки ${YELLOW}FDFIND completions${NOFORMAT}"
color_string
}