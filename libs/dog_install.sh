

#############################################################################################################
### Функция установки dog
#############################################################################################################
function dog_install {
clear
TMP_FOLDER="/tmp/dog" && mkdir -p "${TMP_FOLDER}"

#### bin
color_string
echo -e "${GREY}Начало установки бинарника: ${YELLOW}dog${NOFORMAT}"
color_string

if [[ -f $(which dog) ]];then
  echo -e "${GREEN}Упсик,а файлик: ${ORANGE}dog${GREEN} - уже существует в папке: ${ORANGE}$(which dog)${NOFORMAT}"
else
  if wget --quiet --spider "${DOG_SOURCE}"; then
    echo -e "${GREEN}Инсталляционынй архив ${ORANGE}dog ДОСТУПЕН${GREEN} для загрузки${NOFORMAT}"
    wget --quiet "${DOG_SOURCE}" --output-document="${TMP_FOLDER}"/dog.zip &&\
    unzip -q "${TMP_FOLDER}"/dog.zip -d "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/bin/dog "${DEST_LOCALBIN}" && chmod +x "${DEST_LOCALBIN}"/dog
    echo -e "${GREEN}Бинарник: ${ORANGE}dog${GREEN} скопирован в папку: ${ORANGE}$(which dog)${NOFORMAT}"&&\
      log "Бинарник dog скопирован" 
  else
    echo -e "${GREY}Инсталляционынй архив dog ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "Инсталляционынй архив dog НЕДОСТУПЕН для загрузки"
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки бинарника: ${YELLOW}dog${NOFORMAT}"
color_string

echo

##### completion
color_string
echo -e "${GREY}Начало установки: ${YELLOW}dog completions${NOFORMAT}"
color_string

if [[ -f "${DEST_BASH_COMPLETION}"/dog.bash ]];then
  echo -e "${GREEN}Упсик,а файлик: ${ORANGE}${DEST_BASH_COMPLETION}/dog.bash${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${DOG_SOURCE}"; then
    echo -e "${GREEN}Инсталляционынй архив ${ORANGE}dog ДОСТУПЕН${GREEN} для загрузки${NOFORMAT}"
    [[ ! -d "${TMP_FOLDER}" ]] && mkdir -p "${TMP_FOLDER}"
    wget --quiet "${DOG_SOURCE}" --output-document="${TMP_FOLDER}"/dog.zip &&\
    unzip -q "${TMP_FOLDER}"/dog.zip -d "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/completions/dog.bash "${DEST_BASH_COMPLETION}"
	  echo -e "${GREEN}Completion файл: ${ORANGE}dog.bash${GREEN} скопирован в папку:${ORANGE}${DEST_BASH_COMPLETION}" &&\
      log "Конфигурационный файл dog.bash скопирован в /etc/bash_completion.d/" 
  else
    echo -e "${GREY}Инсталляционынй архив dog ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "Инсталляционынй архив dog НЕДОСТУПЕН для загрузки"
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки: ${YELLOW}dog completions${NOFORMAT}"
color_string

echo

##### man
color_string
echo -e "${GREY}Начало установки: ${YELLOW}dog MAN${NOFORMAT}"
color_string

if [[ -f "${DEST_MAN}"/dog.1 ]];then
  echo -e "${GREEN}Упсик,а файлик: ${ORANGE}${DEST_MAN}/dog.1${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${DOG_SOURCE}"; then
    echo -e "${GREEN}Инсталляционынй архив ${ORANGE}dog ДОСТУПЕН${GREEN} для загрузки${NOFORMAT}"
    [[ ! -d "${TMP_FOLDER}" ]] && mkdir -p "${TMP_FOLDER}"
    wget --quiet "${DOG_SOURCE}" --output-document="${TMP_FOLDER}"/dog.zip &&\
    unzip -q "${TMP_FOLDER}"/dog.zip -d "${TMP_FOLDER}"
    cp -rfv "${TMP_FOLDER}"/man/dog.1 "${DEST_MAN}"
	  echo -e "${GREEN}MAN файл ${ORANGE}dog.1${GREEN} скопирован в папку:${ORANGE}${DEST_MAN}" &&\
      log "Конфигурационный файл dog.bash скопирован в /usr/share/man/man1/" 
  else
    echo -e "${GREY}Инсталляционынй архив dog ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}" &&\
      err "Инсталляционынй архив dog НЕДОСТУПЕН для загрузки"
  fi
fi
rm -rf "${TMP_FOLDER}"
color_string
echo -e "${GREY}Конец установки: ${YELLOW}dog MAN${NOFORMAT}"
color_string
}