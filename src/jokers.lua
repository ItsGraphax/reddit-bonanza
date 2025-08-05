-- Credit Badge
CREDIT_TEXT_BG_COLOR = G.C.RED
CREDIT_TEXT_BG_COLOR_ALT = G.C.PURPLE
CREDIT_TEXT_COLOR = G.C.WHITE
CREDIT_TEXT_SIZE = 1

local reddit_config = SMODS.current_mod.config

 credit_badge = function(username, alt)
    local bg_col = CREDIT_TEXT_BG_COLOR
    if alt then
        bg_col = CREDIT_TEXT_BG_COLOR_ALT
    end

    local prefix = 'by u/'
    if alt then
        prefix = 'art by u/'
    end

    return create_badge(prefix .. username, bg_col, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
end

local has_value = function(array, value)
    for _, v in ipairs(array) do
        if v == value then
            return true
        end
    end

    return false
end

-- Load Files
local nativefs = require 'nativefs'
local mod_path = SMODS.current_mod.path
local all_files = NFS.getDirectoryItems(mod_path .. 'src/jokers')

local skip_jokers = {
    '8_ball.lua'
}

local preferred_order = {
    'artist',
    'diamond_pickaxe',
    'enigma',
    'entangled_joker',
    'feelin_lucky',
    'mad',
    'match3',
    'wizard',
    'bingo',
    'blank_joker',
    'cashback',
    'glass_house',
    'kleptomaniac',
    'phoenix',
    'touchdown',
    'trippy',
    'album_cover',
    'butter_fingers',
    'crimsown_dawn',
    'hollow_point',
    'pharaoh',
    'pier',
    'rover',
    'sphinx',
    'superstition',
    'rover',
    'chaste_joker',
    'charitable_joker',
    'kind_joker',
    'abstinent_joker',
    'medusa',
    'laundromat',
    'bingo',
    'cashback',
    'contagious_laughter',
    'engagement_ring',
    'lamb',
    'phoenix',
    'birbal',
    'nichola'
}

-- Loading Order
local loaded_set = {}

for _, filename in ipairs(preferred_order) do
    local path = 'src/jokers/' .. filename .. '.lua'
    if nativefs.getInfo(mod_path .. path) then
        assert(SMODS.load_file(path))()
        loaded_set[filename .. '.lua'] = true
    end
end

-- Remaining Jokers
for _, file in ipairs(all_files) do
    if not (loaded_set[file] or has_value(skip_jokers, file)) then
        assert(SMODS.load_file('src/jokers/' .. file))()
    end
end

-- for the 8 ball modification
print(reddit_config.enable_joker_overrides)
if reddit_config.enable_joker_overrides then
    assert(SMODS.load_file('src/jokers/8_ball.lua'))()
end
