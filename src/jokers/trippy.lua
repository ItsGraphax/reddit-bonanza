-- Trippy Joker
SMODS.Joker {
	key = 'trippy',
	blueprint_compat = true,
	loc_txt = {
		name = 'Trippy Joker',
		text = {
			"Gains {X:mult,C:white}X#1#{} mult",
			"if played hand is {C:attention}#2#{},",
			"else lose {X:mult,C:white}X#1#{} mult",
			"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} mult)"
		}
	},

	config = { extra = { Xmult = 1, mult_mod = 0.2, hand = 'High Card' } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.hand, card.ability.extra.Xmult } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 4, y = 1 },
	cost = 4,
	calculate = function(self, card, context)
        if context.joker_main then
			if context.scoring_name == card.ability.extra.hand then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.mult_mod
			else
				card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.mult_mod
			end

			return {
				Xmult = card.ability.extra.Xmult
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
    end
}