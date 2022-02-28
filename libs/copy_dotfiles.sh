

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

if [[ ! -e "${HOME}"/.bash_aliases ]];then 
  wget --quiet "${SOURCE_BASH_ALIASES}" --directory-prefix="${HOME}" &&\
  echo -e "${GREEN}Скачан файл: ${ORANGE}.bash_aliases${NOFORMAT}" 
else
  echo -e "${GREY}файл ${ORANGE}.bash_aliases: ${RED}УЖЕ существует${NOFORMAT}"
fi

if [[ -f "${HOME}"/.bashrc ]];then 
  wget --quiet "${SOURCE_BASHRC}" --directory-prefix="${HOME}" &&\
  echo -e "${GREEN}Скачан файл: ${ORANGE}.bashrc${NOFORMAT}" 
else
  echo -e "${GREY}файл: ${ORANGE}.bashrc ${RED}УЖЕ существует${NOFORMAT}"
fi

if [[ -f "${HOME}"/.fuzzy-sys.plugin.sh ]];then 
  wget --quiet "${SOURCE_FUZZYSYS}" --directory-prefix="${HOME}"  &&\
  echo -e "${GREEN}Скачан файл: ${ORANGE}.fuzzy-sys.plugin.sh${NOFORMAT}" 
else
  echo -e "${GREY}файл: ${ORANGE}.fuzzy-sys.plugin.sh ${RED}УЖЕ существует${NOFORMAT}"
fi

if [[ -f "${HOME}"/.inputrc ]];then 
  wget --quiet "${SOURCE_INPUTRC}" --directory-prefix="${HOME}" &&\
  echo -e "${GREEN}Скачан файл: ${ORANGE}.inputrc${NOFORMAT}" 
else
  echo -e "${GREY}файл: ${ORANGE}.inputrc ${RED}УЖЕ существует${NOFORMAT}"
fi

if [[ -f "${HOME}"/.profile ]];then 
  wget --quiet "${SOURCE_PROFILE}" --directory-prefix="${HOME}" &&\
  echo -e "${GREEN}Скачан файл: ${ORANGE}.profile${NOFORMAT}" 
else
  echo -e "${GREY}файл: ${ORANGE}.profile ${RED}УЖЕ существует${NOFORMAT}"
fi

if [[ -f "${HOME}"/.vimrc ]];then 
  wget --quiet "${SOURCE_VIMRC}" --directory-prefix="${HOME}" &&\
  echo -e "${GREEN}Скачан файл: ${ORANGE}.vimrc${NOFORMAT}" 
else
  echo -e "${GREY}файл: ${ORANGE}.vimrc ${RED}УЖЕ существует${NOFORMAT}"
fi


#for file in ${DEST_FILES}
#do
#  if [[ ! -e "${file}" ]];then
#    wget --quiet "${GITHUB_PATH}/${file##*/}" --directory-prefix="$HOME/" &&\
#    echo -e "${GREEN}Скачан файл ${ORANGE}${file##*/}${NOFORMAT}" 
#  else
#    echo -e "${GREY}файл ${ORANGE}${file}: ${RED}УЖЕ существует${NOFORMAT}"
#  fi
#done
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

if [[ -f "$HOME/.config/fzf/key-bindings.bash" ]];then
  echo -e "${GREEN}Упсик,а файлик ${ORANGE}$HOME/.config/fzf/key-bindings.bash${GREEN} - уже существует ${NOFORMAT}"
else 
  if wget --quiet --spider "${FZF_KEYS_SOURCE}"; then
    echo -e "${GREEN}файл ${ORANGE}key-bindings.bash${GREEN} доступен для загрузки${NOFORMAT}"
    wget --quiet "${FZF_KEYS_SOURCE}" --directory-prefix "$HOME"/.config/fzf/ &&\
      echo -e "${GREEN}Конфигурационный файл ${ORANGE}key-bindings.bash${GREEN} скопирован в папку: ${ORANGE}$HOME/.config/fzf/${NOFORMAT}"
  else
    echo -e "${GREY}файл ${ORANGE}key-bindings.bash${GREY} НЕ доступен для загрузки${NOFORMAT}"
  fi
fi

IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец копирования конфига ${YELLOW}FZF${NOFORMAT}"
color_string

}
