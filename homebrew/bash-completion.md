# Bash Completion

## Installation

```text
$ brew install bash-completion
$ brew tap homebrew/completions
```

```text
vi ~/.bash_profile
```

```text
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
```

## Docker bash completion

```text
cd /usr/local/etc/bash_completion.d
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
```

## References

* [Bash Completion on OS X With Brew](http://davidalger.com/development/bash-completion-on-os-x-with-brew/)

