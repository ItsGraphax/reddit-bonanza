-- Enigma
SMODS.Joker {
	key = 'enigma',
	blueprint_compat = true,
	
	config = { extra = { odds = 10 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { SMODS.get_probability_vars(card, 1, card.ability.extra.odds) } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 1 },
	cost = 8,
	calculate = function(self, card, context)
        if context.using_consumeable then
			if SMODS.pseudorandom_probability(card, 'j_reddit_enigma', 1, card.ability.extra.odds) then
				if context.consumeable.ability.set == 'Planet' or context.consumeable.ability.set == 'Tarot' then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = (function()
							SMODS.add_card {
								set = 'Spectral',
								key_append = 'j_reddit_enigma' -- Optional, useful for checking the source of the creation in `in_pool`.
							}:set_edition('e_negative')
							G.GAME.consumeable_buffer = 0
							return true
						end)
					}))
					return {
						message = localize('k_plus_spectral'),
						colour = G.C.SECONDARY_SET.Spectral
					}
				end
        	end
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}