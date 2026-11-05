-- trouble.nvim
-- Trouble's window uses NormalFloat (bg_dark), but its text and file icons
-- link to Normal, whose bg would paint stripes of the editor background
-- across it.
return function(c)
	return {
		TroubleText = { fg = c.fg },
		TroubleIconFile = { fg = c.fg },
		TroubleCount = { fg = c.fg, bg = c.bg_strong, bold = true },
	}
end
