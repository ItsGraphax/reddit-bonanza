-- Ad Break
SMODS.Joker {
    key = 'ad_break',
    blueprint_compat = false,
    loc_txt = {
        name = 'Ad Break',
        text = {
            "End of round effects",
            "trigger after every",
            "{C:attention}hand{} played"
        }
    },
    rarity = 3,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            SMODS.calculate_context({end_of_round = true, game_over = game_over })
            for _,v in ipairs(SMODS.get_card_areas('playing_cards', 'end_of_round')) do
			    SMODS.calculate_end_of_round_effects({ cardarea = v, end_of_round = true })
            end
            G.E_MANAGER:add_event(Event({
                func = function ()
                    reset_idol_card()
                    reset_mail_rank()
                    reset_ancient_card()
                    reset_castle_card()
                    for _, mod in ipairs(SMODS.mod_list) do
	                    if mod.reset_game_globals and type(mod.reset_game_globals) == 'function' then
		                    mod.reset_game_globals(false)
	                    end
                    end
                    return true
                end 
            }))
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Kid4U_Reddit', false)
    end
}