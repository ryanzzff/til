# Fork a repo

In GitHub, when we want to make changes on someone else's project, we would fork\(copy\) the repo to our own account, so we can make changes to the project, without affecting the original project.

If we are not using GitHub, we can add a upstream remote to do the same thing.

We have 3 different repos:

* Upstream repo \(3rd party repo\)
* Our fork repo \(a copy of upstream repo, and we have full control\)
* Our local repo \(a clone of our fork repo, our working copy in local machine\)

## Steps

1. Create our fork repo
2. Clone our fork repo on local machine
3. Add upstream repo as a remote
4. Pull from upstream and push to our fork repo

## 1. Create our fork repo \(on our git server\)

```text
$ git init --bare {path_to_repo}/our-fork.git
```

## 2. Clone our fork repo \(on local machine\)

```text
$ mkdir -p {path_to_our_working_copy} && cd $_ 
$ git clone {our_fork_url}
```

## 3. Add upstream repo as a remote

list all remotes:

```text
$ git remote -v

origin {our_fork_url} (fetch)
origin {our_fork_url} (push)
```

Add upstream repo

```text
$ git remote add upstream {upstream_repo_url}

# list all remotes again
$ git remote -v

origin {our_fork_url} (fetch)
origin {our_fork_url} (push)
upstream {upstream_repo_url} (fetch)
upstream {upstream_repo_url} (push)
```

## 4. Pull from upstream and push to our fork repo

