" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:loaded_umbrella_core')
  finish
else
  let g:loaded_umbrella_core = v:true
endif

function! GetRootDir()
  let cwd = expand('%:p:h')
  " https://vi.stackexchange.com/a/20606
  let dir = finddir('.git/..', cwd . ';')
  if dir == ''
    let dir = getcwd()
  endif
  return dir
endfunction

packadd which-key

let g:mapleader = "\<Space>"
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

let g:maplocalleader = '\'
nnoremap <silent> <localleader> :<c-u>WhichKey '\'<CR>

let g:which_key_map = {
  \ 'e': 'Explorer (Root Dir)',
  \ 'E': 'Explorer (cwd)',
  \ 'K': 'Keywordprg',
  \ ',': ['ToggleBufExplorer', 'Switch Buffer'],
  \ '-': ['<C-W>s', 'Split Window Below'],
  \ ':': ['history', 'Command History'],
  \ '`': ['bprevious', 'Switch To Other Buffer'],
  \ '|': ['<C-W>v', 'Split Window Right'],
  \ ' ': 'Find Files (Root Dir)',
\ }
nnoremap <leader>e :execute 'Explore ' . GetRootDir()<CR>
nnoremap <leader>E :Explore %:h<CR>
nnoremap <leader><Space> :execute 'CtrlP ' . GetRootDir()<CR>

": buffer {{{
let g:which_key_map['b'] = {
  \ 'name': '+buffer',
  \ 'b': ['bprevious', 'Switch To Other Buffer'],
  \ 'd': ['bdelete', 'Delete Buffer'],
  \ 'e': ['ToggleBufExplorer', 'Buffer Explorer'],
  \ 'o': 'Delete Other Buffers',
  \ 'w': ['update', 'Write Buffer'],
  \ 'W': 'Write & Close Buffer',
\ }
" https://stackoverflow.com/a/60948057
noremap <leader>bo :%bd\|e#\|bd#<cr>\|'"

function! WriteAndCloseBuffer()
  update! 
  let cwd = expand('%:h')
  bdelete!
  execute 'Explore ' . cwd
  endif
endfunction
nnoremap <leader>bW :call WriteAndCloseBuffer()<CR>
": }}}

": <leader>c {{{
let g:which_key_map['c'] = {
  \ 'name': '+code',
  \ 'h': ['UndotreeToggle', 'Undo Explorer'],
\ }
let g:undotree_WindowLayout = 3
map <C-/> gcc
imap <C-/> <Esc>VgcA

let g:which_key_map['q'] = {
  \ 'name': '+quit/session',
  \ 'p': ['Obsession', 'Pause Session'],
  \ 'd': "Don't Save Current Session",
  \ 'q': ['quitall', 'Quit All'],
  \ 'Q': 'Force Quit All',
\ }
let g:prosession_dir = '~/.cache/prosession/'
nnoremap <leader>qq :quitall!<CR>
nnoremap <leader>qd :silent! ProsessionDelete<CR>
nnoremap <leader>qQ :silent! ProsessionDelete \| :quitall!<CR>
": }}}

": file/find {{{
let g:which_key_map['f'] = {
  \ 'name': '+file/find',
  \ 'b': ['CtrlPBuffer', 'Buffers'],
  \ 'e': 'Explorer (Root Dir)',
  \ 'E': 'Explorer (cwd)',
  \ 'f': 'Find Files (Root Dir)',
  \ 'F': 'Find Files (cwd)',
  \ 'n': ['enew', 'New File'],
  \ 'r': 'Recent',
  \ 'R': 'Recent (cwd)',
  \ 't': ['terminal', 'Terminal (Root Dir)'],
  \ 'T': 'Terminal (cwd)',
\ }
nnoremap <leader>fe :execute 'Explore ' . GetRootDir()<CR>
nnoremap <leader>fE :Explore %:h<CR>
nnoremap <leader>ff :execute 'CtrlP ' . GetRootDir()<CR>
nnoremap <leader>fF :CtrlP %:h<CR>
nnoremap <leader>fr :execute 'CtrlPMRU ' . GetRootDir()<CR>
nnoremap <leader>fR :CtrlPMRU %:h<CR>
" https://vi.stackexchange.com/a/14533
nnoremap <leader>fT :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR> 
": }}}

try
  call which_key#register('<Space>', "g:which_key_map")
catch
endtry
