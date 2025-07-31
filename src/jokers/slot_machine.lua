-- Slot Machine
SMODS.Joker {
	key = 'slot_machine',
	blueprint_compat = true,

    config = { extra = { reduction = 1, min_dollars = 5, max_dollars = 100} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.reduction, card.ability.extra.min_dollars, card.ability.extra.max_dollars } }
    end,

	rarity = 3,
	
	atlas = 'reddit_jokers',
	pos = { x = 7, y = 1 },

	cost = 10,

	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            return {
                dollars = -card.ability.extra.reduction
            }
        end
	end,
    
    calc_dollar_bonus = function (self, card)
        local r = pseudorandom('j_reddit_slot_machine') ^ 12
        return math.ceil(card.ability.extra.min_dollars + (card.ability.extra.max_dollars - card.ability.extra.min_dollars) * r)
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Kid4U_Reddit', false)
	end
}
