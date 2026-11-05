-- gitsigns.nvim
-- Signs and line highlights already follow Added/Changed/Removed and the
-- Diff groups. Without this file, the changed words inside a line (word
-- diff, inline previews) fall back to reverse video.
return function(c)
	return {
		GitSignsAddInline = { bg = c.diff_add_text },
		GitSignsChangeInline = { bg = c.diff_text },
		GitSignsDeleteInline = { bg = c.diff_delete_text },
	}
end
