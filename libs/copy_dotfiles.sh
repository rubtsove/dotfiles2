

#################################################################################################
# Копирование dotfiles из репозитория
#################################################################################################
function copy_dotfiles {
clear

### Создание папок
IFS=","
color_string
echo -e "${GREY}Начало создания папок пользователя: ${YELLOW}$(whoami)${NOFORMAT}"
color_string
for folder in ${DEST_FOLDERS}
do
  if [[ ! -d "${folder}" ]];then
    mkdir -p "${folder}" && echo -e "${GREEN}Создана директория: ${ORANGE}${folder}${NOFORMAT}"
  fi
done
IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец создания папок.${NOFORMAT}"
color_string

echo

### Копирование dotfiles
IFS=","
color_string
echo -e "${GREY}Начало копирования ${YELLOW}dotfiles${GREY} для пользователя: ${ORANGE}$(whoami)${NOFORMAT}"
color_string
for file in ${DEST_FILES}
do
  if [[ ! -e "${file}" ]];then
    wget --quiet "${GITHUB_PATH}/${file##*/}" --directory-prefix="$HOME/" &&\
    echo -e "${GREEN}Скачан файл ${ORANGE}${file##*/}${NOFORMAT}" 
  else
    echo -e "${GREY}файл ${ORANGE}${file}: ${RED}УЖЕ существует${NOFORMAT}"
  fi
done
IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец копирования ${YELLOW}dotfiles${NOFORMAT}"
color_string

anykey && clear

### Конфиг файл для procs
IFS=","
color_string
echo -e "${GREY}Начало копирования конфига ${YELLOW}procs${GREY} для пользователя: ${ORANGE}$(whoami)${NOFORMAT}"
color_string

if [[ -f "$HOME/.config/procs/config.toml" ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}$HOME/.config/procs/config.toml${GREEN} - уже существует${NOFORMAT}"
else 
  if wget --quiet --spider "${PROCS_CONFIG}"; then
    echo -e "${GREEN}файл ${ORANGE}config.toml${GREEN} доступен для загрузки${NOFORMAT}"
    wget --quiet "${PROCS_CONFIG}" --directory-prefix="$HOME"/.config/procs/ &&\
      echo -e "${GREEN}Конфигурационный файл ${ORANGE}config.toml${GREEN} скопирован в папку: ${ORANGE}$HOME/.config/procs/${NOFORMAT}"
  else
    echo -e "${GREY}файл config.toml ${RED}НЕдоступен${GREY} для загрузки${NOFORMAT}"
  fi
fi
IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец копирования конфига ${YELLOW}PROCS${NOFORMAT}"
color_string

echo

### Конфиг файл для bottom
IFS=","
color_string
echo -e "${GREY}Начало копирования конфига ${YELLOW}bottom${GREY} для пользователя: ${ORANGE}$(whoami)${NOFORMAT}"
color_string

if [[ -f "$HOME/.config/bottom/bottom.toml" ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}$HOME/.config/bottom/bottom.toml${GREEN} - уже существует ${NOFORMAT}"
else 
  if wget --quiet --spider "${BTM_CONFIG}"; then
    echo -e "${GREEN}файл ${ORANGE}bottom.toml${GREEN} доступен для загрузки${NOFORMAT}"
    wget --quiet "${BTM_CONFIG}" --directory-prefix "$HOME"/.config/bottom/ &&\
      echo -e "${GREEN}Конфигурационный файл ${ORANGE}bottom.toml${GREEN} скопирован в папку: ${ORANGE}$HOME/.config/bottom/${NOFORMAT}"
  else
    echo -e "${GREY}файл ${ORANGE}bottom.toml${GREY} НЕ доступен для загрузки${NOFORMAT}"
  fi
fi

IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец копирования конфига ${YELLOW}bottom${NOFORMAT}"
color_string

echo

### Конфиг файл для fzf
IFS=","
color_string
echo -e "${GREY}Начало копирования конфига ${YELLOW}FZF${GREY} для пользователя: ${ORANGE}$(whoami)${NOFORMAT}"
color_string

if [[ -f "$HOME/.config/fzf/fzfkey-bindings.bash" ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}$HOME/.config/fzf/fzfkey-bindings.bash${GREEN} - уже существует ${NOFORMAT}"
else 
  if wget --quiet --spider "${FZF_KEYS_SOURCE}"; then
    echo -e "${GREEN}файл ${ORANGE}fzfkey-bindings.bash${GREEN} доступен для загрузки${NOFORMAT}"
    wget --quiet "${FZF_KEYS_SOURCE}" --directory-prefix "$HOME"/.config/fzf/ &&\
      echo -e "${GREEN}Конфигурационный файл ${ORANGE}fzfkey-bindings.bash${GREEN} скопирован в папку: ${ORANGE}$HOME/.config/fzf/${NOFORMAT}"
  else
    echo -e "${GREY}файл ${ORANGE}fzfkey-bindings.bash${GREY} НЕ доступен для загрузки${NOFORMAT}"
  fi
fi

IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец копирования конфига ${YELLOW}FZF${NOFORMAT}"
color_string

}
