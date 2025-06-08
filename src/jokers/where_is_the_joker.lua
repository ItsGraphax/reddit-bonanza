-- Where is the Joker?
SMODS.Joker {
	key = 'where_is_the_joker',
	blueprint_compat = false,
	loc_txt = {
		name = 'Where is the Joker?',
		text = {
			"Gives half the total sell value",
            "of the {C:attention}leftmost joker{} at",
            "end of round",
            "{C:inactive}(Max {C:money}$#1#{C:inactive})",
			"{C:inactive}(Currently: {C:money}$#2#{}){}"
		}
	},

	config = { extra = { max = 20 } },
    loc_vars = function(self, info_queue, card)
		local current = 0
		if G.jokers then current = math.floor(G.jokers.cards[1].sell_cost / 2) end
		return { vars = { card.ability.extra.max, current } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 4 },

	cost = 6,

	calc_dollar_bonus = function(self, card)
        return math.floor(G.jokers.cards[1].sell_cost / 2)
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('babisme', false)
	end
}
