" use true color for gruvbox:
"   https://github.com/morhetz/gruvbox/wiki/Terminal-specific#0-recommended-neovimvim-true-color-support
set termguicolors " comment this if you're not useing gruvbox

" Leader
let mapleader=" "

au VimResized * :redraw!

" install vim-plug:
"   https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install vim-plug things
call plug#begin('~/.vim/plugged')
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
Plug 'lifepillar/vim-solarized8'
Plug 'phongvcao/vim-stardict'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'mhinz/vim-mix-format'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'sbdchd/neoformat'
call plug#end()

augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.tsx Neoformat
augroup END

let g:neoformat_enabled_javascript = ['prettier', 'eslint_d']

" autocmd BufWritePre *.tsx Neoformat

" Prettier settings
" let g:prettier#config#print_width = 80
" let g:prettier#config#tab_width = 2
" let g:prettier#config#use_tabs = 'false'
" let g:prettier#config#single_quote = 'false'
" let g:prettier#config#bracket_spacing = 'true'
" let g:prettier#config#jsx_bracket_same_line = 'false'
" let g:prettier#config#arrow_parens = 'avoid'
" let g:prettier#config#trailing_comma = 'all'
" let g:prettier#config#parser = 'typescript'
" let g:prettier#config#semi = 'false'

" Split to current file
nnoremap <leader>eh :Vexplore<cr>
nnoremap <leader>ej :Hexplore<cr>
nnoremap <leader>ek :Hexplore!<cr>
nnoremap <leader>el :Vexplore!<cr>

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

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Don't ask me if I want to load changed files. The answer is always 'Yes'
set autoread

let g:ale_fixers = {
\   'javascript': ['prettier'],
\}
let g:ale_fix_on_save=1

" personal preferences
imap jj <Esc>

" personal preferences

syntax enable
set background=dark
colorscheme solarized8

" syntax highlight inline xml inside of .js and .jsx files
let g:jsx_ext_required = 0

" enable control + p fuzzy filename searching
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" format elixir files on save
let g:mix_format_on_save = 1

" Settings for Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

augroup AleGroup
    autocmd!
    autocmd User ALELint call TouchOpenFile()
augroup END

func! TouchOpenFile()
    let g:ale_enabled = 0
    sleep 500m
    let g:ale_enabled = 1
endfunc
