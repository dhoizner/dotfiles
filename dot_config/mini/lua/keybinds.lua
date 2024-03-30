local keymap = vim.keymap.set
local MiniPick = require("mini.pick")
local MiniFiles = require("mini.files")
-- local MiniSessions = require("mini.sessions")
local MiniExtra = require("mini.extra")

-- MiniPick Colorscheme Picker
local set_colorscheme = function(name)
	pcall(vim.cmd, "colorscheme " .. name)
end
local pick_colorscheme = function()
	local init_scheme = vim.g.colors_name
	local new_scheme = MiniPick.start({
		source = {
			items = vim.fn.getcompletion("", "color"),
			preview = function(_, item)
				set_colorscheme(item)
			end,
			choose = set_colorscheme,
		},
		mappings = {
			preview = {
				char = "<C-p>",
				func = function()
					local item = MiniPick.get_picker_matches()
					pcall(vim.cmd, "colorscheme " .. item.current)
				end,
			},
		},
	})
	if new_scheme == nil then
		set_colorscheme(init_scheme)
	end
end

-- General Vim Things
keymap("n", "<leader>ul", "<cmd>Lazy<cr>", { noremap = true, silent = true, desc = "Lazy" })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Finding Stuff
keymap("n", "<leader>sh", MiniPick.builtin.help, { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sk", MiniExtra.pickers.keymaps, { desc = "[S]earch [K]eymaps" })
keymap("n", "<leader>sf", MiniPick.builtin.files, { noremap = true, silent = true, desc = "[S]earch [F]iles" })
keymap("n", "<leader>sw", function()
	local wrd = vim.fn.expand("<cWORD>")
	MiniPick.builtin.grep({ pattern = wrd }, { window = { prompt_prefix = wrd .. "> " } })
end, { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", MiniPick.builtin.grep_live, { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", MiniExtra.pickers.diagnostic, { desc = "[S]earch [D]iagnostics" })
keymap("n", "<leader>sl", MiniExtra.pickers.hl_groups, { desc = "[S]earch High[L]ight Groups" })
keymap("n", "<leader>sr", MiniPick.builtin.resume, { desc = "[S]earch [R]esume" })
keymap("n", "<leader>sc", pick_colorscheme, { desc = "[S]earch [C]olorschemes" })
keymap("n", "<leader>sac", require("fzf-lua").awesome_colorschemes, { desc = "[S]earch [C]olorschemes" })
keymap("n", "<leader><leader>", MiniPick.builtin.buffers, { desc = "[ ] Find existing buffer" })

keymap("n", "<leader>fm", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "[M]ini [F]iles" })

-- Session Related Keymaps
-- keymap("n", "<leader>s", function()
-- 	vim.cmd("wa")
-- 	MiniSessions.write()
-- 	MiniSessions.select()
-- end, { noremap = true, silent = true, desc = "Switch Session" })
-- keymap("n", "<leader>sw", function() vim.cmd('wa') MiniSessions.write() end, { noremap = true, silent = true, desc = 'Save Session' })

-- Buffer Related Keymaps
keymap("n", "<leader>bd", "<cmd>bd<cr>", { noremap = true, silent = true, desc = "Close [B]uffer" })
keymap("n", "<leader>bb", "<C-6>", { noremap = true, silent = true, desc = "Previous [B]uffer" })
keymap("n", "<leader>bf", function()
	vim.lsp.buf.format()
end, { noremap = true, silent = true, desc = "[F]ormat [B]uffer" })
-- keymap("n", "<leader>bf", "gg=G<C-o>", { noremap = true, silent = true, desc = 'Format Buffer' })
-- keymap("n", "<C-l>", "<cmd>bnext<cr>", { silent = true, desc = "[N]ext [B]uffer" })
-- keymap("n", "<C-h>", "<cmd>bprevious<cr>", { silent = true, desc = "[P]revious [B]uffer" })

-- Git Related Keymaps
keymap("n", "<leader>gl", "<cmd>terminal lazygit<cr>", { noremap = true, silent = true, desc = "[L]azygit" })
keymap("n", "<leader>gp", "<cmd>terminal git pull<cr>", { noremap = true, silent = true, desc = "[G]it [P]ull" })
keymap("n", "<leader>gs", "<cmd>terminal git push<cr>", { noremap = true, silent = true, desc = "[G]it Pu[s]h" })
keymap("n", "<leader>ga", "<cmd>terminal git add .<cr>", { noremap = true, silent = true, desc = "[G]it [A]dd All" })
keymap(
	"n",
	"<leader>gc",
	'<cmd>terminal git commit -m "Autocommit from MVIM"<cr>',
	{ noremap = true, silent = true, desc = "[G]it [A]utocommit" }
)

-- UI Related Keymaps
-- Window Navigation
keymap("n", "<leader>ws", "<cmd>split<cr>", { noremap = true, silent = true, desc = "[S]plit" })
keymap("n", "<leader>wv", "<cmd>vsplit<cr>", { noremap = true, silent = true, desc = "Split [V]ertically" })
keymap(
	"n",
	"<leader>wh",
	require("smart-splits").move_cursor_left,
	{ noremap = true, silent = true, desc = "Focus [L]eft" }
)
keymap(
	"n",
	"<leader>wj",
	require("smart-splits").move_cursor_down,
	{ noremap = true, silent = true, desc = "Focus [D]own" }
)
keymap(
	"n",
	"<leader>wk",
	require("smart-splits").move_cursor_up,
	{ noremap = true, silent = true, desc = "Focus [U]p" }
)
keymap(
	"n",
	"<leader>wl",
	require("smart-splits").move_cursor_right,
	{ noremap = true, silent = true, desc = "Focus [R]ight" }
)
keymap("n", "<leader>wd", "<C-w>q", { noremap = true, silent = true, desc = "Close Window" })
keymap("n", "<leader>wm", "<C-w>_<C-w><Bar>", { noremap = true, silent = true, desc = "[M]aximize [W]indow" })
keymap("n", "<leader>we", "<C-w>=", { noremap = true, silent = true, desc = "[E]qual [W]indows" })
keymap("n", "<TAB>", "<C-^>", { noremap = true, silent = true, desc = "Alternate buffers" })

-- smart-splits.nvim
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
-- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
-- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
-- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
-- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

-- Change Colorscheme
keymap("n", "<leader>ud", "<cmd>set background=dark<cr>", { noremap = true, silent = true, desc = "Dark Background" })
keymap("n", "<leader>ub", "<cmd>set background=light<cr>", { noremap = true, silent = true, desc = "Light Backround" })
keymap("n", "<leader>um", "<cmd>lua MiniMap.toggle()<cr>", { noremap = true, silent = true, desc = "Mini Map" })

keymap("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
keymap("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

-- peek fold under cursor or open LSP hover
keymap("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)
