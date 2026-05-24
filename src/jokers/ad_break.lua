-- Ad Break
SMODS.Joker {
    key = 'ad_break',
    blueprint_compat = false,
    rarity = 3,

    atlas = 'reddit_jokers',
    pos = { x = 2, y = 5},

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            -- End of round (eor) calc
            SMODS.calculate_context({end_of_round = true, game_over = game_over })

            -- Playing card eor
            for _,v in ipairs(SMODS.get_card_areas('playing_cards', 'end_of_round')) do
			    SMODS.calculate_end_of_round_effects({ cardarea = v, end_of_round = true })
            end

            -- Manual reset
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

            -- Money gain
            for _, card in ipairs(G.jokers.cards) do
                if card.calculate_dollar_bonus and type(card.calculate_dollar_bonus) == 'function' then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blocking = true,
                        func = function ()
                            card:juice_up(0.3, 0.4)
                            ease_dollars(card:calculate_dollar_bonus(card))
                            return true
                        end
                    }))
                end
            end
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Kid4U_Reddit', false)
    end
}