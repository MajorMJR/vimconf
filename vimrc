" Leader Key as comma
let mapleader = ","

execute pathogen#infect()
execute pathogen#helptags()

" Use space instead of tabs 4 chars
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set smartindent
set autoindent

" text wrapping
set nowrap  " dont auto wrap on load
set fo-=t   " dont wrap when typing

" Proper paste
set paste

" Enable auto indenting
filetype plugin indent on

" Dark background
set background=dark

" Syntax highlighting of course.
syntax enable
filetype on

" Enable 256 colours
set t_Co=256

" Colorscheme
colorscheme jellybeans 

" Add column at 80 char
set colorcolumn=80
highlight ColorColumn ctermbg=232

" line numbers on
set number

" mouse mode
set mouse=a

" fix backspace
set bs=2

" easier indenting of code blocks
vnoremap < <gv 
vnoremap > >gv

" If i search in uppercase, it's case sensative. If I search in lowercase,
" it isn't.
set smartcase

" Identing options. I find these the best but some people prefer cindent
set autoindent

" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1

nnoremap <silent><F6> :set list!<CR>

" " Stops the cursor reaching the bottom of the screen which is a god send
" because when you're writing huge functions you end up typing on the bottom
" line else and you can't see how much space you have.
set scrolloff=3

" tap F5 to toggle highlighting the search terms on and off
nnoremap <silent><F5> :set hlsearch!<CR>

" tap F3 to toggle line numbers
nnoremap <silent><F3> :set number!<CR>

" Tap 
nmap <Leader>g :GitGutterToggle<CR>

" show spelling mistakes by pressing F10. Move over a word and press tap z=
" (not in insert mode) to get a list of suggestions 
noremap <silent><F10> :set spell!<CR>

" backup options
set backupdir=~/tmp,/tmp " backups (~)
set directory=~/tmp,/tmp " swap files
set backup " enable backups

" Start Nerdtree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Disable gitgutter by default
let g:gitgutter_enabled = 0

" Use system clipboard
set clipboard=unamed

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Golang highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Enable goimports
let g:go_fmt_command = "goimports"

" Map leader W to save without sudo
noremap <Leader>W :w !sudo tee % > /dev/null
