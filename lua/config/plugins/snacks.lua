return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = false },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = false },
            styles = {
                notification = {
                    -- wo = { wrap = true } -- Wrap notifications
                }
            }
        },
        keys = {
            -- { "<leader>?", function() Snacks.picker.projects() end, desc = "Projects" }, // Maybe?
            { "<leader>?",  function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
            -- { "<leader>?", function() Snacks.picker.recent() end, desc = "Recent" }, // What is better, smart or recent?
            { "<leader>/",  function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
            { "<leader>b",  function() Snacks.picker.buffers() end,               desc = "Buffers" },
            { "<leader>e",  function() Snacks.explorer() end,                     desc = "File Explorer" },
            -- git
            { "<leader>gb", function() Snacks.picker.git_branches() end,          desc = "Git Branches" },
            { "<leader>gl", function() Snacks.picker.git_log() end,               desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
            { "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },
            { "<leader>gS", function() Snacks.picker.git_stash() end,             desc = "Git Stash" },
            { "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },
            { "<leader>gB", function() Snacks.gitbrowse() end,                    desc = "Git Browse" },
            -- search
            { "<leader>s:", function() Snacks.picker.command_history() end,       desc = "Command History" },
            { "<leader>sf", function() Snacks.picker.files() end,                 desc = "Find Files" },
            { "<leader>sg", function() Snacks.picker.grep() end,                  desc = "Grep" },
            { "<leader>sw", function() Snacks.picker.grep_word() end,             desc = "Visual selection or word" },
            { "<leader>sb", function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
            { "<leader>sn", function() Snacks.notifier.show_history() end,        desc = "Notification History" },
            { '<leader>s"', function() Snacks.picker.registers() end,             desc = "Registers" },
            { '<leader>s/', function() Snacks.picker.search_history() end,        desc = "Search History" },
            { "<leader>sa", function() Snacks.picker.autocmds() end,              desc = "Autocmds" },
            { "<leader>sc", function() Snacks.picker.command_history() end,       desc = "Command History" },
            { "<leader>sC", function() Snacks.picker.commands() end,              desc = "Commands" },
            { "<leader>sh", function() Snacks.picker.help() end,                  desc = "Help Pages" },
            { "<leader>sH", function() Snacks.picker.highlights() end,            desc = "Highlights" },
            { "<leader>sj", function() Snacks.picker.jumps() end,                 desc = "Jumps" },
            { "<leader>sk", function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
            { "<leader>sl", function() Snacks.picker.loclist() end,               desc = "Location List" },
            { "<leader>sm", function() Snacks.picker.marks() end,                 desc = "Marks" },
            { "<leader>sM", function() Snacks.picker.man() end,                   desc = "Man Pages" },
            { "<leader>sp", function() Snacks.picker.lazy() end,                  desc = "Search for Plugin Spec" },
            { "<leader>sq", function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
            { "<leader>sR", function() Snacks.picker.resume() end,                desc = "Resume" },
            { "<leader>su", function() Snacks.picker.undo() end,                  desc = "Undo History" },
            { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
            { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
            -- LSP
            { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
            { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
            { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                     desc = "References" },
            { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
            { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
            { "<leader>dR", function() Snacks.rename.rename_file() end,           desc = "Rename File" },
            { "<leader>dd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
            { "<leader>dD", function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
            -- Other
            { "<leader>x",  function() Snacks.bufdelete() end,                    desc = "Delete Buffer" },
            { "<c-/>",      function() Snacks.terminal() end,                     desc = "Toggle Terminal",          mode = { "n", "t" } },
        },
    },
}
