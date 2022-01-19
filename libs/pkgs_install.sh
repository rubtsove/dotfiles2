

#############################################################################################################
### Функция установки пакетов
#############################################################################################################
function pkg_install {
clear
color_string
echo -e "${GREY}Начало установки ${YELLOW}пакетов${NOFORMAT}"
color_string

IFS=","
for package in ${SOURCE_PACKAGES}
do
  "${PKG_MANAGER}" install -y -qq ${package}
done
IFS="$Field_Separator"

color_string
echo -e "${GREY}Конец установки ${YELLOW}пакетов${NOFORMAT}"
color_string
}