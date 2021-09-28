
vim.g.nvim_tree_add_trailing = 0
vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_respect_buf_cwd = 0
vim.g.nvim_tree_disable_window_picker = 1

vim.cmd([[
" Automatically refresh the tree after opening a new file
" Ensures that the file is highlighted correctly in the tree when
" opened using telescope or netrw
augroup Tree
	autocmd!
	autocmd BufReadPost * lua require'nvim-tree'.refresh()
augroup END
]])

require'nvim-tree'.setup {
  follow = true,
  disable_netrw = false,
  hijack_netrw = false,
  update_cwd = true,
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
}

