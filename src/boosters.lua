local config = SMODS.current_mod.config
local mod_id = SMODS.current_mod.id
if config.enable_bonanza_pack then
    SMODS.Booster {
        key = 'bonanza_pack',
        loc_txt = {
            name = "Bonanza Pack",
            text = {
                "Choose 1 of up to 3 jokers"
            }
        },
        weight = 0.7,
        select_card = 'jokers',
        create_card = function (self, card, i)
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

            local selected_key = pseudorandom_element(pool, 
                pseudoseed('bonanza_pack_choice' ..G.GAME.round_resets.ante))
            
            return {
                key = selected_key,
                set = 'Joker',
                area = G.pack_cards,
                skip_materialize = true,
                key_append = 'bonanza_pack'
            }
        end,
        config = { extra = 3, choose = 1 }
    }
end