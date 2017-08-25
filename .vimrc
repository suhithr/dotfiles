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

" Syntax checker (requires pip install flake8 to be installed)
" Plug 'scrooloose/syntastic'

" Git inside vim
Plug 'tpope/vim-fugitive'

" Should provide tabs
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Dim inactive windows
Plug 'blueyed/vim-diminactive'

" Seoul low contrast color scheme
Plug 'junegunn/seoul256.vim'

" Adds Ctrl-dir seamlessly btw vim, tmux and fzf
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Set leader to space
let mapleader = " "
let g:mapleader = " "
let maplocalleader = " "
let g:maplocalleader = " "

" Enable mouse movement
set mouse=a

" No swap files
set noswapfile

" set tabs to 4 spaces
set tabstop=4

" <Leader><Leader>: Open files
nnoremap <silent> <Leader><Leader> :Files<CR>

" Set easy-motion command to work off <leader
map <Leader> <Plug>(easymotion-prefix)

" Maps <space>+k+b to open the nerdtree
nnoremap <leader>kb :NERDTreeToggle<CR>

let g:go_fmt_command = "goimports"

" Make GoFmt also handle imports on save
set statusline+=%F\ %l\:%c

" Highlight words matched in search
set hlsearch
hi Search guibg=LightGreen

" Set the background to black`
highlight Normal guifg=grey guibg=black

" Highlight current line
set cursorline

" Save the macro to insert logrus.Info globally
let @l = 'ilogrus.Info()'

" Save macro to insert // TODO(suhith): globally
let @j = 'i// TODO(suhith):a '

" Set status bar
set laststatus=2
" Enable line numbers
set nu
set rtp+=~/.fzf
" set mouse+=a"
syntax enable
" colorscheme monokai

" Unified color scheme (default: dark)
let g:seoul256_background = 233
colo seoul256

" Make search fzf previews full screen
let g:fzf_layout = { 'window': '-tabnew' }

" Allow statusline to change color when it's in the active split
hi StatusLine	ctermfg=8	ctermbg=2	cterm=NONE
hi StatusLineNC	ctermfg=2	ctermbg=8	cterm=NONE


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
