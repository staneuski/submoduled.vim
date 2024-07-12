" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:loaded_umbrella_base')
  finish
else
  let g:loaded_umbrella_base = v:true
endif

": General settings {{{
set langnoremap+

": Enable filetype plugins
filetype indent plugin on

": Height of the command bar
set cmdheight=1

set whichwrap+=<,>,h,l

": Highlight current line
set cursorline

": Don't redraw while executing macros (good performance config)
set lazyredraw

": For regular expressions turn magic on
" set magic

": Show matching brackets when text indicator is over them
set showmatch

": How many tenths of a second to blink when matching brackets
set mat=2

": No annoying sound on errors
set t_vb=
set tm=500

": Mouse support
set ttymouse=sgr
if v:version > 800
  set balloonevalterm
endif

": Show relative line numbers
set number relativenumber

": Set regular expression engine automatically
" set regexpengine=0
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
": }}}
