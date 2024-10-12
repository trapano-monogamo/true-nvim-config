require("user.lsp.lsp-installer")

local lspconfig_status_ok, _ = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("Could not load lspconfig...")
	return
end

require("user.lsp.handlers").setup()
