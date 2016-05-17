# Git keeps asking password after El Capitan Upgrade

After upgrade to El Capitan from Yosemite,
For every time I run `git clone` to a repo that required a password,
I need to type both the username and password, and seems the `git` command is not using the password that store in `Keychain Access`.

Here is the solution:

```
git config --global credential.helper osxkeychain
```

## Reference

- [Git keeps prompting me for password | StackOverflow](http://stackoverflow.com/a/11428767/3869284)
