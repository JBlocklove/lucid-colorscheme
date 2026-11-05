-- bufferline.nvim
-- Everything on the editor background: current buffer bold italic, others
-- dimmed, names tinted by diagnostics, grey separators. bufferline only
-- fills in groups the colorscheme hasn't set (its `themable` option, on by
-- default), so don't pass a `highlights` table in bufferline's setup.
return function(c)
	local bg = c.bg
	local diagnostics = { Error = c.red, Warning = c.yellow, Info = c.cyan, Hint = c.teal }

	local groups = {
		BufferLineFill = { fg = c.fg_faint, bg = bg },
		BufferLineTruncMarker = { fg = c.yellow, bg = bg },
		BufferLineOffsetSeparator = { fg = c.fg_faint, bg = bg },
		BufferLineIndicatorSelected = { fg = c.blue, bg = bg },
		BufferLineIndicatorVisible = { fg = bg, bg = bg },
		BufferLineTab = { fg = c.fg_faint, bg = bg },
		BufferLineTabSelected = { fg = c.blue, bg = bg, bold = true },
		BufferLineTabClose = { fg = c.red, bg = bg },
		BufferLineTabSeparator = { fg = c.fg_faint, bg = bg },
		BufferLineTabSeparatorSelected = { fg = c.fg_faint, bg = bg },
		BufferLineGroupSeparator = { fg = c.fg_faint, bg = bg },
		BufferLineGroupLabel = { fg = bg, bg = c.fg_faint },
	}

	-- three states: not in a window (""), in another window, current
	for _, state in ipairs({ "", "Visible", "Selected" }) do
		local current = state == "Selected"
		local text = current and c.fg or state == "Visible" and c.fg_dim or c.fg_faint
		groups["BufferLineBuffer" .. state] = { fg = text, bg = bg, bold = current, italic = current }
		groups["BufferLineNumbers" .. state] = { fg = c.fg_dim, bg = bg, bold = current, italic = current }
		groups["BufferLineDuplicate" .. state] = { fg = c.fg_faint, bg = bg, italic = true }
		groups["BufferLineCloseButton" .. state] = { fg = current and c.red or c.fg_faint, bg = bg }
		groups["BufferLineModified" .. state] = { fg = c.orange, bg = bg }
		groups["BufferLineSeparator" .. state] = { fg = c.fg_faint, bg = bg }
		groups["BufferLinePick" .. state] = { fg = c.red, bg = bg, bold = true }
		groups["BufferLineDiagnostic" .. state] = { fg = c.fg_dim, bg = bg }
		for kind, color in pairs(diagnostics) do
			groups["BufferLine" .. kind .. state] = { fg = color, bg = bg, sp = color, bold = current, italic = current }
			groups["BufferLine" .. kind .. "Diagnostic" .. state] = { fg = color, bg = bg, sp = color }
		end
	end
	groups.BufferLineBackground = groups.BufferLineBuffer

	return groups
end
