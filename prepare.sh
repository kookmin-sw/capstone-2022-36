#!/bin/zsh

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

foo() {
  echo -e "${GREEN}[*] $1${NOCOLOR}"
  echo -e "${GREEN}    (Press any key to continue...)${NOCOLOR}"
  arg=$1
  read
  eval ${arg}
}


alias cat=bat
foo "export WORKSPACE=`pwd`"
foo "echo $WORKSPACE"

# EOF
