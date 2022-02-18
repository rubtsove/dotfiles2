

#################################################################################################
# Установка FZF
#################################################################################################
function fzf_install {
clear

color_string
echo -e "${GREY}Начало установки бинарника ${YELLOW}fzf${NOFORMAT}"
color_string
TMP_FOLDER="/tmp/fzf" && mkdir -p "${TMP_FOLDER}"

if [[ -f $(which fzf) ]];then
  echo -e "${GREEN}Упсик,а бинарный файлик ${ORANGE}fzf${GREEN} - уже существует в папке: ${ORANGE}$(which fzf)${NOFORMAT}"
else
  if wget --quiet --spider "${FZF_BIN_SOURCE}"; then
    echo -e "${GREY}Архив с бинарным файлом ${ORANGE}fzf${GREY} ДОСТУПЕН для загрузки${NOFORMAT}"
    wget --quiet "${FZF_BIN_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    tar -xvf "${TMP_FOLDER}"/fzf*.tar.gz -C "${TMP_FOLDER}" #&& rm "${TMP_FOLDER}"/fzf*.tar.gz
    #mv "${TMP_FOLDER}"/fzf*/ "${TMP_FOLDER}"/fzf/
    cp -rfv "${TMP_FOLDER}"/fzf "${DEST_LOCALBIN}"/fzf && chmod +x "${DEST_LOCALBIN}"/fzf
	  echo -e "${GREEN}Бинарный Файл ${ORANGE}fzf${GREEN} скопирован в папку: ${ORANGE}$(which fzf)${NOFORMAT}" &&\
      log "Бинарный файл fzf скопирован загружен"
  else
    echo -e "${GREY}Архив fzf ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Файлик fzf НЕДОСТУПЕН для загрузки" 
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}fzf${NOFORMAT}"
color_string

echo

#####completion
color_string
echo -e "${GREY}Начало установки ${YELLOW}fzf completions${NOFORMAT}"
color_string

if [[ -f "${DEST_BASH_COMPLETION}"/fzf.bash ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}${DEST_BASH_COMPLETION}/fzf.bash${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${FZF_COMPL_SOURCE}"; then
    echo -e "${GREY}Completion файл ${ORANGE}fzf.bash${GREY} доступен для загрузки${NOFORMAT}"
    wget --quiet "${FZF_COMPL_SOURCE}" --output-document="${TMP_FOLDER}"/fzf.bash
    cp -rfv "${TMP_FOLDER}"/fzf.bash "${DEST_BASH_COMPLETION}"
	  echo -e "${GREEN}Completion файл ${ORANGE}fzf.bash${GREEN} скопирован в папку:${ORANGE}${DEST_BASH_COMPLETION}" &&\
      log "Конфигурационный файл fzf.bash скопирован в /etc/bash_completion.d/" 
  else
    echo -e "${GREY}Completion файл fzf.bash ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "Completion файл fzf.bash НЕ доступен для загрузки"
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}fzf completions${NOFORMAT}"
color_string

echo

##### man
color_string
echo -e "${GREY}Начало установки ${YELLOW}fzf MAN${NOFORMAT}"
color_string

if [[ -f "${DEST_MAN}"/fzf.1 ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}${DEST_MAN}/fzf.1${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${FZF_MAN_SOURCE}"; then
    echo -e "${GREY}MAN файл ${ORANGE}fzf.1${GREY} доступен для загрузки${NOFORMAT}"
    #wget --quiet "${FZF_MAN_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    wget "${FZF_MAN_SOURCE}" --directory-prefix="${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/fzf.1 "${DEST_MAN}"
	  echo -e "${GREEN}MAN файл ${ORANGE}fzf.1${GREEN} скопирован в папку: ${DEST_MAN}" &&\
      log "MAN файл fzf.1 скопирован в /usr/share/man/man1/" 
  else
    echo -e "${GREY}MAN файл fzf.1 ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"&&\
      err "MAN файл fzf.1 НЕ доступен для загрузки"
  fi
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}fzf MAN${NOFORMAT}"
color_string

rm -rf "${TMP_FOLDER}"
}