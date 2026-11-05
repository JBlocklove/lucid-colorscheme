-- which-key.nvim
-- which-key's own icon colors link to unrelated groups ("purple" icons come
-- out orange), and the grey one links to Normal, whose bg shows as a block
-- in the popup. These give each name the lucid color it says.
return function(c)
	return {
		WhichKeyIconAzure = { fg = c.cyan },
		WhichKeyIconBlue = { fg = c.blue },
		WhichKeyIconCyan = { fg = c.teal },
		WhichKeyIconGreen = { fg = c.green },
		WhichKeyIconGrey = { fg = c.fg_faint },
		WhichKeyIconOrange = { fg = c.orange },
		WhichKeyIconPurple = { fg = c.purple },
		WhichKeyIconRed = { fg = c.red },
		WhichKeyIconYellow = { fg = c.yellow },
	}
end
