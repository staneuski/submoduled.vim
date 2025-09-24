--[[
Share config btw. vim & nvim ( https://vi.stackexchange.com/a/39957 ) or
$ vim () { nvim -u $HOME/.config/vim/init.lua "$@" }
]]
vim.cmd([[
  set runtimepath^=$HOME/.config/.vim runtimepath+=$HOME/.config/.vim/after
  let &packpath = &runtimepath
  silent! source $HOME/.config/.vim/vimrc
  silent! source $HOME/.config/.vimrc
]])
