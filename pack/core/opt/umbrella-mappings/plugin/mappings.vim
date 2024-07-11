" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:packadd_umbrella_mappings')
  finish
else
  let g:packadd_umbrella_mappings = v:true
endif

packadd which-key

": <leader> {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {}

": <leader>b
let g:which_key_map.b = { 'name' : '+buffer' }
let g:which_key_map.b.b = 'new'
nnoremap <leader>bb :vnew<CR>
nnoremap <leader>bq :close<CR>
let g:which_key_map.b.w = 'safe'
nnoremap <leader>bw :update<CR>
let g:which_key_map.b.l = 'list'
nnoremap <leader>bl :buffers<CR>
let g:which_key_map.b.d = 'delete'
nnoremap <leader>bd :bdelete<CR>
let g:which_key_map.b[']'] = 'next'
nnoremap <leader>b] :bnext<CR>
let g:which_key_map.b['['] = 'previous'
nnoremap <leader>b[ :tabprevious<CR>
let g:which_key_map.b.n = 'next'
nnoremap <leader>bn :bnext<CR>
let g:which_key_map.b.p = 'previous'
nnoremap <leader>bp :bprevious<CR>

": <leader>e
let g:which_key_map.e = { 'name' : '+explore' }
let g:which_key_map.e.w = 'save, close and toggle'
nnoremap <leader>ew :update! \| :Explore<CR>
let g:which_key_map.e['<Tab>'] = 'new tab'
nnoremap <leader>e<tab> :Texplore<CR>
let g:which_key_map.e.t = 'toggle'
nnoremap <leader>et :Lexplore<CR>

": <leader>c
let g:which_key_map.c = { 'name' : '+code' }
let g:which_key_map.c.c = 'comment in/out'
map <C-/> gc
map <leader>cc gc
imap <C-/> <Esc>VgcA
imap <leader>cc <Esc>VgcA

": <leader><Tab>
let g:which_key_map['<Tab>'] = { 'name' : '+tab' }
let g:which_key_map['<Tab>']['<Tab>'] = 'new'
nnoremap <leader><tab><tab> :tabnew<CR>
let g:which_key_map['<Tab>'].e = 'explore'
nnoremap <leader><tab>e :Texplore<CR>
let g:which_key_map['<Tab>'][']'] = 'next'
nnoremap <leader><tab>] :tabNext<CR>
let g:which_key_map['<Tab>']['['] = 'previous'
nnoremap <leader><tab>[ :tabprevious<CR>
let g:which_key_map['<Tab>'].n = 'next'
nnoremap <leader><tab>n :tabNext<CR>
let g:which_key_map['<Tab>'].p = 'previous'
nnoremap <leader><tab>p :tabprevious<CR>
let g:which_key_map['<Tab>'].q = 'close'
nnoremap <leader><tab>q :tabclose<CR>

": <leader>q
let g:which_key_map.q = { 'name' : '+quit' }
let g:which_key_map.q.q = 'close'
nnoremap <leader>qq :quitall<CR>
let g:which_key_map.q.Q = 'quit'
nnoremap <leader>qQ :quitall!<CR>

try
  call which_key#register('<Space>', "g:which_key_map")
catch
endtry
": }}}
