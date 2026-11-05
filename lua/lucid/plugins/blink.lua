-- blink.cmp
-- blink links its groups to Pmenu/NormalFloat, which mostly works. Without
-- this file: matched characters aren't highlighted (blink uses
-- BlinkCmpLabelMatch but never defines it), every kind icon is plain text,
-- and borders are drawn in the text color.
return function(c)
	return {
		BlinkCmpLabelMatch = { link = "PmenuMatch" },
		BlinkCmpLabelDeprecated = { fg = c.fg_faint, strikethrough = true },
		BlinkCmpMenuBorder = { link = "FloatBorder" },
		BlinkCmpDocBorder = { link = "FloatBorder" },
		BlinkCmpDocSeparator = { fg = c.border, bg = c.bg },
		BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },

		-- Kind icons take the color of the syntax they stand for, so a
		-- function is blue here and in the code.
		BlinkCmpKindText = { fg = c.fg_dim },
		BlinkCmpKindMethod = { link = "@function.method" },
		BlinkCmpKindFunction = { link = "@function" },
		BlinkCmpKindConstructor = { link = "@constructor" },
		BlinkCmpKindField = { link = "@variable.member" },
		BlinkCmpKindVariable = { link = "@variable" },
		BlinkCmpKindProperty = { link = "@property" },
		BlinkCmpKindClass = { link = "@type" },
		BlinkCmpKindInterface = { link = "@type" },
		BlinkCmpKindStruct = { link = "@type" },
		BlinkCmpKindEnum = { link = "@type" },
		BlinkCmpKindTypeParameter = { link = "@type" },
		BlinkCmpKindModule = { link = "@module" },
		BlinkCmpKindKeyword = { link = "@keyword" },
		BlinkCmpKindOperator = { link = "@operator" },
		BlinkCmpKindConstant = { link = "@constant" },
		BlinkCmpKindEnumMember = { link = "@constant" },
		BlinkCmpKindValue = { link = "@constant" },
		BlinkCmpKindUnit = { link = "@number" },
		BlinkCmpKindSnippet = { link = "Special" },
		BlinkCmpKindColor = { link = "Special" },
		BlinkCmpKindEvent = { link = "Special" },
		BlinkCmpKindReference = { link = "Special" },
		BlinkCmpKindFile = { link = "Directory" },
		BlinkCmpKindFolder = { link = "Directory" },
	}
end
