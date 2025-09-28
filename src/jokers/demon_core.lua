-- Demon Core
SMODS.Joker {
	key = 'demon_core',
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	config = { extra = { repetitions = 2, hands_mod = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.repetitions, card.ability.extra.hands_mod } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 13, y = 1 },

	cost = 6,

    add_to_deck = function(self, card, from_debuff) -- remove hands
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands_mod
        ease_hands_played(-card.ability.extra.hands_mod)
    end,
    remove_from_deck = function(self, card, from_debuff) -- give hands back
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands_mod
        ease_hands_played(card.ability.extra.hands_mod)
    end,

	calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            return {
                message = 'Again!',
				message_card = card,
                repetitions = card.ability.extra.repetitions,
                card = context.other_card
            }
        end
	end,

	set_badges = function(self, card, badges)
		badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
	end
}
