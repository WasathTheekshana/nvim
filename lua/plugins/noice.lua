return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		-- Define a highlight group with a background color
		vim.cmd("highlight NotifyBackground guibg=#000000")

		-- Require and setup 'notify' with the background color highlight group
		local notify = require("notify")
		notify.setup({
			background_colour = "NotifyBackground", -- Use the defined highlight group
		})

		-- Additional configurations for 'noice.nvim' can go here if needed
		require("noice").setup({
			lsp = {
				-- Override markdown rendering to use Treesitter for **cmp** and other plugins
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- Enable presets for easier configuration
			presets = {
				bottom_search = true, -- Use a classic bottom cmdline for search
				command_palette = true, -- Position the cmdline and popupmenu together
				long_message_to_split = true, -- Send long messages to a split
				inc_rename = false, -- Disable an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- Add a border to hover docs and signature help
			},
			-- Example of adding a new configuration:
			-- notifications = {
			--   background_colour = "#1e222a",  -- Set a custom background color for notifications
			-- },
		})
	end,
}
