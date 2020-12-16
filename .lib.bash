#!/bin/bash
set -e

lib::mssg() {
  printf   "  ... %s" "$1"
}

lib::succ() {
  printf "\r done \n"
}

lib::fail() {
  printf "\r fail \n" && exit 70
}

lib::get_packages() {
  local pck url cmd pcks=("$@")
  sed 1d packages.tsv | while IFS=$'\t' read -r pck url cmd; do
    (for p in "${pcks[@]}"; do [[ "$p" == "$pck" ]] && exit 0; done) &&
      echo "$pck"$'\t'"$url"$'\t'"$cmd"
  done
}
