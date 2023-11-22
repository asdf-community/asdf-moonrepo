<div align="center">

# asdf-moon [![Build](https://github.com/ethanjdiamond/asdf-moon/actions/workflows/build.yml/badge.svg)](https://github.com/ethanjdiamond/asdf-moon/actions/workflows/build.yml) [![Lint](https://github.com/ethanjdiamond/asdf-moon/actions/workflows/lint.yml/badge.svg)](https://github.com/ethanjdiamond/asdf-moon/actions/workflows/lint.yml)

[moon](https://moonrepo.dev/moon) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add moon
# or
asdf plugin add moon https://github.com/ethanjdiamond/asdf-moon.git
```

moon:

```shell
# Show all installable versions
asdf list-all moon

# Install specific version
asdf install moon latest

# Set a version globally (on your ~/.tool-versions file)
asdf global moon latest

# Now moon commands are available
moon --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ethanjdiamond/asdf-moon/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Ethan Diamond](https://github.com/ethanjdiamond/)
