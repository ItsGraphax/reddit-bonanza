-- Search Function
local has_value = function(array, value)
    for _, v in ipairs(array) do if v == value then return true end end

    return false
end

-- returns true if item should load
local check_dev = function(args, file)
    return not (has_value(args.dev_items or {}, file) and
               not reddit_config.enable_dev_jokers)
end

-- returns true if item should load
local check_skip = function(args, file)
    return not has_value(args.skip_items or {}, file)
end

-- Load Files
local nativefs = require 'nativefs'
local mod_path = SMODS.current_mod.path

local check_valid = function(args, file, allowed, path, loaded_set)
    r = true
    for _, item in ipairs(allowed) do
        if item == "dev" then
            r = check_dev(args, file)
        elseif item == "skip" then
            r = check_skip(args, file)
        elseif item == "exists" then
            r = nativefs.getInfo(path .. file)
        elseif item == "unloaded" then
            r = not loaded_set[file]
        elseif item == "overrides" then
            r = not has_value(args.item_overrides or {}, file)
        elseif item == "not-overrides" then
            r = has_value(args.item_overrides, file)
        elseif item == "not-last" then
            r = not has_value(args.last_items, file)
        elseif item == "last" then
            r = has_value(args.last_items, file)
        end

        if not r then return r end
    end

    return r
end

-- load(args)
-- args requires these args:
-- subdir
-- args supports these args:
-- preferred_order (filename without .lua)
-- dev_items (filename with .lua)
-- skip_items (filename with .lua)
-- item_overrides (filename with .lua)

local load = function(args)
    -- file, fileformat = filename.lua
    -- filename = filename

    local subdir_path = 'src/' .. args.subdir .. '/'
    local main_path = mod_path .. subdir_path
    local all_files = NFS.getDirectoryItems(mod_path .. 'src/' .. args.subdir)

    -- Loading Order
    local loaded_set = {}

    for _, file in ipairs(args.preferred_order or {}) do
        local path = subdir_path .. file -- src/subdir/filename.lua

        if check_valid(args, file,
                       {"dev", "skip", "exists", "not-last", "unloaded"},
                       main_path, loaded_set) then -- skip
            assert(SMODS.load_file(path))() -- loads file
            loaded_set[file] = true
        end
    end

    -- remaining items
    for _, file in ipairs(all_files) do -- filename.lua
        if check_valid(args, file,
                       {"unloaded", "dev", "skip", "overrides", "not-last"},
                       main_path, loaded_set) then
            assert(SMODS.load_file(subdir_path .. file))()
            loaded_set[file] = true
        end
    end

    -- for the item overrides
    if reddit_config.enable_joker_overrides then
        for _, file in ipairs(args.item_overrides or {}) do
            if check_valid(args, file, {
                "skip", "dev", "not-overrides", "unloaded", "not-last"
            }, main_path, loaded_set) then
                assert(SMODS.load_file(subdir_path .. file))()
                loaded_set[file] = true
            end
        end
    end

    -- for the last jokers
    for _, file in ipairs(all_files) do
        if check_valid(args, file,
                       {"skip", "dev", "overrides", "unloaded", "last"},
                       main_path, loaded_set) then
            assert(SMODS.load_file(subdir_path .. file))()
            loaded_set[file] = true
        end
    end

end

return {load = load}
