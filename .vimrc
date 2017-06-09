" Make sure vim-gnome / vim-gtk is installed, so you get X11 support on ubuntu
" it's needed forusage of the system clipboard

call plug#begin()

" Vim-go plugin "
Plug 'fatih/vim-go'

" Color scheme
Plug 'sickill/vim-monokai'

" Silver-searcher
Plug 'rking/ag.vim'

"" Moving
" File tree vim
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" File search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'hinshun/fzf.vim'
" Text search
Plug 'easymotion/vim-easymotion'

Plug 'terryma/vim-multiple-cursors'

" Git inside vim
Plug 'tpope/vim-fugitive'

" Should provide tabs
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Set leader to space
let mapleader = " "
let g:mapleader = " "
let maplocalleader = " "
let g:maplocalleader = " "

" Enable mouse movement
set mouse=a

" <Leader><Leader>: Open files
nnoremap <silent> <Leader><Leader> :Files<CR>

" Set easy-motion command to work off <leader
map <Leader> <Plug>(easymotion-prefix)

" Maps <space>+k+b to open the nerdtree
nnoremap <leader>kb :NERDTreeToggle<CR>

let g:go_fmt_command = "goimports"

set statusline+=%F\ %l\:%c

" Highlight words matched in search
set hlsearch

" Highlight current line
set cursorline

" Set status bar
set laststatus=2
" Enable line numbers
set nu
set rtp+=~/.fzf
" set mouse+=a"
syntax enable
colorscheme monokai

" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
" " Colour theme for airline
" let g:airline_theme='bubblegum'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
" set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" nmap <c-t> :enew<cr>

" Move to the next buffer
" nmap <c-l> :bnext<CR>

" Move to the previous buffer
" nmap <c-S-h> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
" nmap <c-w> :bd <BAR> :bp <CR>

" Show all open buffers and their status
" nmap <c>bl :ls<CR>

" Allow statusline to change color when it's in the active split
hi StatusLine	ctermfg=8	ctermbg=2	cterm=NONE
hi StatusLineNC	ctermfg=2	ctermbg=8	cterm=NONE

" Maps leader to fzf
"noremap <leader><leader> :Files<CR>


augroup auglobal
	  " Automatically open quickfix window after grepping
	autocmd QuickFixCmdPost *grep* cwindow
augroup END

" Set the statusline to be colored while active
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
