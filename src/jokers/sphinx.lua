-- Sphinx of Black Quartz
SMODS.Joker {
	key = 'sphinx',
	blueprint_compat = true,
	
	config = { extra = { } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 6 },

	cost = 6,

	calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card {
                        set = 'Joker',
                        rarity = 'Uncommon',
                        key_append = 'reddit_sphinx'
                    }
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Omicra98', false)
	end
}
