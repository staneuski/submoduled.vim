" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:loaded_umbrella_base')
  finish
else
  let g:loaded_umbrella_base = v:true
endif

:" https://github.com/sheerun/vimrc/blob/73e4c4606bf54f0f22534afcb2320471566fbd4a/plugin/vimrc.vim#L148-L356 {{{

" Indent using two spaces.
if &tabstop == 8 && &shiftwidth == 8
  set tabstop=2
  set shiftwidth=2
endif

" Enable undofile and set undodir and backupdir
let s:dir = has('win32') ? '$APPDATA/Vim' : isdirectory($HOME.'/Library') ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
let &backupdir = expand(s:dir) . '/backup//'
let &undodir = expand(s:dir) . '/undo//'
set undofile

" Automatically create directories for backup and undo files.
if !isdirectory(expand(s:dir))
  call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
end

" Keep flags when repeating last substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$

" Highlight line under cursor. It helps with navigation.
set cursorline
set cursorlineopt=number

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Set minimum window size to 79x5.
set winwidth=79
set winheight=5
set winminheight=5

" If opening buffer, search first in opened windows.
set switchbuf=usetab

" Hide buffers instead of asking if to save them.
set hidden

" Wrap lines by default
set wrap linebreak
set showbreak=" "

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" Show line relative numbers on the sidebar.
set number relativenumber

" Disable any annoying beeps on errors.
set noerrorbells
set visualbell

" Don't parse modelines (google "vim modeline vulnerability").
set nomodeline

" Folding (modified)
set foldmethod=indent
set foldnestmax=3 "fold up to 3 levels
" set nofoldenable "do not fold by default

" Enable mouse for scrolling and window resizing.
set mouse=a

" This is needed to avoid swapfile warning when auto-reloading
set shortmess+=A

" Avoids swapfiles in current directory
if &directory =~# '^\.,'
  if !empty($HOME)
    if has('win32')
      let &directory = expand('$HOME/vimfiles') . '//,' . &directory
    else
      let &directory = expand('$HOME/.vim') . '//,' . &directory
    endif
  endif
  if !empty($XDG_DATA_HOME)
    let &directory = expand('$XDG_DATA_HOME') . '//,' . &directory
  endif
  if has('macunix')
    let &directory = expand('$HOME/Library/Autosave Information') . '//,' . &directory
  endif
endif

" Save up to 100 marks, enable capital marks.
set viminfo='100,f1

" Enable search highlighting.
set hlsearch

" Ignore case when searching.
set ignorecase

" Show mode in statusbar, not separately.
set noshowmode

" Don't ignore case when search has capital letter
" (although also don't ignore case by default).
set smartcase

" Use dash as word separator.
set iskeyword+=-

" Add gems.tags to files searched for tags.
set tags+=gems.tags

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Auto center on matched string.
noremap n nzz
noremap N Nzz

" Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]

" Expand %% to path of current buffer in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Enable saving by `Ctrl-s`
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" Set window title by default.
set title

" Always focus on splited window.
set splitright
set splitbelow

" Don't display the intro message on starting Vim.
set shortmess+=I

" Allow for easy copying and pasting
vnoremap <silent> y y`]
nnoremap <silent> p p`]

" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Prevent common mistake of pressing q: instead :q
map q: :q

" Make a simple "search" text object.
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
" It allows for replacing search matches with cs and then /././.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
      \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Disable writebackup because some tools have issues with it:
" https://github.com/neoclide/coc.nvim/issues/649
set nowritebackup

" Reduce updatetime from 4000 to 300 to avoid issues with coc.nvim
set updatetime=300

" Auto reload if file was changed somewhere else (for autoread)
au FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif

" Merge signcolumn with number line (if supported)
if has("patch-8.1.1564")
  set signcolumn=number
endif

" Change default theme for lightline to match default for colorscheme
if !exists("g:lightline")
  let g:lightline = { 'colorscheme': 'powerlineish' }
end

" Also set better lightline layout
if !has_key(g:lightline, 'active')
  let g:lightline['active'] = {
        \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']],
        \   'right': [ [], [ 'gitbranch' ], [ 'filetype' ]]
        \ }
  let g:lightline['component'] = { 'filetype': '%{&filetype}' }
  let g:lightline['component_function'] = { 'gitbranch': 'fugitive#head' }
endif
:" }}}

": General settings {{{
set langnoremap

": https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
if v:version > 800
  let &t_SR.="\e[4 q" "SR = REPLACE mode
endif

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

set ai "auto indent
set si "smart indent
": }}}
