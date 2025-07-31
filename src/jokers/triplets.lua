-- Triplets
SMODS.Joker {
	key = 'triplets',
	blueprint_compat = true,

    config = { extra = { chips = 9, mult = 6, dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.dollars} }
    end,

	rarity = 1,
	
	atlas = 'reddit_jokers',
	pos = { x = 11, y = 0 },

	cost = 5,

	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 3 then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                    dollars = card.ability.extra.dollars
                }
            end
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Deitiessoul', false)
	end
}
