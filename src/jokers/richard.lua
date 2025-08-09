-- Richard
SMODS.Joker {
	key = 'richard',
	blueprint_compat = true,
    perishable_compat = false, -- even though it doesn't matter

    config = { extra = { chip_gain = 10, chips = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain, card.ability.extra.chips } }
    end,

	rarity = 4,
	
	atlas = 'reddit_jokers',
	pos = { x = 14, y = 0 },
    soul_pos = { x = 15, y = 0 },

	cost = 20,

	calculate = function(self, card, context)
        if context.before then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            return {
                message = 'Upgrade!',
                colour = G.C.BLUE
            }
        elseif context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Long-Rooster-5013', false)
	end
}
