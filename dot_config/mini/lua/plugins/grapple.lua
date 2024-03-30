return {
	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git",   -- also try out "git_branch"
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>m", "<cmd>Grapple toggle<cr>",         desc = "Grapple toggle tag" },
			{ "<leader>n", "<cmd>Grapple toggle_tags<cr>",    desc = "Grapple toggle tags" },
			{ "<leader>N", "<cmd>Grapple toggle_scopes<cr>",  desc = "Grapple toggle scopes" },
			{ "<leader>e", "<cmd>Grapple cycle forward<cr>",  desc = "Grapple cycle forward" },
			{ "<leader>E", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
			{ "<leader>h", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
			{ "<leader>j", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
			{ "<leader>k", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
			{ "<leader>l", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
		},
	},
}
