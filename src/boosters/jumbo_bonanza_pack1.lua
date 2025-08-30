local reddit_orange =  {1.0, 0.337, 0, 1}
SMODS.Booster {
    key = 'bonanza_pack_jumbo1',

    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.choose, 
            card.ability.extra,
            colours = { reddit_orange } 
        } }
    end,

    atlas = 'boosters',
	pos = { x = 2, y = 0 },

    cost = 6,

    weight = 0.7,
    select_card = 'jokers',
    create_card = function (self, card, i)
        return create_card_for_bonanza_pack()
    end,
    config = { extra = 5, choose = 1 },
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, reddit_orange)
        ease_background_colour({ new_colour = reddit_orange, special_colour = G.C.BLACK, contrast = 2 })
    end
}