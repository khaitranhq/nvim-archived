# Neovim config
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
## Vim trick
### Split window
- `:vs` split horizontal
- `:sp` split vertical
- `X<leader>,` increase width of tab
- `X<leader>.` decrease width of tab
- `X<leader>-` decrease height of tab
- `X<leader>=` increase height of tab
### Folding
- `zc` close the fold
- `zM` close all fold on current buffer
- `zo` open the fold
- `zR` open all folds on current buffer
- `zj` cursor is moved to next fold
- `zk` cursor is moved to previous fold
### Moving
- `Ctrl + o` Move to previous postion of cursor
- `Ctrl + 6` Back to previous file
### Change, delete
- `ctC` delete until meet charactor C and change mode to insert
- `csiw"'` change " to ' in current word (only contain Alphabet character)
- `csiW[{` change [] to {} in current word (continuos charactor without space)
- `cst<p>` change tag surround to <p>
- `dsiW{` delete {} in current word (continuos charactor without space)
- `<leader>rn` rename variables, function...
