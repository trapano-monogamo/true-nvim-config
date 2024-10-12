local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("Could not load nvim-lsp-installer...")
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}


	-- NOTE: specific server configs should go here.
	-- put a function that goes through a table { server_name = settings_file_name }
	-- and put the config file in ./settings (create one if necessary)


	server:setup(opts)
end)
