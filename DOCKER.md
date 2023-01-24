# Development containers

Docker development containers with basic CLI tools intended for development in isolation.

## Features

- `docker.sh` shell script for Docker commands automation
- Debian slim images
- Rootless containers
- Containers are not removed after being stopped
- [BuildKit](https://docs.docker.com/develop/develop-images/build_enhancements/) builds
- [Zsh](https://www.zsh.org/) shell:
  - [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - [fzf completion](https://github.com/Aloxaf/fzf-tab)
- Customizable [user profiles](#user-profile)

## Usage

```console
./scripts/docker.sh --help
```

## Environments

Every environment is based on `base` image. The `base` image must be built prior to building any other environment:

```console
./scripts/docker.sh build
```

Build a specific environment image:

```console
./scripts/docker.sh --env <environment_id> build
```

Run environment container:

```console
./scripts/docker.sh --env <environment_id> run
```

Example:

```console
./scripts/docker.sh --env python build
./scripts/docker.sh --env python run
```

### Base

Environment id: `base`

To update system packages in existing `base` image, use Docker `--no-cache` flag:

```console
./scripts/docker.sh build --no-cache
```

You must rebuild environment images and create new containers as well.

### Node.js

Environment id: `nodejs`

Features:
- [Node.js LTS](https://nodejs.org/en/download/)
- [Node Version Manager](https://github.com/nvm-sh/nvm)

### Python

Environment id: `python`

Features:
- [Python 3.10.x](https://www.python.org/downloads/)
- [Python Version Manager](https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv)

### Go

Environment id: `golang`

Features:
- Version set in Dockerfile.golang
- [Managing Go Installations](https://go.dev/doc/manage-install)

## Troubleshooting

### Apple M1 MacBook

If you encounter issues with missing libraries, add `--platform linux/x86_64` flag after native docker commands:

```console
$ ./bin/docker.sh --env <environment> build --platform linux/x86_64
$ ./bin/docker.sh --env <environment> run --platform linux/x86_64
```
