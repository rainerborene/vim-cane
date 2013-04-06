# cane.vim

> Discipline will set you free.

Since you're coding in Vim.

### Usage

Open any Ruby file and you will be able to see the messages using the location
list (e.g. by invoking `:lopen` or `:ll`). See more about location using 
`:help location-list` or see the 
[online documention](http://vimdoc.sourceforge.net/htmldoc/quickfix.html).

### Configuration

#### Always Show

By default, any messages are shown when a file is loaded or saved. If you want
to only show messages when you open the location list, set the following in your
`.vimrc` file:

    let g:cane_always_show = 0

By default, messages are always shown.

#### Line Limit

Checking large files (> 1000 lines) can take a while.
To load larger files quicker, you can limit maximum number of lines a file can
have and still be checked. Files bigger than this limit will not be checked:

    let g:cane_line_limit = 1000

With no line limit set, all files will be checked.

### Installation

Place the `plugin/cane.vim` file in your `.vim/plugin` directory.
Please make sure that `cane` is up-to-date.

This plugin is also compatible with 
[pathogen](https://github.com/tpope/vim-pathogen). 
Integration can be implemented similar to 
[syntastic](https://github.com/scrooloose/syntastic) (where you also can find 
a nice set-up guide in the README)

### License

Copyright (c) Rainer Borene. Distributed under the same terms as Vim itself. See
`:help license`.
