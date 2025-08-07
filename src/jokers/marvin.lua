-- Marvin
SMODS.Joker {
	key = 'marvin',
	blueprint_compat = true,
	
	config = { extra = { Xmult = 3, money_cap = 0 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, card.ability.extra.money_cap } }
	end,

	rarity = 1,
	
	atlas = 'reddit_jokers',
	pos = { x = 3, y = 5 },

	cost = 6,

	calculate = function(self, card, context)
        if context.joker_main then
            if to_big(G.GAME.dollars) <= to_big(card.ability.extra.money_cap) then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('BrilliantClerk', false)
	end
}
