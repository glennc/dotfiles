" Default _vimrc.
set nocompatible
"source $VIMRUNTIME/mswin.vim
"behave mswin

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Force *.md to be markdown instead of Modula-2...Who wants it to be Modula-2
" anyway?
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
set ruler "show cursor position (bottom right)
set showcmd " display incomplete commands
set incsearch " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

if has('win32') || has('win64')
    set runtimepath^=$VIM/bundle
    set dir=$TEMP
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

source $VIM\bundle\pathogen\autoload\pathogen.vim
execute pathogen#infect(expand('$VIM/bundle/{}'))

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set encoding=utf-8

if has('gui_running')
    "Set Color Scheme and font
    colorscheme oxeded

    " Maximize the window on launch
    if has('win32') || has('win64')
        au GUIEnter * simalt ~x
    endif
    if has("unix")
      let s:uname = system("uname")
      if s:uname == "Darwin\n"
        " Do Mac stuff here
        set fuopt=maxhorz,maxvert
        "au GUIEnter * set fullscreen
      endif
    endif
endif

set list listchars=tab:».,trail:·

"Set up VIM GUIs
set guioptions-=m " Hide menu bar
set guioptions-=T " Remove toolbar
set guioptions-=r " Remove right hand scroll bar
set guioptions-=L " Remove left hand scroll bar

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Allow more than 8 commands in history file
set history=100

" CtrlP settings
let g:ctrlp_working_path_mode='ra'
