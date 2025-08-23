-- M.A.D.
win_blind = function()
	if G.STATE ~= G.STATES.SELECTING_HAND then
		return
	end
	G.GAME.chips = G.GAME.blind.chips
	G.STATE = G.STATES.HAND_PLAYED
	G.STATE_COMPLETE = true
	end_round()
end

SMODS.Joker {
	key = 'mad',
	blueprint_compat = true,
	eternal_compat = false,



	config = { extra = {} },
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 2 },
	cost = 15,
	calculate = function(self, card, context)
		-- i think it shouldn't give $7 when sold :thinking:

		if context.setting_blind then
			local eval = function() return G.GAME.blind.in_blindand not G.RESET_JIGGLES end
			juice_card_until(card, eval, true)
			return {
				message = localize('k_active_ex')
			}
		end

		if context.selling_self and G.GAME.blind.in_blind then
			return {
				func = function()
					if
						not G.GAME.won
					then
						G.E_MANAGER:add_event(Event({
							trigger = 'immediate',
							blocking = false,
							blockable = false,
							func = (function()
								ease_ante(1)
								win_blind()
								ease_dollars(-G.GAME.dollars)
								if G.GAME.round_resets.ante > G.GAME.win_ante and not G.GAME.won then
									G.GAME.won = true
									G.GAME.win_notified = true
									win_game()
								end
								return true
							end)
						}))
					end
				end
			}
		end
	end,
	set_badges = function(self, card, badges)
		badges[#badges + 1] = credit_badge('TSAMarioYTReddit', false)
	end
}
