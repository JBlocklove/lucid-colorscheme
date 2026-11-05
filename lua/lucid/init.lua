local M = {}

local function apply(groups)
	for group, spec in pairs(groups) do
		vim.api.nvim_set_hl(0, group, spec)
	end
end

function M.load()
	-- Forget cached modules so `:colorscheme lucid` picks up edits to the palettes, groups.lua or the plugin files without restarting Neovim.
	for name in pairs(package.loaded) do
		if name:match("^lucid%.") then
			package.loaded[name] = nil
		end
	end

	vim.cmd("highlight clear")
	vim.o.termguicolors = true
	vim.g.colors_name = "lucid"

	-- 'background' picks the palette. Neovim sets it from the terminal's background color at startup
    -- `:set background=light` switches theme
	local colors = require("lucid.palette." .. vim.o.background)
	apply(require("lucid.groups")(colors))

	-- Plugin highlights: every file in lua/lucid/plugins/ is applied
	for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/lucid/plugins/*.lua", true)) do
		apply(require("lucid.plugins." .. vim.fn.fnamemodify(file, ":t:r"))(colors))
	end

	-- Colors for :terminal buffers
	for i, color in ipairs(colors.terminal) do
		vim.g["terminal_color_" .. (i - 1)] = color
	end
end

return M
