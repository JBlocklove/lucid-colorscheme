-- lualine finds this file when you set  options = { theme = "lucid" }.
-- a, b, c are the sections from the outside in. Modes without b or c
-- reuse the ones from normal.
local c = require("lucid.palette." .. vim.o.background)

local function mode(color)
	return { a = { fg = c.on_accent, bg = color, gui = "bold" } }
end

return {
	normal = {
		a = { fg = c.on_accent, bg = c.blue, gui = "bold" },
		b = { fg = c.fg, bg = c.bg_strong },
		c = { fg = c.fg_dim, bg = c.bg_dark },
	},
	insert = mode(c.green),
	visual = mode(c.purple),
	replace = mode(c.red),
	command = mode(c.yellow),
	terminal = mode(c.teal),
	inactive = {
		a = { fg = c.fg_faint, bg = c.bg_dark },
		b = { fg = c.fg_faint, bg = c.bg_dark },
		c = { fg = c.fg_faint, bg = c.bg_dark },
	},
}
