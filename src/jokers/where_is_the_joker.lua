-- Where is the Joker?
SMODS.Joker {
	key = 'where_is_the_joker',
	blueprint_compat = true,
	loc_txt = {
		name = 'Where is the Joker?',
		text = {
			"Gives half the total sell value",
            "of the {C:attention}leftmost joker{} at",
            "end of round",
            "{C:inactive}(Max {C:money}$#1#{C:inactive})"
		}
	},

	config = { extra = { max = 20 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.max } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 4 },

	cost = 6,

	calc_dollar_bonus = function(self, card)
        return G.jokers.cards[1].sell_cost / 2
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('babisme', false)
	end
}
