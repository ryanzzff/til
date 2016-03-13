# Show ASCII Text welcome message when login with SSH

## Create ASCII Text

Using ASCII Text generator like: http://patorjk.com/software/taag/#p=testall&f=Standard

## A. Show same text for all users

first copy the text from the above generator and paste it to: `/etc/motd`

## B. Show different message per user

1. copy the ASCII text to any custom directory, for instance: `/var/motd/<username>
2. Edit the login script to show the above ASCII TEXT


Add the following line to `/etc/bashrc`:

```
test -e /var/motd/$LOGNAME && cat /var/motd/$LOGNAME

```


---

Ref: 
- [Display SSH Welcome Message AFTER the Login](http://www.shellhacks.com/en/HowTo-Set-a-Warning-Message-Banner-in-SSH)
- [SSH MOTD per User | StackOverflow](http://stackoverflow.com/a/14211329/3869284)
