#!/bin/bash
# Based off of the homebrew installation script!

# We don't need return codes for "$(command)", only stdout is needed.
# Allow `[[ -n "$(command)" ]]`, `func "$(command)"`, pipes, etc.
# shellcheck disable=SC2312

set -u

abort() {
  printf "%s\n" "$@"
  exit 1
}

if [ -z "${BASH_VERSION:-}" ]
then
  abort "Bash is required to interpret this script."
fi

if ! command -v curl >/dev/null
then
  abort "$(
    cat <<EOABORT
You must install curl before using your code in Luxury. See:
  ${tty_underline}https://github.com/stevenvelozo/luxury-code${tty_reset}
EOABORT
  )"
elif ! command -v bsdtar >/dev/null
then
  abort "$(
    cat <<EOABORT
You must install bsdtar before using your code in Luxury. See:
  ${tty_underline}https://github.com/stevenvelozo/luxury-code${tty_reset}
EOABORT
  )"
fi

ECHO "...installing your luxury code!"

curl -s "https://raw.githubusercontent.com/stevenvelozo/luxury-code/HEAD/dist/luxury-code.zip" | bsdtar -xf-


echo "...now you can copy the Dockerfile from the folder and customize it..."
echo "   cp ./.config/luxury-extras/Dockerfile ./"

echo "...if you want good vscode integration for debugging, copy in the other files..."
echo "   cp -R ./.config/luxury-extras/.vscode ./"
