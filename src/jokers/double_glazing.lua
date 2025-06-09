function double_glaze_glass_odds()
    if G.jokers then
        for i, joker in ipairs(G.jokers.cards) do
            if joker.ability.name == 'j_reddit_double_glazing' then
                return 0
            end
        end
    end
    return G.GAME.probabilities.normal
end

-- Double glazing
SMODS.Joker {
	key = 'double_glazing',
	blueprint_compat = false,
    enhancement_gate = 'm_glass',
	loc_txt = {
		name = 'Double Glazing',
		text = {
			"Glass cards have zero",
			"chance to break",
		}
	},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return {}
    end,
	config = { },
	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 0 },
	cost = 6,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('USER', false)
    end
}

SMODS.Enhancement:take_ownership('glass', {
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and pseudorandom('glass') < double_glaze_glass_odds()/card.ability.extra then
            card.glass_trigger = true
            return { remove = true }
        end
    end,
})