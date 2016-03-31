# Svn Checkout Directories only

```
project/
├── dir1
│   └── subdir1
│       ├── file1
│       ├── file2
│       └── file3
├── dir2
│   ├── subdir1
│   └── subdir2
└── dir3
    ├── subdir1
    │   ├── file1
    │   └── file2
    └── subdir2
```

## Checkout all directories only on the root of the repo


```
svn co --depth immediates http://svn.xxx.com/project .
```

This would checkout the empty directories `dir1`, `dir2`, `dir3`

### Get another level of the directories 

```
svn up --set-depth immediates dir2
```

This would update all subdirectories under `dir2`, i.e. `dir2/subdir1` and `dir2/subdir2`

### Get all of the contents inside `dir3`

```
svn up --set-depth infinity dir3
```

This would update all subdirectories and files recursively

## Reference

- http://svnbook.red-bean.com/en/1.7/svn.advanced.sparsedirs.html
- http://stackoverflow.com/a/50980/3869284

