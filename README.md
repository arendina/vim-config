# vim-config

A vimrc configuration file

## Prerequisistes

TODO

## Installation

Download the vimrc file, put it in your home .vimrc
From vim run :PlugInstall

## Basic Commands

### Split layouts 

horizontal split: sp <filename>
Vertical split:  vs <filename>

### Split commands

| command | description |
| ------- | ----------- |
| C-J     | move to the split below |
| C-K     | move to the split above |
| C-L     | move to the split to the right |
| C-H       | move to the split to the left |

You can use tab completion to have the list of files after typing the command.

## Plugins

### Fugitive Commands

| Leader shortcut | Command |
| --------------- | ------- |
| ,ga | :Gwrite |
| ,gc | :Git commit |
| ,gsh | :Git push |
| ,gll | :Git pull |
| ,gs  | :Gstatus |
| ,gb  | :Git blame |
| ,gd  | :Gvdiff |
| ,gr | :Gremove |
