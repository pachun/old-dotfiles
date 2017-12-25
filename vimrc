" use true color for gruvbox: 
"   https://github.com/morhetz/gruvbox/wiki/Terminal-specific#0-recommended-neovimvim-true-color-support
set termguicolors

" install vim-plug:
"   https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install vim-plug things
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" personal preferences
colorscheme gruvbox
set background=dark
imap jj <Esc>
