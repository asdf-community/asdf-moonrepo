<div align="center">

# asdf-moonrepo [![Build](https://github.com/asdf-community/asdf-moonrepo/actions/workflows/build.yml/badge.svg)](https://github.com/asdf-community/asdf-moonrepo/actions/workflows/build.yml) [![Lint](https://github.com/asdf-community/asdf-moonrepo/actions/workflows/lint.yml/badge.svg)](https://github.com/asdf-community/asdf-moonrepo/actions/workflows/lint.yml)

[moon](https://moonrepo.dev/moon) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Install

Plugin:

```shell
asdf plugin add moonrepo https://github.com/asdf-community/asdf-moonrepo.git
```

moon:

```shell
# Show all installable versions
asdf list-all moonrepo

# Install specific version
asdf install moonrepo latest

# Set a version globally (on your ~/.tool-versions file)
asdf global moonrepo latest

# Now moon commands are available
moon --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/asdf-community/asdf-moonrepo/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Ethan Diamond](https://github.com/ethanjdiamond/)
