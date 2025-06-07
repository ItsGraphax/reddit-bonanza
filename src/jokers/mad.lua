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
	loc_txt = {
		name = 'M.A.D.',
		text = {
			"Sell this Joker to defeat",
			"{C.attention}this Blind{}, Increase",
			"{C:attention}Ante{} by {C:attention}+1{} and set",
			"money to {C:money}0{}"
		}
	},

	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 2 },
	cost = 15,
	calculate = function(self, card, context)
        if context.selling_self then
			return {
				func = function ()
					G.GAME.round_resets.ante = G.GAME.round_resets.ante + 1
					win_blind()
					ease_dollars(-G.GAME.dollars)
					if 
						G.GAME.round_resets.ante > G.GAME.win_ante
						and not G.GAME.won
					then
						G.GAME.won = true
                		G.GAME.win_notified = true
                		G.E_MANAGER:add_event(Event({
                		    trigger = 'immediate',
                		    blocking = false,
                		    blockable = false,
                		    func = (function()
                		        if G.STATE == G.STATES.ROUND_EVAL then 
                		            win_game()
                		            return true
                		        end
                		    end)
                		}))
					end
				end
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}
