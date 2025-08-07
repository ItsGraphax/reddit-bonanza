-- All In
SMODS.Joker {
	key = 'all_in',
	blueprint_compat = true,

	config = { extra = { Xmult = 5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 4, y = 2 },
	cost = 6,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint and
			to_big(G.GAME.dollars) > to_big(0) then
			ease_dollars(-to_big(G.GAME.dollars))
			return {
				message = "All in!"
			}
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.Xmult
			}
		end
	end,
	set_badges = function(self, card, badges)
		badges[#badges + 1] = credit_badge('Kyuuseishu_', false)
		badges[#badges + 1] = credit_badge('TSAMarioYTReddit', true)
	end
}
