-- Savings Account
local cash_out = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
    SMODS.calculate_context({pre_cash_out = true})
    cash_out(e)
end

SMODS.Joker {
	key = 'savings_account',
	blueprint_compat = true,
	loc_txt = {
		name = 'Savings Account',
		text = {
			"This {C:attention}Joker{} gains {C:chips}+#1#{} chips",
			"for every {C:money}$1{} of interest",
			"earned",
			"{C:inactive}(Currently {C:chips}+#2#{C:inactive} chips)"
		}
	},

	config = { extra = { chip_mod = 2, chips = 0 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chip_mod, card.ability.extra.chips } }
	end,

	rarity = 1,
	
	atlas = 'reddit_jokers',
	pos = { x = 7, y = 5 },

	cost = 4,

	calculate = function(self, card, context)
		if context.pre_cash_out and not context.blueprint then
			if G.GAME.interest_this_round and G.GAME.interest_this_round > 0 then
				card.ability.extra.chips = 
					card.ability.extra.chips + 
					card.ability.extra.chip_mod * G.GAME.interest_this_round
				return { message = localize('k_upgrade_ex') }
			end
			
        elseif context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('USER', false)
	end
}