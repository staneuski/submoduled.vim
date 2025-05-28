--[[
Share config btw. vim & nvim ( https://vi.stackexchange.com/a/39957 ) or
$ vim () { nvim -u ~/.config/vim/init.lua "$@" }
]]
vim.cmd([[
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  silent! source ~/.vim/vimrc
  silent! source ~/.vimrc
]])
