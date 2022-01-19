

#############################################################################################################
### Функция загрузки bashrc
#############################################################################################################
function source_bashrc {
clear
color_string
echo -e "${GREY}Начало загрузки ${YELLOW}.bashrc${NOFORMAT}"
color_string
if [[ -f "$HOME"/.bashrc ]]; then
  . "$HOME"/.bashrc && echo -e "${GREEN}bashrc загружен${NOFORMAT}"
else
  echo -e "${GREY}Файл bashrc ${RED}НЕ найден${NOFORMAT}"
fi
color_string
echo -e "${GREY}Конец загрузки ${YELLOW}.bashrc${NOFORMAT}"
color_string
}