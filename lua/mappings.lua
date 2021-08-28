log("Start mappings")

local o = { noremap = true, silent = true }
local m = vim.api.nvim_set_keymap

m('n', '<Leader>ve', ':tabe ~/.config/nvim/init.lua<CR>', o)
m('n', '<Leader>n', ':NvimTreeToggle<CR>', o)
m('n', '<Leader>x', ':HopWord<CR>', o)
m('n', '<Leader>tt', ':Telescope<CR>', o)
m('n', '<Leader>tf', ':Telescope fd<CR>', o)
m('n', '<Leader>tg', ':Telescope live_grep<CR>', o)
m('n', '<Leader>th', ':Telescope help_tags<CR>', o)
m('n', '<Leader>tc', ':Telescope command_history<CR>', o)

log("End mappings")
