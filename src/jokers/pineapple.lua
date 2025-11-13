-- Pineapple
SMODS.Joker {
    key = 'pineapple',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {extra = {xmult = 2.5, round_2 = true, cmult = 2.5, has_triggered = false, first_trigger = true}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult, card.ability.extra.cmult}}
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = {x = 11, y = 3},

    cost = 7,

    calculate = function(self, card, context)
        if context.joker_main then
			card.ability.extra.has_triggered = true
            return {xmult = card.ability.extra.cmult}
        elseif context.setting_blind then
			-- Fix bug so it dosen't give you two rounds of xmult if you get the joker during the blind
			if card.ability.extra.has_triggered and card.ability.extra.first_trigger then
				card.ability.extra.round_2 = false
			end

			card.ability.extra.first_trigger = false
			card.ability.extra.round_2 = not card.ability.extra.round_2

			if card.ability.extra.round_2 then
				card.ability.extra.cmult = 0
			else
				card.ability.extra.cmult = card.ability.extra.xmult
			end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('submiss1vefemb0y', false)
    end
}
