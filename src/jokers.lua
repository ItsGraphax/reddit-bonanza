CREDIT_TEXT_BG_COLOR = G.C.RED
CREDIT_TEXT_BG_COLOR_ALT = G.C.PURPLE
CREDIT_TEXT_COLOR = G.C.WHITE
CREDIT_TEXT_SIZE = 1

credit_badge = function (username, alt)
    return create_badge('by u/'..username, CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
end

local nativefs = require "nativefs"
local mod_path = SMODS.current_mod.path
local files = NFS.getDirectoryItems(mod_path .. "src/jokers")
for _, file in ipairs(files) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end