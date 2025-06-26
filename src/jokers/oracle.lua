-- Oracle
SMODS.Joker {
	key = 'oracle',
	blueprint_compat = true,
	
	config = { extra = { x_mult_per = 0.5 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { 
            card.ability.extra.x_mult_per,
            1 + card.ability.extra.x_mult_per * 
                (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0)
         } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 7 },

	cost = 4,

	calculate = function(self, card, context)
        local xmult = 1 + card.ability.extra.x_mult_per * 
                (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Spectral" then
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { xmult } },
            }
        end
        if context.joker_main then
            return {
                xmult = xmult
            }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Cuddly_Corvid', false)
	end
}
