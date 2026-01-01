" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:loaded_submoduled_core')
  finish
else
  let g:loaded_submoduled_core = 1
endif

": Mappings {{{
let g:mapleader = "\<Space>"
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

let g:maplocalleader = '\'
nnoremap <silent> <localleader> :<c-u>WhichKey '\'<CR>

function! GetRootDir()
  let cwd = expand('%:p:h')
  " https://vi.stackexchange.com/a/20606
  let dir = finddir('.git/..', cwd . ';')
  if dir == ''
    let dir = getcwd()
  endif
  return dir
endfunction
let g:which_key_map = {
  \ 'e': 'Explorer (root dir)',
  \ 'E': 'Explorer (cwd)',
  \ 'K': 'Keywordprg',
  \ ',': ['ToggleBufExplorer', 'Switch Buffer'],
  \ '-': ['<C-W>s', 'Split Window Below'],
  \ ':': ['history', 'Command History'],
  \ '`': ['bprevious', 'Switch to Other Buffer'],
  \ '|': ['<C-W>v', 'Split Window Right'],
  \ ' ': 'Find Files (root dir)',
\ }
nnoremap <leader>e :execute 'Dirvish ' . GetRootDir()<CR>
nnoremap <leader>E :Dirvish %:h<CR>
nnoremap <leader><Space> :execute 'CtrlP ' . GetRootDir()<CR>

": buffer
function! WriteAndCloseBuffer()
  update!
  let cwd = expand('%:h')
  bdelete!
  execute 'Dirvish ' . cwd
  endif
endfunction
let g:which_key_map['b'] = {
  \ 'name': '+buffer',
  \ 'b': ['bprevious', 'Switch to Other Buffer'],
  \ 'd': ['bdelete', 'Delete Buffer'],
  \ 'e': ['ToggleBufExplorer', 'Buffer Explorer'],
  \ 'o': 'Delete Other Buffers',
  \ 'w': ['update', 'Write Buffer'],
  \ 'W': 'Write and Close Buffer',
\ }
" https://stackoverflow.com/a/60948057
noremap <leader>bo :%bd\|e#\|bd#<cr>\|'"
nnoremap <leader>bW :call WriteAndCloseBuffer()<CR>


": <leader>c
let g:which_key_map['c'] = {
  \ 'name': '+code',
  \ 'h': ['UndotreeToggle', 'Undo Explorer'],
\ }
let g:undotree_WindowLayout = 3
map <C-/> gcc
imap <C-/> <Esc>VgcA


": file/find
let g:which_key_map['f'] = {
  \ 'name': '+file/find',
  \ 'b': ['CtrlPBuffer', 'Buffers'],
  \ 'e': 'Explorer (root dir)',
  \ 'E': 'Explorer (cwd)',
  \ 'f': 'Find Files (root dir)',
  \ 'F': 'Find Files (cwd)',
  \ 'n': ['enew', 'New File'],
  \ 'o': 'Open dirvish (Directory of the Current File)',
  \ 'O': 'Open dirvish (root dir)',
  \ 'r': 'Recent',
  \ 'R': 'Recent (cwd)',
  \ 't': ['terminal', 'Terminal (root dir)'],
  \ 'T': 'Terminal (cwd)',
\ }
nnoremap <leader>fe :execute 'Dirvish ' . GetRootDir()<CR>
nnoremap <leader>fE :Dirvish %:h<CR>
nnoremap <leader>ff :execute 'CtrlP ' . GetRootDir()<CR>
nnoremap <leader>fF :CtrlP %:h<CR>
nnoremap <leader>fo :Dirvish %:h<CR>
nnoremap <leader>fO :execute 'Dirvish ' . GetRootDir()<CR>
nnoremap <leader>fr :execute 'CtrlPMRU ' . GetRootDir()<CR>
nnoremap <leader>fR :CtrlPMRU %:h<CR>
" https://vi.stackexchange.com/a/14533
nnoremap <leader>fT :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR> 


": window
let g:which_key_map['w'] = {
  \ 'name': '+window',
  \ 'd': ['<C-W>c', 'Delete Window'],
  \ 'h': ['<C-W>h', 'Go to the Left window'],
  \ 'j': ['<C-W>j', 'Go to the Down window'],
  \ 'k': ['<C-W>k', 'Go to the Up Window'],
  \ 'l': ['<C-W>l', 'Go to the Right Window'],
  \ 'o': ['only', 'Close All Other Windows'],
  \ 's': ['<C-W>s', 'Split Window'],
  \ 't': [':tab sball', 'Break Out Into a New Tab'],
  \ '<Tab>': [':tab sball', 'which_key_ignore'],
  \ 'v': ['<C-W>v', 'Split Window Vertically'],
  \ 'w': ['<C-W>', 'Switch Windows'],
  \ 'x': ['<C-W>x', 'Swap Current with Next'],
  \ '+': [':resize +5', 'Increase Height'],
  \ '-': [':resize -5', 'Decrease Height'],
  \ '<': ['<C-W>5<', 'Decrease Width'],
  \ '=': ['<C-W>=', 'Equally High and Wide'],
  \ '>': ['<C-W>5>', 'Increase Width'],
\ }


": tab
let g:which_key_map['<Tab>'] = {
  \ 'name': '+tab',
  \ '<Tab>': ['tabnew', 'New Tab'],
  \ 'e': [':tabnew | :Dirvish', 'Tab with Explorer (root dir)'],
  \ 'E': 'Tab with Explorer (cwd)',
  \ 'd': ['tabclose', 'Delete Tab'],
  \ 'h': ['tabprevious', 'Go to the Left Tab'],
  \ 'l': ['tabnext', 'Go to the Right Tab'],
  \ 'o': ['tabonly', 'Close All Other Tabs'],
  \ 'w': ['tabonly', 'which_key_ignore'],
  \ '`': ['tabfirst', 'First Tabs'],
  \ '1': [':tabnext 1', 'which_key_ignore'],
  \ '2': [':tabnext 2', 'which_key_ignore'],
  \ '3': [':tabnext 3', 'which_key_ignore'],
  \ '4': [':tabnext 4', 'which_key_ignore'],
  \ '5': [':tabnext 5', 'which_key_ignore'],
  \ '6': [':tabnext 6', 'which_key_ignore'],
  \ '7': [':tabnext 7', 'which_key_ignore'],
  \ '8': [':tabnext 8', 'which_key_ignore'],
  \ '9': [':tabnext 9', 'which_key_ignore'],
  \ '0': ['tablast', 'Last tab'],
\ }
nnoremap <leader><tab>E :tabnew \| :execute 'Dirvish ' . GetRootDir()<CR>

": quit/session
let g:prosession_dir = expand(g:datadir . "/prosession")

let g:which_key_map['q'] = {
  \ 'name': '+quit/session',
  \ 'p': ['Obsession', 'Pause Session'],
  \ 'd': [':silent! ProsessionDelete', "Don't Save Current Session"],
  \ 'q': [':quitall!', 'Quit All'],
  \ 'Q': [':silent! ProsessionDelete | :quitall!', 'Force Quit All'],
\ }

try
  call which_key#register('<Space>', "g:which_key_map")
catch
endtry
": }}}

": tpope/vim-commentary {{{
": prefer '//' comment-style syntax
autocmd FileType c,cpp,csharp,java,javascript,typescript,kotlin,swift,php,go,scala,groovy,rust,d,haxe,dart,objc,glsl,hlsl,processing setlocal commentstring=//\ %s
": }}}
