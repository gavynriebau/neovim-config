require 'utils/logging'.enable(false)

log("Start init.lua")

require 'plugins'
require 'options'
require 'mappings'
require 'colors'

vim.cmd([[
augroup RUST
	autocmd!
	au BufEnter *.rs LspStart
augroup END
]])

log("End init.lua")
