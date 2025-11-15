-- Slothful Joker
SMODS.Joker {
	key = 'slothful',
	blueprint_compat = true,

	config = { extra = { mult = 5 } },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS['m_stone']
		return { vars = { card.ability.extra.mult } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 3, y = 0 },
	cost = 4,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and
				SMODS.has_enhancement(context.other_card, 'm_stone') then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end,

	in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_stone'`
		for _, playing_card in ipairs(G.playing_cards or {}) do
			if SMODS.has_enhancement(playing_card, 'm_stone') then
				return true
			end
		end
		return false
	end,

	set_badges = function(self, card, badges)
		badges[#badges + 1] = credit_badge('NeoShard1', false)
	end

}
