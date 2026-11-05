-- bufferline.nvim
-- Without this file bufferline works out its own shades from Normal and
-- Comment; close to lucid, but not the same as lucid's tab line and
-- statusline, and it dims diagnostic colors on unselected buffers. These
-- groups match the tab line: bg_darker behind the tabs, bg_dark for other
-- buffers, bg for the current one.
--
-- bufferline only fills in groups the colorscheme hasn't set, as long as its
-- `themable` option is on (the default).
return function(c)
	local fill = c.bg_darker

	-- Each element has three states: not shown in a window, shown in another
	-- window ("Visible"), and current ("Selected").
	local states = {
		{ name = "", bg = c.bg_dark, fg = c.fg_faint },
		{ name = "Visible", bg = c.bg_dark, fg = c.fg_dim },
		{ name = "Selected", bg = c.bg, fg = c.fg },
	}
	local diagnostics = { Error = c.red, Warning = c.yellow, Info = c.cyan, Hint = c.teal }

	local groups = {
		BufferLineFill = { fg = c.fg_faint, bg = fill },
		BufferLineBackground = { fg = c.fg_faint, bg = c.bg_dark },
		BufferLineTab = { fg = c.fg_faint, bg = c.bg_dark },
		BufferLineTabClose = { fg = c.fg_faint, bg = c.bg_dark },
		BufferLineTabSelected = { fg = c.blue, bg = c.bg, bold = true },
		BufferLineTabSeparator = { fg = fill, bg = c.bg_dark },
		BufferLineTabSeparatorSelected = { fg = fill, bg = c.bg },
		BufferLineIndicatorSelected = { fg = c.blue, bg = c.bg },
		BufferLineIndicatorVisible = { fg = c.bg_dark, bg = c.bg_dark },
		BufferLineOffsetSeparator = { fg = c.border, bg = fill },
		BufferLineTruncMarker = { fg = c.fg_faint, bg = fill },
		BufferLineGroupSeparator = { fg = c.fg_faint, bg = fill },
		BufferLineGroupLabel = { fg = fill, bg = c.fg_faint },
	}

	for _, s in ipairs(states) do
		local current = s.name == "Selected"
		groups["BufferLineBuffer" .. s.name] = { fg = s.fg, bg = s.bg, bold = current }
		groups["BufferLineNumbers" .. s.name] = { fg = s.fg, bg = s.bg, bold = current }
		groups["BufferLineCloseButton" .. s.name] = { fg = s.fg, bg = s.bg }
		groups["BufferLineDuplicate" .. s.name] = { fg = c.fg_faint, bg = s.bg, italic = true }
		groups["BufferLineModified" .. s.name] = { fg = c.green, bg = s.bg }
		groups["BufferLineSeparator" .. s.name] = { fg = fill, bg = s.bg }
		groups["BufferLinePick" .. s.name] = { fg = c.red, bg = s.bg, bold = true }
		groups["BufferLineDiagnostic" .. s.name] = { fg = s.fg, bg = s.bg }
		for kind, color in pairs(diagnostics) do
			-- buffer name and diagnostic count, colored only when current
			local fg = current and color or s.fg
			groups["BufferLine" .. kind .. s.name] = { fg = fg, bg = s.bg, sp = color, bold = current }
			groups["BufferLine" .. kind .. "Diagnostic" .. s.name] = { fg = fg, bg = s.bg, sp = color }
		end
	end
	return groups
end
