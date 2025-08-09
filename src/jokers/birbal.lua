-- Birbal
SMODS.Joker {
	key = "birbal",
    blueprint_compat = true,
	    config = { extra = { xmult = 2, in_scoring = false } },
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    rarity = 4,
    cost = 20,
	calculate = function (self, card, context)
        if context.before then card.ability.extra.in_scoring = true end
		if context.post_trigger
            and card.ability.extra.in_scoring
            and context.other_card.area == G.jokers
        then
			return {
				Xmult = card.ability.extra.xmult
			}
		end
        if context.after then card.ability.extra.in_scoring = false end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end,
    atlas = 'reddit_jokers',
    pos = { x = 4, y = 5 },
    soul_pos = { x = 5, y = 5 }
}