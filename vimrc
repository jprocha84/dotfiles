" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
" set clipboard=unnamed

" Added by me
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
set nocompatible

" Mouse and backspace
set bs=2     " make backspace behave like normal again

" if has('mouse')
"     set mouse=a
" endif

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

noremap <Leader>w :w<CR>   " Write the changes in buffer


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=119   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=120
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

set cursorline
setlocal foldmethod=syntax
set showcmd
set relativenumber

" Python Indentation
set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=4  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> character
" ---- Good to have for consistency
set tabstop=4   " Number of spaces that a <Tab> in the file counts for
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth
" ---- Bonus for proving the setting
" Displays '-' for trailing space, '>-' for tabs and '_' for non breakable space
set listchars=tab:>-,trail:-,nbsp:_
set list

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Leader>b"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ultisnips_python_style="numpy"
let g:UltiSnipsEditSplit="vertical"

let g:pydocstring_formatter = 'numpy'


call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'webdevel/tabulous'
Plug 'git://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'nvie/vim-flake8'
Plug 'Chiel92/vim-autoformat'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gmccreight/vim-easygrep'
Plug 'dyng/ctrlsf.vim'
Plug 'hashivim/vim-terraform'
Plug 'FredKSchott/CoVim'
Plug 'scrooloose/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
call plug#end()

""""""""""""
" NERDTree
""""""""""""
let NERDTreeShowHidden=1

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

""""""""""""
" CtrlSF
""""""""""""

" https://github.com/dyng/ctrlsf.vim
" CtrlSF!

" Set "<leader>s" to substitute the word under the cursor. Works great with
" CtrlSF
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Set up some handy CtrlSF bindings
nmap <leader>a :CtrlSF -R ""<Left>
nmap <leader>A <Plug>CtrlSFCwordPath -W<CR>
nmap <leader>c :CtrlSFFocus<CR>
nmap <leader>C :CtrlSFToggle<CR>

" Use Ripgrep with CtrlSF for performance
let g:ctrlsf_ackprg = '/snap/bin/rg'

" https://hisham.hm/htop/
noremap <leader>h :tab term ++close htop<CR>

" https://github.com/jesseduffiedl/lazygit
noremap <leader>g :tab term ++close lazygit<CR>

noremap <leader>t :tab term ++close<CR>

" Easily GREP current word in current file.
command GREPCF :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc
noremap <leader>z :cprevious<CR>
noremap <leader>x :cnext<CR>

set splitbelow
set splitright

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

noremap <leader>y :CtrlP<CR>
noremap <leader>Y :CtrlPBuffer<CR>



