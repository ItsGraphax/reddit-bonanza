CREDIT_TEXT_BG_COLOR = G.C.RED
CREDIT_TEXT_BG_COLOR_ALT = G.C.PURPLE
CREDIT_TEXT_COLOR = G.C.WHITE
CREDIT_TEXT_SIZE = 1

credit_badge = function (username, alt)
    return create_badge('by u/'..username, CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
end

local nativefs = require "nativefs"
local mod_path = SMODS.current_mod.path
local all_files = NFS.getDirectoryItems(mod_path .. "src/jokers")

local preferred_order = {
    "chaste_joker",
    "charitable_joker",
    "kind_joker",
    "abstinent_joker",
    "laundromat "
}

local loaded_set = {}

for _, filename in ipairs(preferred_order) do
    local path = "src/jokers/" .. filename .. ".lua"
    if nativefs.getInfo(mod_path .. path) then
        assert(SMODS.load_file(path))()
        loaded_set[filename..'.lua'] = true
    end
end

for _, file in ipairs(all_files) do
    if not loaded_set[file] then
        assert(SMODS.load_file("src/jokers/" .. file))()
    end
end
