

#################################################################################################
# Проверка наличия папок
#################################################################################################
function check_dotfiles_folders () {
clear
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
IFS="$Field_Separator"
color_string
echo -e "${GREY}Конец проверки наличия папок.${NOFORMAT}"
color_string
}