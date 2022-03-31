# luxury-code
Make coding luxurious again.  With Docker.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/stevenvelozo/luxury-code/HEAD/install.sh)"
```

## Building

```
zip -r ./dist/luxury-code.zip ./.config -x "*.DS_Store"
```

## Adding nicety commands to package.json

```
  "scripts": {
  	....
    "docker-dev-build-image": "docker build ./ -t retold/retold-example:local",
    "docker-dev-run": "docker run -it -d --name retold-example-dev -p 127.0.0.1:12340:8080 -p 12306:3306 -p 8086:8086 -v \"$PWD/.config:/home/coder/.config\"  -v \"$PWD:/home/coder/retold-dev/retold-example\" -u \"$(id -u):$(id -g)\" -e \"DOCKER_USER=$USER\" retold/retold-example:local",
    "docker-dev-run-with-library": "docker run -it -d --name retold-example-dev -p 127.0.0.1:12340:8080 -p 12306:3306 -p 8086:8086 -v \"$PWD/.config:/home/coder/.config\"  -v \"$PWD:/home/coder/retold-dev/retold-example\" -v \"$npm_config_library:/home/coder/retold-dev/library\" -u \"$(id -u):$(id -g)\" -e \"DOCKER_USER=$USER\" retold/retold-example:local"
  }
```