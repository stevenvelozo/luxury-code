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
    "docker-dev-build-image": "docker build ./ -f Dockerfile_LUXURYCode -t retold/retold-example:local",
    "docker-dev-run": "docker run -it -d --name retold-example-dev -p 127.0.0.1:12340:8080 -p 12306:3306 -p 8086:8086 -v \"$PWD/.config:/home/coder/.config\"  -v \"$PWD:/home/coder/retold-example\" -u \"$(id -u):$(id -g)\" -e \"DOCKER_USER=$USER\" retold/retold-example:local",
    "docker-dev-run-with-library": "docker run -it -d --name retold-example-dev -p 127.0.0.1:12340:8080 -p 12306:3306 -p 8086:8086 -v \"$PWD/.config:/home/coder/.config\"  -v \"$PWD:/home/coder/retold-dev/retold-example\" -v \"$npm_config_library:/home/coder/retold-dev/library\" -u \"$(id -u):$(id -g)\" -e \"DOCKER_USER=$USER\" retold/retold-example:local"
  }
```

## Making mocha tests work with the visual studio mocha add-on (also done to package.json)
```
  "mocha": {
    "diff": true,
    "extension": [
      "js"
    ],
    "package": "./package.json",
    "reporter": "spec",
    "slow": "75",
    "timeout": "5000",
    "ui": "tdd",
    "watch-files": [
      "source/**/*.js",
      "test/**/*.js"
    ],
    "watch-ignore": [
      "lib/vendor"
    ]
  },
```
