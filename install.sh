#!/bin/bash
clear 
set -eo pipefail

### 
if [[ ! -d /tmp/dotfiles ]];then 
  echo -e "\n\e[0;37mКачну репозиторий в: \e[0;33m /tmp/dotfiles/\e[0m"
  git clone --quiet --depth=2 https://github.com/rubtsove/dotfiles2 /tmp/dotfiles &&\
  rm -rf /tmp/dotfiles/.git/
fi

### load libraries
LIB_PATH=/tmp/dotfiles/libs/*.sh
for file in ${LIB_PATH} ; do
  . "${file}"
done

check_root # function from common.sh