-- Haunted House
SMODS.Joker {
	key = 'haunted_house',
	blueprint_compat = true,
	loc_txt = {
		name = 'Haunted House',
		text = {
			"{C:green}#1# in #2#{} chance to create",
			"a {C:blue}Spectral Card{} when the",
			"played hand contains a {C:attention}#3#{}"
		}
	},

	config = { extra = { odds = 4, poker_hand = 'Full House' } },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.poker_hand } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 1 },
	cost = 8,
    calculate = function(self, card, context)
        random = pseudorandom('j_reddit_haunted_house')
        if context.joker_main then
            if next(context.poker_hands[card.ability.extra.poker_hand]) then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			        if random < G.GAME.probabilities.normal / card.ability.extra.odds then

                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                SMODS.add_card {
                                    set = 'Spectral',
                                    key_append = 'j_reddit_haunted_house' -- Optional, useful for checking the source of the creation in `in_pool`.
                                }
                                G.GAME.consumeable_buffer = 0
                                return true
                            end)
                        }))
                        return {
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral
                        }
                    end
                end
            end
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Ulik', false)
    end
}