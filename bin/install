#!/usr/bin/env bash

set -e
set -o pipefail

ASDF_INSTALL_TYPE=${ASDF_INSTALL_TYPE:-version  }
TMPDIR=${TMPDIR:-/tmp}
[ -n "$ASDF_INSTALL_VERSION" ] || (>&2 echo 'Missing ASDF_INSTALL_VERSION' && exit 1)
[ -n "$ASDF_INSTALL_PATH" ] || (>&2 echo 'Missing ASDF_INSTALL_PATH' && exit 1)

install_flashlight() {
  local version=$2
  local install_path=$3
  local bin_install_path="$install_path/bin"
  local download_url="$(get_download_url $version)"

  local platform="$(get_platform)"
  local arch="$(get_arch)"

  mkdir -p "${install_path}"
  mkdir -p "${bin_install_path}"
  local bin_path="${bin_install_path}/flashlight"
  echo "downloading flashlight ${download_url}"
    curl -L -s "$download_url" | funzip > "${install_path}"/flashlight
  mv "${install_path}/flashlight" "${bin_install_path}/flashlight"
  chmod +x $bin_path
}

get_platform() {
  local platform=$(uname | tr 'A-Z' 'a-z')
  echo $platform
}

OS="$(uname -s)"

set_filename() {
  case "$OS" in
    "Linux") FILENAME="flashlight-linux" ;;
    "Darwin") FILENAME="flashlight-macos" ;;
  esac
}


get_arch() {
  local arch=$(uname -m)
  echo $arch
}

get_download_url() {
  local version="$1"
  local platform="$(get_platform)"
  local arch="$(get_arch)"
  echo "https://github.com/bitfrost/bx/releases/download/v${version}/$FILENAME"
}

set_filename
install_flashlight $ASDF_INSTALL_TYPE $ASDF_INSTALL_VERSION $ASDF_INSTALL_PATH