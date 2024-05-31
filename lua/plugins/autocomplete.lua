return {
	{ -- autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"l3mon4d3/luasnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()

							-- Extend filetypes
							local ls = require("luasnip")
							ls.filetype_extend("javascript", { "javascriptreact" })
							ls.filetype_extend("typescript", { "typescriptreact" })
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- see `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- autocompletion
				-- please read `:help ins-completion`
				mapping = cmp.mapping.preset.insert({
					-- select the [n]ext item
					["<c-n>"] = cmp.mapping.select_next_item(),
					-- select the [p]revious item
					["<c-p>"] = cmp.mapping.select_prev_item(),

					-- scroll the documentation window [b]ack / [f]orward
					["<c-b>"] = cmp.mapping.scroll_docs(-4),
					["<c-f>"] = cmp.mapping.scroll_docs(4),

					["<c-y>"] = cmp.mapping.confirm({ select = true }),

					-- traditional completion navigation
					["<cr>"] = cmp.mapping.confirm({ select = true }),
					["<tab>"] = cmp.mapping.select_next_item(),
					["<s-tab>"] = cmp.mapping.select_prev_item(),

					["<c-space>"] = cmp.mapping.complete({}),

					["<c-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<c-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
}
