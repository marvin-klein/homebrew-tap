# homebrew-tap

This is a _tap_ (3rd-party repository) for my software that can be installed using
Homebrew for Apple Macs (or Linuxbrew for Linux).

Use `brew tap Moonbase59/tap` to add it to your repository list.

You can then install from any _formula_ I have (check the [Formula](/Formula) folder)
using a simple `brew` command.

Let’s assume you wanted to install my `loudgain` application:

```bash
brew install loudgain
```

or, if a core package should exist with the same name:

```bash
brew install Moonbase59/tap/loudgain
```
