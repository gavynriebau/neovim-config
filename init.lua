
--[[
How to capture lua output
:redir => a
:silent vim.print(vim)
:redir END
:put =a
]]


-- Disable netrw because using lua filetree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.list = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- Scroll 2 lines at a time
vim.keymap.set('n', '<C-e>', '2<C-e>')
vim.keymap.set('n', '<C-y>', '2<C-y>')

-- Editing config
vim.keymap.set('n', '<Leader>ve', '<cmd>edit ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<Leader>vs', '<cmd>source ~/.config/nvim/init.lua<cr>')

-- Helpers
vim.keymap.set('n', '<Leader>ct', '<cmd>retab<cr>')

-- Colorscheme
vim.cmd.colorscheme('nightfox')

require('hop').setup()
require('lsp')
require('nvim-tree').setup({
  sync_root_with_cwd = true,
  tab = {
    sync = {
      open = true -- Re-open explorer if new tab opened
    }
  }
})
require('neoscroll').setup()

local utils = require 'utils'

-- Tree mappings
local api = require 'nvim-tree.api'
vim.keymap.set('n', '<Leader>tf', utils.find_open_file, {})
vim.keymap.set('n', '<Leader>tc', api.tree.close, {})
vim.keymap.set('n', '<Leader>tt', api.tree.toggle, {})

-- Telescope mappings
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = require('telescope.actions').send_selected_to_qflist,
        ["<C-l>"] = utils.delete_selected_buffers
      },
    }
  },
}

vim.api.nvim_create_user_command('ClearQF', utils.clear_quickfix, {})
  
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    --{ name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- plugin manager
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-tree/nvim-tree.lua'
  use 'EdenEast/nightfox.nvim'
  use 'karb94/neoscroll.nvim'
  use {'ojroques/nvim-bufdel'}

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'L3MON4D3/LuaSnip'


  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<Leader>fm', builtin.marks, {})
  vim.keymap.set('n', '<Leader>fq', builtin.quickfix, {})

  local hop = require('hop')
  local directions = require('hop.hint').HintDirection
  vim.keymap.set('n', '<Leader>x', hop.hint_words, {})
  vim.keymap.set('n', '<Leader>l', hop.hint_lines, {})

end)

