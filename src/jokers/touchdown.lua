-- Touchdown
SMODS.Joker {
	key = 'touchdown',
	blueprint_compat = true,
	perishable_compat = false,
	
	config = { extra = { mult = 0, total_chips = 0, mult_mod = 7, total_limit = 100 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.total_limit, card.ability.extra.mult, card.ability.extra.total_chips } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 1 },
	cost = 6,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
			card.ability.extra.total_chips = card.ability.extra.total_chips + context.other_card:get_chip_bonus()
			if card.ability.extra.total_chips >= card.ability.extra.total_limit then
				card.ability.extra.total_chips = card.ability.extra.total_chips - card.ability.extra.total_limit
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
				return {
					message = "Upgrade!",
					colour = G.C.MULT,
					message_card = card
				}
			else
				return {
					message = tostring(card.ability.extra.total_chips),
					message_card = card
				}
			end
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
        badges[#badges+1] = credit_badge('ItsGraphaxYT', true)
    end
}