-- Where is Joker?
SMODS.Joker {
	key = 'where_is_joker',
	blueprint_compat = false,
	
	config = { extra = { max = 30 } },
    loc_vars = function(self, info_queue, card)
		local current = ''
		if G.jokers and G.jokers.cards[1] then
			current = math.min(G.jokers.cards[1].sell_cost, card.ability.extra.max)
		else
			current = '?'
		end
		
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
