" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:loaded_submoduled_base')
  finish
else
  let g:loaded_submoduled_base = 1
endif

function! RequirePackAdd(plugin, is_loaded)
  if !exists(a:is_loaded) || get(g:, a:is_loaded, 0) == 0
    execute 'packadd ' . a:plugin
  endif
endfunction

": Full colour support {{{
"   https://github.com/kovidgoyal/kitty/blob/master/docs/faq.rst#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
"   https://vim-jp.org/vimdoc-en/term.html
if v:version > 800
  ": Styled and colored underline support
  let &t_AU = "\e[58:5:%dm"
  let &t_8u = "\e[58:2:%lu:%lu:%lum"
  let &t_Us = "\e[4:2m"
  let &t_Cs = "\e[4:3m"
  let &t_ds = "\e[4:4m"
  let &t_Ds = "\e[4:5m"
  let &t_Ce = "\e[4:0m"

  ": Strikethrough
  let &t_Ts = "\e[9m"
  let &t_Te = "\e[29m"

  ": Truecolor support
  let &t_8f = "\e[38:2:%lu:%lu:%lum"
  let &t_8b = "\e[48:2:%lu:%lu:%lum"
  let &t_RF = "\e]10;?\e\\"
  let &t_RB = "\e]11;?\e\\"

  ": Cursor control (shape in insert/replace/normal: see terminus)
  let &t_RC = "\e[?12$p"
  let &t_SH = "\e[%d q"
  let &t_RS = "\eP$q q\e\\"
  let &t_VS = "\e[?12l"

  ": Window title
  let &t_ST = "\e[22;2t"
  let &t_RT = "\e[23;2t"
endif

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
": }}}

": https://github.com/sheerun/vimrc/blob/73e4c4606bf54f0f22534afcb2320471566fbd4a/plugin/vimrc.vim#L148-L356 {{{

" Enable undofile and set undodir and backupdir
let s:basedatadir = has("win32") ? "$APPDATA"
  \ : isdirectory($HOME . "/Library") ? "$HOME/Library"
    \ : empty($XDG_DATA_HOME) ? "$HOME/.local/share" : "$XDG_DATA_HOME"
let g:datadir = expand(s:basedatadir . "/" . (has("nvim") ? "nvim" : "vim"))

let &backupdir = expand(g:datadir) . '/backup//'
let &undodir = expand(g:datadir) . '/undo//'
set undofile

" Automatically create directories for backup and undo files.
for s:dir in [expand(g:datadir) . '/backup', expand(g:datadir) . '/undo']
  if !isdirectory(s:dir)
    call mkdir(s:dir, 'p', 0700)
  endif
endfor

" Keep flags when repeating last substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$

" Highlight line under cursor. It helps with navigation.
set cursorline
" set cursorlineopt=number

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

" Folding (modified)
set foldmethod=indent
set foldnestmax=3 "fold up to 3 levels
set nofoldenable "do not fold by default

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

" Update term title but restore old title after leaving Vim.
set title
set titleold=

" Always focus on splited window.
set splitright
set splitbelow

" Don't display the intro message on starting Vim.
set shortmess+=I

" Allow for easy copying and pasting
vnoremap <silent> y y`]
nnoremap <silent> p p`]

" Make sure pasting in visual mode doesn't replace paste buffer
xnoremap p P

" Prevent common mistake of pressing q: instead :q
map q: :q

" Make a simple "search" text object, on `gs` (`s` is vim-sneak's).
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
" It allows for replacing search matches with cgs and then /././.
xnoremap <silent> gs //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
      \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap gs :normal vgs<CR>

" Disable writebackup because some tools have issues with it:
" https://github.com/neoclide/coc.nvim/issues/649
set nowritebackup

" Reduce updatetime from 4000 to 300 to avoid issues with coc.nvim
set updatetime=300

" Auto reload if file was changed somewhere else (for autoread)
au BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif

" Merge signcolumn with number line (if supported)
if has("patch-8.1.1564")
  set signcolumn=number
endif
:" }}}

": General settings {{{
": Height of the command bar
set cmdheight=1

set whichwrap+=<,>,h,l

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

": Mouse support (mouse/ttymouse: see terminus)
if !has('nvim') && v:version > 800
  set balloonevalterm
endif

": Set regular expression engine automatically
" set regexpengine=0
": }}}

": File settings {{{
": Turn backup off
" set nobackup
" set nowb
" set noswapfile
": }}}

": Text, tab and indent related {{{
": Fallback indentation; sleuth overrides per-buffer
set expandtab
set shiftwidth=4
set tabstop=4

": Linebreak on 500 characters
set lbr
set tw=500

set ai "auto indent
set si "smart indent
": }}}

": justinmk/vim-dirvish {{{
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let g:dirvish_mode = ':sort ,^.*[\/],'

function! LoadDirvishAndOpen()
  if !exists('g:loaded_dirvish')
    unmap -
  endif
  packadd dirvish
  packadd dirvish-dovish

  let l:dir = expand('%:p:h')
  if empty(l:dir)
    let l:dir = getcwd()
  endif
  execute 'Dirvish' fnameescape(l:dir)
endfunction
nnoremap <silent> - :call LoadDirvishAndOpen()<CR>
": }}}

": justinmk/vim-dirvish-dovish {{{
if !exists('g:DovishDelete')
  function! s:DirvishDelete(target) abort
    return 'rm -rf ' . shellescape(a:target)
  endfunction
  let g:DovishDelete = function('s:DirvishDelete')
endif
": }}}
