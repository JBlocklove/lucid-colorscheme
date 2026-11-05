-- markview.nvim
-- markview builds its colors (headings, callouts, checkboxes, list markers)
-- from these exact group names, falling back to @markup.heading. Without
-- them every heading, and every callout that borrows a heading's color, is
-- the same blue. groups.lua gives each heading level its own color; this
-- points markview at them. markview then blends its own backgrounds from
-- these colors, so nothing else is needed.
return function()
	local groups = {}
	for level = 1, 6 do
		groups["@markup.heading." .. level .. ".markdown"] = { link = "@markup.heading." .. level }
	end
	return groups
end
