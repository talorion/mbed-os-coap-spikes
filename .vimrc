set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=./.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('./.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" YouCompleteMe is a fast, as-you-type, fuzzy search code completion engine
" for Vim
Plugin 'valloric/youcompleteme'

" NERDTree is a filesystem explorer for Vim
Plugin 'scrooloose/nerdtree'

" Full path fuzzy file buffer, mru, tag, ... finder for vim
 Plugin 'ctrlpvim/ctrlp.vim'

"Easily toggle between *.c* and *.h* buffers.
Plugin 'ericcurtin/CurtineIncSw.vim'

" Comment functions so powerful—no comment necessary.
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Close window if last remaining window is Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Add line numbers
set number
set ruler
set cursorline

" Disable Backup and Swap files
set noswapfile
set nobackup
set nowritebackup

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" highlight all occurrence of a search
set hlsearch

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" highlight column number 110 with color.
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Disable Mode Display because Status line is on
set noshowmode

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" map <F2> for NERDTreeToggle
nnoremap <silent> <F2> : NERDTreeToggle<CR>

" map <F4> for toggle heder source
nnoremap <silent> <F4> : call CurtineIncSw()<CR>

" map <F5> for make
nnoremap <silent> <F5> :!./mbed-os-coap-client/mbed-os-coap-client<cr>

" map <F7> for make
" ! mark prevents Vim from jumping to location of first error found
nnoremap <silent> <F7> : make!<CR>

" map <F9> for Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

" map <F12> for GoToDefinition
nnoremap <silent> <F12> :YcmCompleter GoTo<CR>

" nnoremap <C-s> :w
noremap <Leader>s :wa<CR>

" nnoremap <C-S> :wa
" noremap <Leader>s :wa<CR>
nnoremap <silent> <Leader>t :!ctest --output-on-failure<CR>

nnoremap <Tab> :tabn<cr>

" run ctags when c/c++ file is saved
function! DelTagOfFile(file)
    let fullpath = a:file
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let f = substitute(fullpath, cwd . "/", "", "")
    let f = escape(f, './')
    let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
    let resp = system(cmd)
endfunction

function! UpdateTags()
    let f = expand("%:p")
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
    call DelTagOfFile(f)
    let resp = system(cmd)
endfunction

autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()

