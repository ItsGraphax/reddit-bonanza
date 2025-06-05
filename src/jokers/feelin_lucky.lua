-- Feelin' lucky
SMODS.Joker {
	key = 'feelin_lucky',
	blueprint_compat = true,
	loc_txt = {
		name = 'Feelin\' Lucky',
		text = {
			"{C:green}#1# in #2#{} Chance to",
			"retrigger {C:attention}Lucky{}",
            "{C:clubs}#3#{} {C:attention}Cards{} thrice"
		}
	},

	config = { extra = { repetitions = 3, suit = 'Clubs', odds = 3 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, localize(card.ability.extra.suit, 'suits_singular') } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 0 },
	cost = 4,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only and
			context.other_card:is_suit(card.ability.extra.suit) and SMODS.has_enhancement(context.other_card, 'm_lucky') and 
            pseudorandom('j_reddit_feelin_lucky') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                message = 'Again!',
				message_card = card,
                repetitions = card.ability.extra.repetitions,
                card = context.other_card
            }
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}