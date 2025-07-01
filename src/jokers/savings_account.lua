-- Savings Account
local cash_out = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
    cash_out(e)
    SMODS.calculate_context({post_cash_out = true})
	G.GAME.interest_this_round = 0
end

SMODS.Joker {
	key = 'savings_account',
	blueprint_compat = true,
	
	config = { extra = { chip_mod = 2 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { 
			card.ability.extra.chip_mod, 
			card.ability.extra.chip_mod * (G.GAME.interest_this_run or 0)
		} }
	end,

	rarity = 1,
	
	atlas = 'reddit_jokers',
	pos = { x = 7, y = 7 },

	cost = 4,

	calculate = function(self, card, context)
		if context.post_cash_out and not context.blueprint then
			if to_number(G.GAME.interest_this_round) and to_number(G.GAME.interest_this_round) > 0 then
				return { message = localize('k_upgrade_ex') }
			end
			
        elseif context.joker_main then
			return {
				chips = card.ability.extra.chip_mod * (G.GAME.interest_this_run or 0)
			}
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Chum724', false)
	end
}