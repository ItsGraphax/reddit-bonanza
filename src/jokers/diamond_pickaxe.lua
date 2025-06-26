-- Diamond Pickaxe 
SMODS.Joker {
	key = 'diamond_pickaxe',
	blueprint_compat = true,
	
	config = { extra = { odds = 8, money = 40 } },
    loc_vars = function(self, info_queue, card)
		local num, denum = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
		return { vars = { num, denum, card.ability.extra.money } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 3 },

	cost = 6,

	calculate = function(self, card, context)
        if context.discard and
		next(SMODS.get_enhancements(context.other_card)) and
		SMODS.pseudorandom_probability(card, 'j_reddit_diamond_pickaxe', 1, card.ability.extra.odds) then
			return {
				dollars = card.ability.extra.money
			}
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}
