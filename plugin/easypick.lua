local easypick = require("easypick")

easypick.setup({
	pickers = {
		-- add your custom pickers here
		-- below you can find some examples of what those can look like

		-- list files inside current folder with default previewer
		{
			-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
			name = "ls",
			-- the command to execute, output has to be a list of plain text entries
			command = "ls",
			-- specify your custom previwer, or use one of the easypick.previewers
			previewer = easypick.previewers.default()
		},

		-- pick new working directory
		{
			name = "change_directory",
			command = "find ~/Documents ~/Downloads -type d -maxdepth 3 -not -path \'*/.*\'",
			previewer = easypick.previewers.default(),
			action = easypick.actions.nvim_commandf("lcd %s"),
		},

		-- pick new working directory
		{
			name = "new_window",
			command = "find ~/Documents ~/Downloads -type d -maxdepth 3 -not -path \'*/.*\'",
			previewer = easypick.previewers.default(),
			action = easypick.actions.nvim_commandf("tabnew | lcd %s | Telescope find_files "),
		},
	}
})
