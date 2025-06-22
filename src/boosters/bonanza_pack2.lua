local reddit_orange =  {1.0, 0.337, 0, 1}
SMODS.Booster {
    key = 'bonanza_pack2',
    loc_txt = {
        name = "Bonanza Pack",
        text = {
            "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
            "{V:1}Reddit Bonanza{} Jokers"
        },
        group_name = "Bonanza Pack"
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.choose, 
            card.ability.extra,
            colours = { reddit_orange } 
        } }
    end,

    atlas = 'boosters',
	pos = { x = 1, y = 0 },

    weight = 0.7,
    select_card = 'jokers',
    create_card = function (self, card, i)
        return create_card_for_bonanza_pack()
    end,
    config = { extra = 3, choose = 1 },
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, reddit_orange)
        ease_background_colour({ new_colour = reddit_orange, special_colour = G.C.BLACK, contrast = 2 })
    end
}