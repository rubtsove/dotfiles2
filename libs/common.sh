

function anykey {
read -n 1 -s -r -p $'\e[1;33mНажми любую клавишу \e[m'
}

function check_root {
if [[ "$(id -u)" == 0 ]]; then
    root_menu
else
    user_menu
fi
}

function color_string {
  echo -e "${BLUE}---------------------------------------------------------------${NOFORMAT}"
}

function in_script_colors {
if [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
  NOFORMAT='\e[0m' RED='\e[0;31m' GREEN='\e[0;32m' ORANGE='\e[0;33m' BLUE='\e[0;34m' PURPLE='\e[0;35m' CYAN='\e[0;36m' YELLOW='\e[0;33m' GREY='\e[0;37m'
else
  NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW='' GREY=''
fi
}
in_script_colors

readonly SCRIPT_NAME="$(basename "$0")"
log () {
  logger -p user.notice -t "$SCRIPT_NAME" "$@"
}

err () {
  logger -p user.error -t "$SCRIPT_NAME" "$@"
}

