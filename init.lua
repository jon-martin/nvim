require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local job_id = 0
vim.keymap.set("n", "<space>to", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)

	job_id = vim.bo.channel
end)

local current_command = ""
vim.keymap.set("n", "<space>te", function()
	current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<space>tr", function()
	if current_command == "" then
		current_command = vim.fn.input("Command: ")
	end

	vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'find recently opened files' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'fuzzily search in current buffer' })

-- Linux keybinds
vim.keymap.set('n', '<m-y>', '<cmd>vsplit<cr><cmd>wincmd l<cr>', { desc = 'vertical split' })
vim.keymap.set('n', '<m-l>', '<cmd>split<cr><cmd>wincmd j<cr>', { desc = 'horizontal split' })
vim.keymap.set('n', '<m-f>', '<cmd>tabnew<cr>', { desc = 'create new tab' })
vim.keymap.set('n', '<m-s>', ':Tabby rename_tab ', { desc = 'rename tab' })
vim.keymap.set('n', '<m-r>', 'gT', { desc = 'move to left tab' })
vim.keymap.set('n', '<m-t>', 'gt', { desc = 'move to right tab' })
vim.keymap.set('n', '<m-n>', '<cmd>wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('n', '<m-u>', '<cmd>wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('n', '<m-e>', '<cmd>wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('n', '<m-i>', '<cmd>wincmd l<cr>', { desc = 'move Right' })
vim.keymap.set('t', '<m-n>', '<c-\\><c-n><cmd>wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('t', '<m-u>', '<c-\\><c-n><cmd>wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('t', '<m-e>', '<c-\\><c-n><cmd>wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('t', '<m-i>', '<c-\\><c-n><cmd>wincmd l<cr>', { desc = 'move Right' })
vim.keymap.set('n', '<m-1>', '1gt', { desc = 'select tab 1' })
vim.keymap.set('n', '<m-2>', '2gt', { desc = 'select tab 2' })
vim.keymap.set('n', '<m-3>', '3gt', { desc = 'select tab 3' })
vim.keymap.set('n', '<m-4>', '4gt', { desc = 'select tab 4' })
vim.keymap.set('n', '<m-5>', '5gt', { desc = 'select tab 5' })
vim.keymap.set('n', '<m-6>', '6gt', { desc = 'select tab 6' })
vim.keymap.set('n', '<m-7>', '7gt', { desc = 'select tab 7' })
vim.keymap.set('n', '<m-8>', '8gt', { desc = 'select tab 8' })
vim.keymap.set('n', '<m-9>', '9gt', { desc = 'select tab 9' })
vim.keymap.set('t', '<m-1>', '<c-\\><c-n>1gt', { desc = 'select tab 1' })
vim.keymap.set('t', '<m-2>', '<c-\\><c-n>2gt', { desc = 'select tab 2' })
vim.keymap.set('t', '<m-3>', '<c-\\><c-n>3gt', { desc = 'select tab 3' })
vim.keymap.set('t', '<m-4>', '<c-\\><c-n>4gt', { desc = 'select tab 4' })
vim.keymap.set('t', '<m-5>', '<c-\\><c-n>5gt', { desc = 'select tab 5' })
vim.keymap.set('t', '<m-6>', '<c-\\><c-n>6gt', { desc = 'select tab 6' })
vim.keymap.set('t', '<m-7>', '<c-\\><c-n>7gt', { desc = 'select tab 7' })
vim.keymap.set('t', '<m-8>', '<c-\\><c-n>8gt', { desc = 'select tab 8' })
vim.keymap.set('t', '<m-9>', '<c-\\><c-n>9gt', { desc = 'select tab 9' })
vim.keymap.set('n', '<m-z>', '<cmd>lua Zoomfun()<cr>', { desc = 'resize' })
