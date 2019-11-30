# interactive-rebase

## Interactive Rebase

1. find out the commit a point earlier than the one you want to modify
2. execute the command:

```bash
git rebase -i <earlier_commit>
```

1. change the text from `pick` to `edit` in the list of the commits
2. to change the author of the commit:

```bash
git commit --amend --author="Author Name <email@address.com>"
```

1. `git rebase --continue`
2. `git push -f`

## References

* [https://stackoverflow.com/questions/3042437/how-to-change-the-commit-author-for-one-specific-commit](https://stackoverflow.com/questions/3042437/how-to-change-the-commit-author-for-one-specific-commit)

