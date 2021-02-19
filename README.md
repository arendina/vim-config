# vim-config

A vimrc configuration file

## Prerequisistes

TODO

## Installation

Download the vimrc file, put it in your home .vimrc
From vim run :PlugInstall

## Basic Commands

### Sessions

| Shortcut | Command | Description |
| -------- | ------- | ----------- |
| ,s | :mksession | save a session |


### Search
| Shortcut | Command | Description |
| -------- | ------- | ----------- |
| ,space | :nohlsearch | turn off search highlight |

### Split layouts 

horizontal split: sp <filename>
Vertical split:  vs <filename>

### Split Navigation Commands

| Command | Description |
| ------- | ----------- |
| C-J     | move to the split below |
| C-K     | move to the split above |
| C-L     | move to the split to the right |
| C-H       | move to the split to the left |

You can use tab completion to have the list of files after typing the command.

### Buffers

| Command | Description |
|-------- | ----------- |
| :ls     | list buffers |
| :b buffer name or number | open buffer |

### Folding

| Shortcut | Command |
| -------- | ------- |
| space | za |

## Plugins

### Fugitive Commands

| Shortcut | Command | Description |
| -------- | ------- | ----------- |
| ,ga | :Gwrite | git add file |
| ,gc | :Git commit | commit |
| ,gsh | :Git push | push |
| ,gll | :Git pull | pull |
| ,gs  | :Gstatus | status |
| ,gb  | :Git blame | blame |
| ,gd  | :Gvdiff | diff |
| ,gr | :Gremove | remove |

### NerdTree Commands

| Shortcut | Command |
| -------- | ------- |
| ,n | :NERDTreeFocus | 
| C-n | :NERDTree |
| C-t | :NERDTreeToggle |
| C-f | :NERDTreeFind |
