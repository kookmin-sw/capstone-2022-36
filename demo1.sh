#!/bin/bash

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

if ! command -v bat &> /dev/null
then
    echo "bat could not be found"
    alias bat=cat
fi

foo "bat samples/java_v1.java"
foo "bat samples/java_v2.java"
foo "dotnet run --project B2R2/src/RearEnd/BinDump -- samples/java_v1.java samples/java_v2.java --diff --text --show-color"

# EOF
