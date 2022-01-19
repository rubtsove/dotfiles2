

#################################################################################################
# Проверка наличия папки .vim , если НЕ обнаружена - создать её
#################################################################################################
function check_vim_folder () {
clear
IFS=","
echo -e "${BLUE}-----------------------${NOFORMAT}"
echo -e "${YELLOW}Начало блока проверки наличия папки .vim${NOFORMAT}"
echo -e "${BLUE}-----------------------${NOFORMAT}"
for folder in $vim_path
do
  if [[ ! -d "$folder" ]];then
    echo -e "${RED}НЕ найдена директория: ${YELLOW}$file${NOFORMAT}" && mkdir -p "$folder"
  else
    echo -e "${GREEN}Найдена директория: ${YELLOW}$file${NOFORMAT}"
  fi
done
IFS="$Field_Separator"
echo -e "${BLUE}-----------------------${NOFORMAT}"
echo -e "${YELLOW}Конец блока проверки наличия папки .vim${NOFORMAT}"
echo -e "${BLUE}-----------------------${NOFORMAT}"
}