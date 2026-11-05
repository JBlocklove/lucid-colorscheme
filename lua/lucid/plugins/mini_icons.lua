-- mini.icons (also what which-key and snacks use for file icons when it's installed)
-- mini.icons links its color names to unrelated groups, so in lucid its
-- "purple" icons come out orange and "orange" ones yellow. These give each
-- name the lucid color it says.
return function(c)
	return {
		MiniIconsAzure = { fg = c.cyan },
		MiniIconsBlue = { fg = c.blue },
		MiniIconsCyan = { fg = c.teal },
		MiniIconsGreen = { fg = c.green },
		MiniIconsGrey = { fg = c.fg_faint },
		MiniIconsOrange = { fg = c.orange },
		MiniIconsPurple = { fg = c.purple },
		MiniIconsRed = { fg = c.red },
		MiniIconsYellow = { fg = c.yellow },
	}
end
