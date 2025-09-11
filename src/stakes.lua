-- Search Function
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
local all_files = NFS.getDirectoryItems(mod_path .. 'src/stakes')

local dev_jokers = {
    'bonanza.lua'
}

-- Stickers
for _, file in ipairs(all_files) do
    local should_load = true
    if has_value(dev_jokers, file) then
        should_load = reddit_config.enable_dev_jokers
    end

    if should_load then
        assert(SMODS.load_file('src/stakes/' .. file))()
    end
end
