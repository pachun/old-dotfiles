" use true color for gruvbox:
"   https://github.com/morhetz/gruvbox/wiki/Terminal-specific#0-recommended-neovimvim-true-color-support
set termguicolors

" Leader
let mapleader = " "

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
Plug 'vim-scripts/tComment'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'iCyMind/NeoSolarized'
call plug#end()

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" run tests in another tmux pane with tslime
let test#strategy = "tslime"
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
map <leader>tv <Plug>SetTmuxVars
" Run the current file in another tmux pane
nnoremap <leader>r :call Send_to_Tmux("./" . @% . "\n")<CR>

" I never want :W or :Q and it's too easy to keep holding shift
command! W w
command! Q q

" make vim and system keyboard one and the same
set clipboard=unnamed

" show line numbers
set number relativenumber

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Don't ask me if I want to load changed files. The answer is always 'Yes'
set autoread

" personal preferences
imap jj <Esc>

" personal preferences
colorscheme NeoSolarized
set background=dark

" syntax highlight inline xml inside of .js and .jsx files
let g:jsx_ext_required = 0

" enable control + p fuzzy filename searching
set runtimepath^=~/.vim/bundle/ctrlp.vim

