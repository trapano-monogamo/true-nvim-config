local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }


vim.g.mapleader = " "


vim.api.nvim_exec([[
  function! BuffersFZF()
    let buffers = map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)')
    call fzf#run(fzf#wrap({'source': buffers, 'sink': 'e'}))
  endfunction
  command! Buffers call BuffersFZF()
]], false)


-- INSERT MODE ---

keymap("i", ",.", "<ESC>", opts)


-- NORMAL MODE --

keymap("n", "<leader>n", ":bnext<CR>", opts)
keymap("n", "<leader>p", ":bprev<CR>", opts)
keymap("n", "<leader>N", ":tabnext<CR>", opts)
keymap("n", "<leader>P", ":tabprev<CR>", opts)

keymap("n", "<leader>e", ":Lex 20<CR>", opts)

keymap("n", "<leader>fb", ":Buffers<CR>", opts)
keymap("n", "<leader>ff", ":FZF<CR>", opts)

keymap("n", "<leader>t", ":split | resize 15 | term<CR>a", opts)

keymap("n", "<leader>vb", ":vertical resize +5<CR>", opts)
keymap("n", "<leader>vs", ":vertical resize -5<CR>", opts)
keymap("n", "<leader>hb", ":horizontal resize +2<CR>", opts)
keymap("n", "<leader>hs", ":horizontal resize -2<CR>", opts)


-- VISUAL MODE --

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- TERMINAL MODE --

keymap("t", "<ESC>", "<C-\\><C-n>", opts)
keymap("t", "<C-w>", "<C-\\><C-n><C-w>", opts)
