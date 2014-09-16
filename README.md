GnuMathProg-Vim-Syntax
======================

This is a syntax file to have the syntax on in Vim while editing `.mod` and `.dat` files with GnuMathProg

To install it download the repo as `.zip` archive and extract it in `~/.vim/`

the filetype file has `.new` extension to prevent to erase yours if you have one.
So if you have one just add it at the end of yours with `cat filetype.vim.new >> filetype.vim`
Otherwise, just rename it `mv filetype.vim.new filetype.vim`

Then, add `let mod=/home/$USER/.vim/syntax/mod.vim` in your `~/.vimrc` or `/etc/vimrc` (as root for this one). Pay attention to write it BEFORE any `syntax on` or `filetype on` otherwise it will not colored you files when you will open them.
