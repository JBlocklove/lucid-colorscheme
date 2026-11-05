-- indent-blankline.nvim (ibl)
-- By default the guides use Whitespace and the current scope uses LineNr,
-- which in lucid are nearly the same grey. Quieter guides and a brighter
-- scope make the current block easy to find. snacks.lua does the same for
-- snacks.indent.
return function(c)
	return {
		IblIndent = { fg = c.bg_strong },
		IblWhitespace = { fg = c.bg_strong },
		IblScope = { fg = c.fg_faint },
	}
end
