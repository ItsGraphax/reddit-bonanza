local config = SMODS.current_mod.config
local mod_id = SMODS.current_mod.id

create_card_for_bonanza_pack = function ()
    local pool = {}
    while #pool == 0 do
        local rarity = SMODS.poll_rarity(
            'Joker', 
            'bonanza_pack_rarity' .. G.GAME.round_resets.ante)
        for _, joker_center in pairs(G.P_JOKER_RARITY_POOLS[rarity]) do
            if joker_center.mod and joker_center.mod.id == mod_id then
                pool[#pool+1] = joker_center.key
            end
        end
    end

    -- cull the pool
    if not SMODS.showman() then
        local num_removed = 0
        for i = 1, #pool do
            if G.GAME.used_jokers[pool[i - num_removed]] then
                table.remove(pool, i - num_removed)
                num_removed = num_removed + 1
            end
        end 
        if #pool == 0 then pool = { 'j_joker' } end
    end
    local selected_key = pseudorandom_element(pool, 
        pseudoseed('bonanza_pack_choice' ..G.GAME.round_resets.ante))
    return {
        key = selected_key,
        set = 'Joker',
        area = G.pack_cards,
        skip_materialize = true,
        key_append = 'bonanza_pack'
    }
end
if config.enable_reddit_pack then
    assert(SMODS.load_file('src/boosters/bonanza_pack1.lua'))()
    assert(SMODS.load_file('src/boosters/bonanza_pack2.lua'))()
    assert(SMODS.load_file('src/boosters/jumbo_bonanza_pack1.lua'))()
    assert(SMODS.load_file('src/boosters/mega_bonanza_pack1.lua'))()
end