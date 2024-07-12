" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:packadd_umbrella_core')
  finish
else
  let g:packadd_umbrella_core = v:true
endif

packadd umbrella-colour
packadd umbrella-interface

": Preserve neovim defualts {{{
set autoindent
set complete-=i
set display=lastline
set formatoptions=tcqj
set langnoremap
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set nrformats=hex
set tags=./tags;,tags
": }}}

": General settings {{{
": Enable filetype plugins
filetype indent plugin on

": Set to auto read when a file is changed from the outside
au FocusGained,BufEnter * silent! checktime

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

": Height of the command bar
set cmdheight=1

": A buffer becomes hidden when it is abandoned
set hidden

set whichwrap+=<,>,h,l

": Ignore case when searching
" set ignorecase

": When searching try to be smart about cases
set smartcase

": Highlight current line
set cursorline

": Highlight search results
set hlsearch

": Don't redraw while executing macros (good performance config)
set lazyredraw

": For regular expressions turn magic on
" set magic

": Show matching brackets when text indicator is over them
set showmatch

": How many tenths of a second to blink when matching brackets
set mat=2

": No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
": }}}

": File settings {{{
": Set utf-8 as standard encoding and en_US as the standard language
set encoding=utf8

": Turn backup off
" set nobackup
" set nowb
" set noswapfile
": }}}

": Text, tab and indent related {{{
": Use spaces instead of tabs
set expandtab

": 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

": Linebreak on 500 characters
set lbr
set tw=500

set ai " auto indent
set si " smart indent
set wrap " wrap lines
": }}}
