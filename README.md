## Basic

### Install
#### Dependencies
node, python, clangd, yapf, pylint, tslint
#### Neovim
google.com
#### Vim-plug
google.com
#### Where will we put these configs
`~/.configs`
clone this repo here
### Extensions should be install

### Change mode

- `i` to toggle insert mode: We can type, insert text to cursor's position.
- `<ESC>` to toggle normal mode: type command, shortcut key,..
- `v` change to visual mode. In this mode, you can select text segment for copying, cut, comment,.. All moving shortkey can use in this mode.

### Basic moving

- `h` `j` `k` `l` for moving cursor to left, down, up right

```
    k
    |
h--------l
    |
    j
```

- `Xh`, `Xj`, `Xk`, `Xl` for moving cursor to left, down, up, right X units (X is a number) e.g `5j`
- `w` for moving cursor to begin of next word
- `Xw` similar above
- `b` for moving cursor to begin of previous word
- `Xb` similar above

### Delete

- `dd` for delete curent line
- `dXd` similar above

### Create blank line

- `o` for create new blank line below, `O` for create new line above (o upper and lowercase)
- `Xo` sligtly different, you can try this to see the change

### Undo redo

- `u` for undo, `<C-r>` for redo (<C-r> mean Ctrl + r)

### Home, end, pageup, page down

- `gg` for going to the beginning of file
- `Xgg` for go to line X
- `G` for ....end of file
- `<C-u>` like `page up` key
- `<C-d>` like `page down` key
- `0` for go to beginning of line
- `$` for go to end of line

### Copy, cut, paste

- `"+y` copy to clipboard (Press key `"` then `+` then `y`). Use this after select text in visual mode
- `"+d` cut to clipboard. Use this after select text in visual mode
- `"+p` paste to clipboard
- `y` just copy. Use after select text
- `d` just cut (maybe use as deleting). Use after select text
- `p` paste from `y` or `d`

### Buffer

File was open under buffer in vim.

### Split window

- `:vs` split horizontal
- `:sp` split vertical
- `<C-h>` `<C-j>` `<C-k>` `<C-l>` moving left, down, up, right buffer

## Vimawesome

You can find all vim extension here

## Plugins:

### Nerdtree
### Coc.nvim
### Folding
- `zc` close the fold
- `zM` close all fold on current buffer
- `zo` open the fold
- `zR` open all folds on current buffer
- `zj` cursor is moved to next fold
- `zk` cursor is moved to previous fold
