#!/bin/bash
clear 
set -e

OS_VER="$(hostnamectl |grep -i "operating"|awk '{print tolower($3)}')"
if [[ ! -f "$(which git)" ]];then
  echo -e "\e[0;37mGIT \e[0;31mНЕ\e[0;37m найден\e[0m\n"
  if [[  "$(id -u)" == 0 ]] && { [[ "${OS_VER}" == "ubuntu" ]] || [[ "${OS_VER}" == "debian" ]] ;} ; then
    apt -y -qq install git
  elif [[  "$(id -u)" == 0 ]] && [[ "${OS_VER}" == "centos" ]] ; then
    yum install -y -q git
  else
    echo -e  "запусти сперва скрипт из под \e[0;31mroot\e[0m" && exit
  fi
else
  echo -e "\e[0;37mУра.Пакет \e[0;33mGIT\e[0;37m уже установлен\e[0m"
fi

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
unset OS_VER