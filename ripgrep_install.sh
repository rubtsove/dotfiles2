

#############################################################################################################
### Функция установки ripgrep
#############################################################################################################
function ripgrep_install {
clear

color_string
echo -e "${GREY}Начало установки бинарника ${YELLOW}RIPGREP${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/ripgrep" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which rg) ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}ripgrep${GREEN} - уже существует в папке: ${ORANGE}$(which rg)${NOFORMAT}"
else
  if wget --quiet --spider "${RIPGREP_SOURCE}"; then
    echo -e "${GREY}Архив ${ORANGE}ripgrep${GREY} ДОСТУПЕН для загрузки${NOFORMAT}"
    wget --quiet "${ripgrep_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    tar -xvf "${TMP_FOLDER}"/rip*.tar.gz -C "${TMP_FOLDER}" && rm "${TMP_FOLDER}"/rip*.tar.gz
    mv "${TMP_FOLDER}"/rip*/ "${TMP_FOLDER}"/ripgrep/
    cp -rfv "${TMP_FOLDER}"/ripgrep/rg "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/rg
	  echo -e "${GREEN}Файл ${ORANGE}ripgrep${GREEN} скопирован в папку: ${ORANGE}$(which rg)${NOFORMAT}" &&\
      log "Бинарный файл ripgrep скопирован загружен"
  else
    echo -e "${GREY}Архив ripgrep ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Файлик ripgrep НЕДОСТУПЕН для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}ripgrep${NOFORMAT}"
color_string

#####completion
color_string
echo -e "${GREY}Начало установки ${YELLOW}ripgrep completions${NOFORMAT}"
color_string

if [[ -f "${DEST_BASH_COMPLETION}/rg.bash" ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}/etc/bash_completion.d/rg.bash${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${RIPGREP_SOURCE}"; then
    echo -e "${GREY}Архив ${ORANGE}ripgrep${GREY} доступен для загрузки${NOFORMAT}"
    wget --quiet "${RIPGREP_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    tar -xvf "${TMP_FOLDER}"/rip*.tar.gz -C "${TMP_FOLDER}" && rm "${TMP_FOLDER}"/rip*.tar.gz
    mv "${TMP_FOLDER}"/rip*/ "${TMP_FOLDER}"/ripgrep/
    cp -rfv "${TMP_FOLDER}"/ripgrep/complete/rg.bash "${DEST_BASH_COMPLETION}"
	  echo -e "${GREEN}Файл ${ORANGE}rg.bash${GREEN} скопирован в папку: /etc/bash_completion.d/" &&\
      log "Конфигурационный файл eg.bash скопирован в /etc/bash_completion.d/" 
    cp -rfv "${TMP_FOLDER}"/ripgrep/doc/rg.1 /usr/share/man/man1
	  echo -e "${GREEN}MAN Файл ${ORANGE}rg.1${GREEN} скопирован в папку: /usr/share/man/man1/" &&\
      log "MAN файл rg.1 скопирован в /usr/share/man/man1"
  else
    echo -e "${GREY}Архив ripgrep ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Архив ripgrep НЕ доступен для загрузки"
  fi
fi
rm -rf "${TMP_FOLDER}"
}
/usr/share/man/man1