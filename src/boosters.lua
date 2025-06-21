local config = SMODS.current_mod.config
local mod_id = SMODS.current_mod.id

local create_card_for_pack = function ()
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
end
if config.enable_reddit_pack then
    SMODS.Booster {
        key = 'bonanza_pack',
        loc_txt = {
            name = "Bonanza Pack",
            text = {
                "Choose 1 of up to 3 jokers"
            },
            group_name = "Bonanza Pack"
        },
        weight = 0.7,
        select_card = 'jokers',
        create_card = function (self, card, i)
            return create_card_for_pack()
        end,
        config = { extra = 3, choose = 1 },
        ease_background_colour = function(self)
            local reddit_orange =  {1.0, 0.337, 0, 1}
            ease_colour(G.C.DYN_UI.MAIN, reddit_orange)
            ease_background_colour({ new_colour = reddit_orange, special_colour = G.C.BLACK, contrast = 2 })
        end
    }
    SMODS.Booster {
        key = 'bonanza_pack_jumbo',
        loc_txt = {
            name = "Jumbo Bonanza Pack",
            text = {
                "Choose 1 of up to 5 jokers"
            },
            group_name = "Bonanza Pack"
        },
        weight = 0.7,
        select_card = 'jokers',
        create_card = function (self, card, i)
            return create_card_for_pack()
        end,
        config = { extra = 5, choose = 1 },
        ease_background_colour = function(self)
            local reddit_orange =  {1.0, 0.337, 0, 1}
            ease_colour(G.C.DYN_UI.MAIN, reddit_orange)
            ease_background_colour({ new_colour = reddit_orange, special_colour = G.C.BLACK, contrast = 2 })
        end
    }
    SMODS.Booster {
        key = 'bonanza_pack_mega',
        loc_txt = {
            name = "Mega Bonanza Pack",
            text = {
                "Choose 2 of up to 5 jokers"
            },
            group_name = "Bonanza Pack"
        },
        weight = 0.5,
        select_card = 'jokers',
        create_card = function (self, card, i)
            return create_card_for_pack()
        end,
        config = { extra = 5, choose = 2 },
        ease_background_colour = function(self)
            local reddit_orange =  {1.0, 0.337, 0, 1}
            ease_colour(G.C.DYN_UI.MAIN, reddit_orange)
            ease_background_colour({ new_colour = reddit_orange, special_colour = G.C.BLACK, contrast = 2 })
        end
    }
end