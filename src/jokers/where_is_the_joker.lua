-- Where is the Joker?
SMODS.Joker {
	key = 'where_is_the_joker',
	blueprint_compat = false,
	loc_txt = {
		name = 'Where is the Joker?',
		text = {
			"Gives the sell value",
            "of the {C:attention}leftmost joker{} at",
            "end of round",
            "{C:inactive}(Max {C:money}$#1#{C:inactive})",
			"{C:inactive}(Currently: {C:money}$#2#{C:inactive}){}"
		}
	},

	config = { extra = { max = 30 } },
    loc_vars = function(self, info_queue, card)
		local current = 0
		if G.jokers.cards[1] then current = math.min(G.jokers.cards[1].sell_cost, card.ability.extra.max) end
		return { vars = { card.ability.extra.max, current } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 4 },

	cost = 6,

	calc_dollar_bonus = function(self, card)
        return math.min(G.jokers.cards[1].sell_cost, card.ability.extra.max)
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('babisme', false)
	end
}
