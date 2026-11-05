-- snacks.nvim
-- Nearly everything in snacks links to core groups and needs nothing here.
-- These are the exceptions.
return function(c)
	return {
		-- indent: quiet guides, a grey (not pink) scope; same as indent_blankline.lua
		SnacksIndent = { fg = c.bg_strong },
		SnacksIndentScope = { fg = c.fg_faint },

		-- picker: matches in the same blue as completion menus
		SnacksPickerMatch = { link = "PmenuMatch" },
		-- links to Normal by default, whose background shows as a block in the picker
		SnacksPickerIconFile = { fg = c.fg },

		-- dashboard: by default menu text, file names and icons are all pink
		SnacksDashboardDesc = { fg = c.fg },
		SnacksDashboardFile = { fg = c.lavender },
		SnacksDashboardIcon = { fg = c.blue },
		SnacksDashboardFooter = { fg = c.comment, italic = true },
	}
end
