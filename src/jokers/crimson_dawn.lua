-- Crimson Dawn
SMODS.Joker {
	key = 'crimson_dawn',
	blueprint_compat = true,
	loc_txt = {
		name = 'Crimson Dawn',
		text = {
			"Retrigger all played",
            "cards in {C:attention}first",
            "{C:attention}hand{} of round"
		}
	},

	config = { extra = { active = false, repetitions = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 3,
	
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 6 },

	cost = 6,

	calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.active = true

        elseif context.repetition and context.cardarea == G.play and card.ability.extra.active then
            return {
                repetitions = card.ability.extra.repetitions
            }

		elseif context.joker_main then
			card.ability.extra.active = false
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Omicra98', false)
	end
}
