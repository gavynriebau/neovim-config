local present, lspconfig = pcall(require, "lspconfig")

local servers = {
	'rust',
	'typescript',
	'csharp'
}

if not present then
   return
end

local function on_attach(_, bufnr)
   local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
   end
   local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
   end

   -- Enable completion triggered by <c-x><c-o>
   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

   -- Mappings.
   local opts = { noremap = true, silent = true }

   -- See `:help vim.lsp.*` for documentation on any of the below functions
   local m = buf_set_keymap
   m("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   m("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   m("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   m("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   m("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   m("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
   m("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
   m("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
   m("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   m("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   m("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   m("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   m("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
   m("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   m("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
   m("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
   m("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
   m("v", "<space>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup_servers()
   for _, lang in pairs(servers) do
	  local item = lspconfig[lang]
	  if item then
		  item.setup {
			 on_attach = on_attach,
			 capabilities = capabilities,
			 -- root_dir = vim.loop.cwd,
		  }
	  end
   end
end

setup_servers()

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
   vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefaul" .. name })
end

lspSymbol("Error", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")
lspSymbol("Warning", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
   virtual_text = {
      prefix = "",
      spacing = 0,
   },
   signs = true,
   underline = true,
   update_in_insert = false, -- update diagnostics insert mode
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "double",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "single",
})

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
   if msg:match "exit code" then
      return
   end
   if log_level == vim.log.levels.ERROR then
      vim.api.nvim_err_writeln(msg)
   else
      vim.api.nvim_echo({ { msg } }, true, {})
   end
end
