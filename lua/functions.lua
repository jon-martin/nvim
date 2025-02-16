-- Whichkey register
local zoom = false
function Zoomfun()
	if zoom then
		zoom = false
		vim.api.nvim_feedkeys(':wincmd =\n', 'n', true)
	else
		zoom = true
		vim.api.nvim_feedkeys(':wincmd |\n', 'n', true)
		vim.api.nvim_feedkeys(':wincmd _\n', 'n', true)
	end
end
