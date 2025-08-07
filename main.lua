SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	quantum_enhancements = true
}

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

SMODS.Atlas {
	-- Key for code to find it with
	key = "reddit_vouchers",
	-- The name of the file, for the code to pull the atlas from
	path = "vouchers.png",
	-- Width of each sprite in 1x size
	px = 72,
	-- Height of each sprite in 1x size
	py = 95
}

SMODS.Atlas {
	-- Key for code to find it with
	key = "reddit_mmc",
	-- The name of the file, for the code to pull the atlas from
	path = "mmc.png",
	-- Width of each sprite in 1x size
	px = 69,
	-- Height of each sprite in 1x size
	py = 94
}

SMODS.Atlas {
	-- Key for code to find it with
  key = 'reddit_blinds',
	-- The name of the file, for the code to pull the atlas from
  path = 'blinds.png',
	-- Width of each sprite in 1x size
  px = 34,
	-- Height of each sprite in 1x size
  py = 34,
	-- Frame count of the animation atlas
  frames = 21,
	-- Atlas type
  atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Atlas({
	key = "modicon",
	path = "modicon.png",
	px = 34,
	py = 34
})

SMODS.Atlas({
	key = "boosters",
	path = "boosters.png",
	px = 71,
    py = 95
})

REDDIT = SMODS.current_mod

if not Talisman then
	to_big = function (n)
		return n
	end
end

assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/vouchers.lua"))()
assert(SMODS.load_file("src/enhancements.lua"))()
assert(SMODS.load_file("src/overrides.lua"))()
assert(SMODS.load_file("src/ui.lua"))()
assert(SMODS.load_file("src/boosters.lua"))()
assert(SMODS.load_file("src/blinds.lua"))()
-- assert(SMODS.load_file("src/credits_tab.lua"))()