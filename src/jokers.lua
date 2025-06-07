CREDIT_TEXT_BG_COLOR = G.C.RED
CREDIT_TEXT_BG_COLOR_ALT = G.C.PURPLE
CREDIT_TEXT_COLOR = G.C.WHITE
CREDIT_TEXT_SIZE = 1

credit_badge = function (username, alt)
    return create_badge('by u/'..username, CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
end

assert(SMODS.load_file("src/jokers/feelin_lucky.lua"))()
assert(SMODS.load_file("src/jokers/kleptomaniac.lua"))()
assert(SMODS.load_file("src/jokers/slothful.lua"))()
assert(SMODS.load_file("src/jokers/rainbow.lua"))()
assert(SMODS.load_file("src/jokers/chocolate_treadmill.lua"))()
assert(SMODS.load_file("src/jokers/touchdown.lua"))()
assert(SMODS.load_file("src/jokers/haunted_house.lua"))()
assert(SMODS.load_file("src/jokers/jimbos_loss.lua"))()
assert(SMODS.load_file("src/jokers/trippy.lua"))()
assert(SMODS.load_file("src/jokers/enigma.lua"))()
assert(SMODS.load_file("src/jokers/mad.lua"))()
assert(SMODS.load_file("src/jokers/sinister_joker.lua"))()
assert(SMODS.load_file("src/jokers/medusa.lua"))()
assert(SMODS.load_file("src/jokers/engagement_ring.lua"))()
assert(SMODS.load_file("src/jokers/glass_house.lua"))()
assert(SMODS.load_file("src/jokers/all_in.lua"))()
assert(SMODS.load_file("src/jokers/blank_joker.lua"))()
assert(SMODS.load_file("src/jokers/diamond_pickaxe.lua"))()
assert(SMODS.load_file("src/jokers/legally_distinct.lua"))()
assert(SMODS.load_file("src/jokers/bingo.lua"))()
assert(SMODS.load_file("src/jokers/hi_five.lua"))()
assert(SMODS.load_file("src/jokers/wild_west.lua"))()
assert(SMODS.load_file("src/jokers/lamb.lua"))()
assert(SMODS.load_file("src/jokers/entangled_joker.lua"))()
assert(SMODS.load_file("src/jokers/metronome.lua"))()
