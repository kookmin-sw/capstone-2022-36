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


foo "file samples/a.out"
foo "file samples/b.out"
foo "dotnet run --no-build --project ~/capstone-2022-36/B2R2/src/RearEnd/BinDump -- samples/a.out samples/b.out --diff --show-color --myers"

# EOF
