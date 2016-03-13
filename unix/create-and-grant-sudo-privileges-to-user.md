# Create and Grant Sudo Privileges to user

note: already signed in as `root` user, if signed in as a non-root user, add `sudo` before the cmd

## Add a new user

```
$ adduser <username>
```

## Give the new user a password

```
$ passwd <username>
```

## Grant Sudo Privileges to a user

Make sure the `wheel` group is granted sudo privileges:

```
$ visudo
```

Uncomment the second line as following:

```
## Allows people in group wheel to run all commands
%wheel  ALL=(ALL)       ALL
```

```
$ gpasswd -a <username> wheel
```

## Copy ssh public key to the user account

```
$ ssh-keygen -t rsa # only need if key is not generated before
$ ssh-copy-id <username>@<ip addr>
```

---

Ref: [How To Add and Delete Users on a CentOS 7 Server](https://www.digitalocean.com/community/tutorials/how-to-add-and-delete-users-on-a-centos-7-server)
