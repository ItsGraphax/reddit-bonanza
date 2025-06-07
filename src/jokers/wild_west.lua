-- Wild West
SMODS.Joker {
	key = 'wild_west',
	blueprint_compat = true,
	loc_txt = {
		name = 'Wild West',
		text = {
			"{X:mult,C:white}X#1#{} Mult if played Hand",
			"contains {C:attention}3 or more wild cards{}"
		}
	},

	config = { extra = { Xmult = 3 } },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS['m_wild']
		return { vars = { card.ability.extra.Xmult } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 3 },

	cost = 6,

	calculate = function(self, card, context)
        if context.joker_main then
			local wild_cards = 0
            for _, scored_card in ipairs(context.full_hand) do
                if SMODS.has_enhancement(scored_card, 'm_wild') then wild_cards = wild_cards + 1 end
            end
			if wild_cards >= 3 then
				return {
					xmult = card.ability.extra.Xmult
				}
			end
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('GreedyHase', false)
    end
}
