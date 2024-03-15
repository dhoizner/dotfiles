return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require('mini.align').setup()
			-- require{'mini.animate'}.setup()
			-- require("mini.base16").setup({})
			require("mini.basics").setup({
				options = {
					extra_ui = true,
					win_borders = "double",
				},
				mappings = {
					windows = true,
				},
			})
			require("mini.bracketed").setup()
			require("mini.bufremove").setup()
			local miniclue = require('mini.clue')
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },
					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },
					--
					-- Completion commands
					{ mode = "n", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
					{ mode = 'n', keys = '\\' },
					{ mode = 'x', keys = '\\' },
				},

				clues = {
					{ mode = "n", keys = "<Leader>c", desc = "[C]ode" },
					{ mode = "n", keys = "<Leader>f", desc = "[F]iles" },
					{ mode = "n", keys = "<Leader>s", desc = "[S]earch" },
					{ mode = "n", keys = "<Leader>w", desc = "[W]indow" },
					-- { mode = "n", keys = "<Leader>s", desc = "Session" },
					{ mode = "n", keys = "<Leader>b", desc = "[B]uffer" },
					{ mode = "n", keys = "<Leader>g", desc = "[G]it" },
					{ mode = "n", keys = "<Leader>u", desc = "[U]I" },
					miniclue.gen_clues.g(),
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
				window = {
					delay = 300,
					config = { width = 'auto' },
				},
			})
			-- require('mini.colors').setup()
			require("mini.comment").setup()
			require("mini.completion").setup({
				window = {
					info = { border = "rounded" },
					signature = { border = "rounded" },
				},
			})
			require("mini.cursorword").setup()
			-- require('mini.doc').setup()
			require("mini.extra").setup()
			require("mini.files").setup({
				windows = {
					preview = true,
					width_preview = 80,
				},
			})
			require("mini.fuzzy").setup()
			require("mini.hipatterns").setup({
				highlighters = {
					fixme     = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
					hack      = { pattern = 'HACK', group = 'MiniHipatternsHack' },
					todo      = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
					note      = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
					hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
				},
			})
			-- require('mini.hues').setup({ background = '#282828', foreground = '#EBDBB2' })
			require("mini.indentscope").setup({
				draw = {
					animation = function()
						return 1
					end,
				},
				symbol = "│",
			})
			require("mini.jump").setup()
			require("mini.jump2d").setup()
			require("mini.map").setup()
			require("mini.misc").setup()
			require("mini.move").setup()
			-- require("mini.notify").setup()
			require("mini.operators").setup()
			-- require('mini.pairs').setup()
			require("mini.pick").setup({
				options = {
					use_cache = true,
				},
				window = {
					config = {
						border = "rounded",
					},
				},
			})
			require("mini.sessions").setup({
				autowrite = true,
			})
			require("mini.splitjoin").setup()
			require("mini.starter").setup({
				items = {
					require("mini.starter").sections.builtin_actions(),
					require("mini.starter").sections.recent_files(5, false),
					require("mini.starter").sections.recent_files(5, true),
					require("mini.starter").sections.sessions(5, true),
					{ name = "Lazy", action = "Lazy", section = "Lazy" },
				},
				header = [[
                ███╗   ███╗██╗   ██╗██╗███╗   ███╗
                ████╗ ████║██║   ██║██║████╗ ████║
                ██╔████╔██║██║   ██║██║██╔████╔██║
                ██║╚██╔╝██║╚██╗ ██╔╝██║██║╚██╔╝██║
                ██║ ╚═╝ ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
                ██║     ██║  ╚═══╝  ╚═╝██║     ██║
                ██║     ██║ini      nvi██║     ██║
                ╚═╝     ╚═╝            ╚═╝     ╚═╝]],
				footer = function()
					local stats = require("lazy.stats").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return "Startup Time: " .. ms .. " ms"
				end,
			})
			require("mini.statusline").setup({
				use_icons = true,
			})
			-- local animate = require("mini.animate")
			-- animate.setup({
			-- 	scroll = {
			-- 		-- Disable Scroll Animations, as the can interfer with mouse Scrolling
			-- 		-- enable = false,
			-- 	},
			-- 	cursor = {
			-- 		timing = animate.gen_timing.cubic({ duration = 50, unit = "total" }),
			-- 	},
			-- 	resize = {
			-- 		timing = animate.gen_timing.cubic({ duration = 50, unit = "total" }),
			-- 	},
			-- })
			require("mini.surround").setup()
			require("mini.tabline").setup()
			-- require('mini.test').setup()
			require("mini.trailspace").setup()
			require("mini.visits").setup()
		end,
	},
}
