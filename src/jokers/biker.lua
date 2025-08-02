local count_bikers = function ()
    local bikers = 0
    if G.jokers == nil then return end
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center_key == 'j_reddit_biker' then
            bikers = bikers + 1
        end
    end

    return bikers
end

-- Biker
SMODS.Joker {
	key = 'biker',
	blueprint_compat = true,

	config = { extra = { Xmult = 2 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, (count_bikers() or 1) * card.ability.extra.Xmult } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 8, y = 0 },

	cost = COST,

	calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult * count_bikers()
            }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Step_Switcher', false)
	end
}
