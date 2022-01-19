

#################################################################################################
# Удаление dotfiles
#################################################################################################
function delete_dotfiles {
clear
color_string
echo -e "${GREY}Начало удаления ${YELLOW}dotfiles${NOFORMAT}"
color_string
  rm -rfv "${HOME}"/.bash_aliases
  rm -rfv "${HOME}"/.bashrc
  rm -rfv "${HOME}"/.fuzzy-sys.plugin.sh
  rm -rfv "${HOME}"/.fzf.bash
  rm -rfv "${HOME}"/.inputrc
  rm -rfv "${HOME}"/.profile
  rm -rfv "${HOME}"/.vimrc
  rm -rfv "${HOME}"/.vim
  rm -rfv "${HOME}"/.config
  rm -rfv "${HOME}"/.fzf
color_string
echo -e "${GREY}Конец удаления ${YELLOW}dotfiles${NOFORMAT}"
color_string
}