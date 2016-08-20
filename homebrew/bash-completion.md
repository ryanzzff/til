# Bash Completion

## Installation

```
$ brew install bash-completion
$ brew tap homebrew/completions
```

```
vi ~/.bash_profile
```

```
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
```

## References

- [Bash Completion on OS X With Brew](http://davidalger.com/development/bash-completion-on-os-x-with-brew/)
