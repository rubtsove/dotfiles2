

#################################################################################################
# Проверка наличия УЖЕ существующих dotfiles
#################################################################################################
function check_dotfiles_exsist {
clear
### Проверка папок
IFS=","
color_string
echo -e "${GREY}Проверка наличия папок пользователя: ${YELLOW}$(whoami)${NOFORMAT}"
color_string
for folder in ${DEST_FOLDERS}
do
  if [[ ! -d "${folder}" ]];then
    echo -e "${RED}НЕ найдена директория: ${YELLOW}$folder${NOFORMAT}" 
  else
    echo -e "${GREEN}Найдена директория: ${YELLOW}$folder${NOFORMAT}"
  fi
done
#IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец проверки наличия папок.${NOFORMAT}"
color_string

echo

### Проверка файлов
#IFS=","
color_string
echo -e "${GREY}Начало проверки ${YELLOW}dotfiles${GREY} пользователя: ${ORANGE}$(whoami)${NOFORMAT}"
color_string
for file in ${DEST_FILES} ;do 
  if [[ ! -e "$file" ]];then
    echo -e "${RED}НЕ найден файл: ${YELLOW}${file}${NOFORMAT}"
  else
    echo -e "${GREEN}найден файл: ${YELLOW}${file}${NOFORMAT}"
  fi
done
IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец проверки ${YELLOW}dotfiles${NOFORMAT}"
color_string
}