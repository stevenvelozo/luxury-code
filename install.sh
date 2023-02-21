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
  https://github.com/stevenvelozo/luxury-code
EOABORT
  )"
elif ! command -v bsdtar >/dev/null
then
  abort "$(
    cat <<EOABORT
You must install bsdtar before using your code in Luxury. See:
  https://github.com/stevenvelozo/luxury-code
EOABORT
  )"
fi

echo "...installing your luxury code files!"
curl -s "https://raw.githubusercontent.com/stevenvelozo/luxury-code/HEAD/dist/luxury-code.zip" | bsdtar -xf-
echo "...installation complete."

echo "# Lines for adding docker stuff to your package.json (in the scripts section):"
echo "--"
echo "    \"docker-dev-build-image\": \"docker build ./ -f Dockerfile_LUXURYCode -t retold/YOURLIBRARYNAMEHERE:local\","
echo "    \"docker-dev-run\": \"docker run -it -d --name retold-example-dev -p 127.0.0.1:12340:8080 -v \\\"$PWD/.config:/home/coder/.config\\\"  -v \\\"$PWD:/home/coder/YOURLIBRARYNAMEHERE\\\" -u \\\"$(id -u):$(id -g)\\\" -e \\\"DOCKER_USER=$USER\\\" retold/YOURLIBRARYNAMEHERE:local\","
echo "--"
echo "...other examples for this section are in the docs at https://github.com/stevenvelozo/luxury-code"
echo ""
echo ""
echo "# Mocha test support GUI runners go in the root object of package.json"
echo "--"
echo "  \"mocha\": {"
echo "    \"diff\": true,"
echo "    \"extension\": ["
echo "      \"js\""
echo "    ],"
echo "    \"package\": \"./package.json\","
echo "    \"reporter\": \"spec\","
echo "    \"slow\": \"75\","
echo "    \"timeout\": \"5000\","
echo "    \"ui\": \"tdd\","
echo "    \"watch-files\": ["
echo "      \"source/**/*.js\","
echo "      \"test/**/*.js\""
echo "    ],"
echo "    \"watch-ignore\": ["
echo "      \"lib/vendor\""
echo "    ]"
echo "  },"
echo "--"
echo ""
echo ""
echo "...now you can copy the Dockerfile from the folder and customize it..."
echo "...if you want good vscode integration for debugging, copy in the other files in the .vscode folder..."
echo "...and cleanup!"
echo "--"
echo "cp ./.config/luxury-extras/Dockerfile_LUXURYCode ./"
echo "cp -R ./.config/luxury-extras/.vscode ./"
echo "rm -rf .config/luxury-extras"
echo "rm -rf .config/installation"
