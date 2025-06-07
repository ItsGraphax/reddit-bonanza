SMODS.Atlas {
	-- Key for code to find it with
	key = "reddit_jokers",
	-- The name of the file, for the code to pull the atlas from
	path = "jokers.png",
	-- Width of each sprite in 1x size
	px = 71,
	-- Height of each sprite in 1x size
	py = 95
}

assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/vouchers.lua"))()
assert(SMODS.load_file("src/overrides.lua"))()
-- assert(SMODS.load_file("src/credits_tab.lua"))()