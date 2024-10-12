local colorscheme = "lunaperche"
local transparent = true
vim.opt.termguicolors = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Could not load colorscheme '" .. colorscheme .. "'")
	return
end


-- make a table with entries: { colorscheme_name, function to call with wanted config }

-- for k,v in pairs(specific_configs) do
-- 	v()
-- end
