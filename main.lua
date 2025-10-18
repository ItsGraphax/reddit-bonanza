SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    quantum_enhancements = true,
    post_trigger = true
}

-- region atlases
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

SMODS.Atlas({key = "modicon", path = "modicon.png", px = 34, py = 34})

SMODS.Atlas({key = "boosters", path = "boosters.png", px = 71, py = 95})

SMODS.Atlas({key = "tags", path = "tags.png", px = 34, py = 34})
-- endregion atlases

REDDIT = SMODS.current_mod
reddit_config = SMODS.current_mod.config

if not Talisman then to_big = function(n) return n end end

-- Credit Badge
CREDIT_TEXT_BG_COLOR = G.C.RED
CREDIT_TEXT_BG_COLOR_ALT = G.C.PURPLE
CREDIT_TEXT_COLOR = G.C.WHITE
CREDIT_TEXT_SIZE = 0.9

credit_badge = function(username, alt)
    local bg_col = CREDIT_TEXT_BG_COLOR
    if alt then bg_col = CREDIT_TEXT_BG_COLOR_ALT end

    local prefix = 'by u/'
    if alt then prefix = 'art by u/' end

    return create_badge(prefix .. username, bg_col, CREDIT_TEXT_COLOR,
                        CREDIT_TEXT_SIZE)
end

loader = assert(SMODS.load_file("src/general_loader.lua"))()

loader.load({
    subdir = "jokers",
    preferred_order = {
        'artist.lua.lua', 'class_notes.lua', 'diamond_pickaxe.lua',
        'enigma.lua', 'entangled_joker.lua', 'feelin_lucky.lua', 'mad.lua',
        'match3.lua', 'wizard.lua', 'bingo.lua', 'blank_joker.lua',
        'cashback.lua', 'glass_house.lua', 'kleptomaniac.lua', 'phoenix.lua',
        'touchdown.lua', 'trippy.lua', 'album_cover.lua', 'butter_fingers.lua',
        'crimsown_dawn.lua', 'hollow_point.lua', 'pharaoh.lua', 'pier.lua',
        'rover.lua', 'sphinx.lua', 'superstition.lua', 'rover.lua',
        'chaste_joker.lua', 'charitable_joker.lua', 'kind_joker.lua',
        'abstinent_joker.lua', 'medusa.lua', 'laundromat.lua', 'bingo.lua',
        'cashback.lua', 'contagious_laughter.lua', 'engagement_ring.lua',
        'lamb.lua', 'phoenix.lua'
    },
    dev_items = {
        'thunderstruck.lua', 'decalcomania.lua', 'class_notes.lua',
        'tough_crowd.lua', 'richard.lua', 'distinguished.lua', 'snowman.lua',
        'thalia.lua', 'ufo.lua', 'molotov.lua', 'sweetener.lua',
        'sisyphean_task.lua', 'sheet_music.lua', 'irises.lua'
    },
    skip_items = {
        '8_ball.lua', 'roasted_marshmallow.lua', 'sweetener.lua'
    },
    item_overrides = {'8_ball.lua'},
    last_items = {'birbal.lua', 'nichola.lua', 'richard.lua', 'thalia.lua'}
})

-- assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/vouchers.lua"))()
assert(SMODS.load_file("src/enhancements.lua"))()
assert(SMODS.load_file("src/overrides.lua"))()
assert(SMODS.load_file("src/ui.lua"))()
assert(SMODS.load_file("src/boosters.lua"))()
assert(SMODS.load_file("src/blinds.lua"))()
assert(SMODS.load_file("src/tags.lua"))()
assert(SMODS.load_file("src/stickers.lua"))()
assert(SMODS.load_file("src/stakes.lua"))()
-- assert(SMODS.load_file("src/credits_tab.lua"))()
