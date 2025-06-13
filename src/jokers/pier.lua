-- Pier
SMODS.Joker {
	key = 'pier',
	blueprint_compat = true,
	loc_txt = {
		name = 'Pier',
		text = {
			"If first discard of round",
            "has only 1 card, it gains",
            "a random seal"
		}
	},

	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 3, y = 7 },

	cost = 5,

	calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.discard and not context.blueprint and
            G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
            local seal = SMODS.poll_seal({guaranteed = true})
            context.other_card:set_seal(seal, true)
            context.other_card:juice_up(0.5,0.5)
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Omicra98', false)
	end
}
