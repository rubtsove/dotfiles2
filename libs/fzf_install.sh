

#################################################################################################
# Установка FZF
#################################################################################################
function fzf_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}FZF${NOFORMAT}"
color_string

if wget --quiet --spider "${FZF_SOURCE}" ; then
  echo -e "${GREY}репозиторий ${ORANGE}FZF${GREY} доступен для выгрузки${NOFORMAT}" && sleep 0.05
  if [[ -d "${FZF_DIR}" ]];then
    echo -e "${GREEN}Обнаружена папка ${ORANGE}${FZF_DIR}${NOFORMAT}" && sleep 0.05
    color_string
    rm -rfv "${FZF_DIR}" && echo -e "${RED}Удалена папка ${ORANGE}${FZF_DIR}${NOFORMAT}" && sleep 0.05
  fi
  color_string
  sh -c 'cd $HOME/' && echo -e "${GREY}Нахожусь в папке: ${ORANGE}$(pwd)${NOFORMAT}" 
  color_string
  echo -e "${GREEN}Клонирую ${ORANGE}FZF${GREEN} в папку профиля ${NOFORMAT}" &&\
  git clone --quiet --depth 1 "${FZF_SOURCE}" "$HOME"/.fzf &&\
   "$HOME"/.fzf/install --all && sleep 0.05
  color_string
  rm -rfv "${FZF_DIR}/.git/" && echo -e "${GREY}Удалена папка ${ORANGE}${HOME}/.fzf/.git/${NOFORMAT}" 
else 
  echo -e "${GREY}репозиторий FZF ${RED}НЕдоступен${GREY} для выгрузки${NOFORMAT}"
fi
color_string
echo -e "${GREY}Конец установки ${YELLOW}FZF${NOFORMAT}"
color_string
}