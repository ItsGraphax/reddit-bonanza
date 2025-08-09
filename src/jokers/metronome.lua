-- Metronome
SMODS.Joker {
	key = 'metronome',
	blueprint_compat = true,
    perishable_compat = false,
	
	config = { extra = { mult_mod = 3, last_played = 'None', second_last_played = 'None', mult = 0 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.mult, card.ability.extra.last_played, card.ability.extra.second_last_played } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 3 },

	cost = 4,

	calculate = function(self, card, context)
        if context.joker_main then
            last_played = card.ability.extra.last_played
            second_last_played = card.ability.extra.second_last_played
            card.ability.extra.second_last_played = card.ability.extra.last_played
            card.ability.extra.last_played = context.scoring_name

            if card.ability.extra.last_played == card.ability.extra.second_last_played then
                card.ability.extra.second_last_played = 'None'
            end

            if context.scoring_name == second_last_played then
                if context.scoring_name ~= last_played then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end

        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Jkjsupremo', false)
    end
}