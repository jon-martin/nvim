local select_one_or_multi = function(prompt_bufnr)
    local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
    local multi = picker:get_multi_selection()
    if not vim.tbl_isempty(multi) then
	require('telescope.actions').close(prompt_bufnr)
	for _, j in pairs(multi) do
	    if j.path ~= nil then
		vim.cmd(string.format('%s %s', 'edit', j.path))
	    end
	end
    else
	require('telescope.actions').select_default(prompt_bufnr)
    end
end

-- [[ Configure Telescope ]]
local actions = require "telescope.actions"

return {
    {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
	    require('telescope').setup {
		defaults = {
		    mappings = {
			i = {
			    ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
			    ['<CR>'] = select_one_or_multi,
			    ['<C-h>'] = "which_key",
			    ['<C-o>'] = require('telescope.actions').delete_buffer,
			    -- freeze the current list and start a fuzzy search in the frozen list
			    ["<C-space>"] = actions.to_fuzzy_refine,
			}
		    },
		},
		pickers = {
		    find_files = {
			theme = "ivy"
		    }
		},
		extensions = {
		    fzf = {}
		}
	    }

	    require('telescope').load_extension('fzf')

	    vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
	    vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)
	    vim.keymap.set("n", "<space>en", function()
		require('telescope.builtin').find_files {
		    cwd = vim.fn.stdpath("config")
		}
	    end)
	    vim.keymap.set("n", "<space>ep", function()
		require('telescope.builtin').find_files {
		    cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
		}
	    end)

	    require "config.telescope.multigrep".setup()
	end
    }
}
