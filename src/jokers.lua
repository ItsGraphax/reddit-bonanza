CREDIT_TEXT_BG_COLOR = G.C.RED
CREDIT_TEXT_BG_COLOR_ALT = G.C.PURPLE
CREDIT_TEXT_COLOR = G.C.WHITE
CREDIT_TEXT_SIZE = 1

credit_badge = function (username, alt)
    return create_badge('by u/'..username, CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
end

local joker_files = {
    "feelin_lucky.lua",
    "kleptomaniac.lua",
    "slothful.lua",
    "rainbow.lua",
    "chocolate_treadmill.lua",
    "touchdown.lua",
    "haunted_house.lua",
    "jimbos_loss.lua",
    "trippy.lua",
    "enigma.lua",
    "mad.lua",
    "sinister_joker.lua",
    "medusa.lua",
    "engagement_ring.lua",
    "glass_house.lua",
    "all_in.lua",
    "blank_joker.lua",
    "diamond_pickaxe.lua",
    "legally_distinct.lua",
    "bingo.lua",
    "hi_five.lua",
    "wild_west.lua",
    "lamb.lua",
    "entangled_joker.lua",
    "metronome.lua",
    "wizard.lua",
    "artist.lua",
    "match3.lua",
    "where_is_the_joker.lua",
    "double_glazing.lua",
    "laundromat.lua",
    "contagious_laughter.lua",
    "ad_break.lua",
    "marvin.lua",
    "birbal.lua",
    "phoenix.lua",
    "crimson_dawn.lua",
    "sphinx.lua",
    "superstition.lua",
    "hollow_point.lua"
}

for _, file in ipairs(joker_files) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end
