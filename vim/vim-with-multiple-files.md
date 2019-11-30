# Vim with Multiple Files

## Buffers

### Open multiple file into buffers

```text
$ vi a.txt b.txt c.txt
```

### Add files to the buffers

```text
:e <file_path>
```

### List all files of current buffers

```text
:ls
```

Output of `:ls`:

```text
:ls
  1 %a   "a.txt"                        line 1
  2      "b.txt"                        line 0
  3      "c.txt"                        line 0
```

### Switch file using index

```text
:b <index>
:b 2
```

where 2 is the index in `:ls`

### Switch file using file name

```text
:b <file_name>
:b a.txt
```

### Switch prev/next buffer

```text
:bp
:prev

:bn
:n
```

### Switch to last visited buffer

Toggle between 2 files when repeatedly using this cmd

```text
:b#
```

## Using Tabs

### Open multiple files into tabs

```text
$ vi -p a.txt b.txt c.txt
```

### Add a new Tab

```text
:tabe <file_path>
```

### Switch to prev/next Tab

```text
:tabp
:tabn
```

## Split Screen

### Split Horizontally \(up and down\)

```text
:sp <file_path>
```

### Split Vertically \(left and right\)

```text
:vsp <file_path>
```

### Open files into horizontally splitted windows

```text
$ vi -o a.txt b.txt c.txt
```

### Open files into vertically splitted windows

```text
$ vi -O a.txt b.txt c.txt
```

### Move between splitted windows

Ctrl+W+Arrow

### Move to next splitted window

Ctrl+W+W

## Reference

* [How to effectively work with multiple files in Vim? \| StackOverflow](http://stackoverflow.com/questions/53664/how-to-effectively-work-with-multiple-files-in-vim)
* [Vim Tab Madness. Buffers vs Tabs](http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/)

