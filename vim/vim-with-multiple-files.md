# Vim with Multiple Files

## Buffers

### Open multiple file into buffers

```
$ vi a.txt b.txt c.txt
```

### Add files to the buffers

```
:e <file_path>
```

### List all files of current buffers

```
:ls
```

Output of `:ls`:
```
:ls
  1 %a   "a.txt"                        line 1
  2      "b.txt"                        line 0
  3      "c.txt"                        line 0
```

### Switch file using index

```
:b <index>
:b 2
```

where 2 is the index in `:ls`

### Switch file using file name

```
:b <file_name>
:b a.txt
```

### Switch prev/next buffer

```
:bp
:prev

:bn
:n
```

### Switch to last visited buffer

Toggle between 2 files when repeatedly using this cmd

```
:b#
```

## Using Tabs

### Open multiple files into tabs

```
$ vi -p a.txt b.txt c.txt
```

### Add a new Tab

```
:tabe <file_path>
```

### Switch to prev/next Tab

```
:tabp
:tabn
```

## Split Screen

### Split Horizontally (up and down)

```
:sp <file_path>
```

### Split Vertically (left and right)

```
:vsp <file_path>
```

### Open files into horizontally splitted windows

```
$ vi -o a.txt b.txt c.txt
```

### Open files into vertically splitted windows

```
$ vi -O a.txt b.txt c.txt
```

### Move between splitted windows

<kbd>Ctrl</kbd>+<kbd>W</kbd>+<kbd>Arrow</kbd>

### Move to next splitted window

<kbd>Ctrl</kbd>+<kbd>W</kbd>+<kbd>W</kbd>

## Reference

- [How to effectively work with multiple files in Vim? | StackOverflow](http://stackoverflow.com/questions/53664/how-to-effectively-work-with-multiple-files-in-vim)
- [Vim Tab Madness. Buffers vs Tabs](http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/)
