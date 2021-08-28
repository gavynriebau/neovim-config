log("Start options")

local o = vim.opt
o.number = true
o.termguicolors = true
o.wrap = true
o.tabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.wildignore = '*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*'
o.hlsearch = false
o.background = 'dark'

log("End options")
