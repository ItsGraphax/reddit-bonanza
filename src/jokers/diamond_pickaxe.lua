-- Diamond Pickaxe 
SMODS.Joker {
	key = 'diamond_pickaxe',
	blueprint_compat = true,
	loc_txt = {
		name = 'Diamond Pickaxe',
		text = {
			"{C:green}#1# in #2#{} chance to",
			"give {C:money}$#3#{} when discarding any",
			"{C:attention}Enhanced Card{}"
		}
	},

	config = { extra = { odds = 8, money = 40 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.money } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 3 },

	cost = 6,

	calculate = function(self, card, context)
        if context.discard and
		next(SMODS.get_enhancements(context.other_card)) and
		pseudorandom('j_reddit_diamond_pickaxe') < G.GAME.probabilities.normal / card.ability.extra.odds then
			return {
				dollars = card.ability.extra.money
			}
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}
