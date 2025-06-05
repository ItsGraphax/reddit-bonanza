-- Engagement Ring
SMODS.Joker {
	key = 'engagement_ring',
	blueprint_compat = true,
	loc_txt = {
		name = 'Engagement Ring',
		text = {
			"Retriggers all scored",
			"{C:diamonds}#1#{}"
		}
	},

	config = { extra = { suit = 'Diamonds', repetitions = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.suit } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 2 },
	cost = 4,
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only and
		context.other_card:is_suit(card.ability.extra.suit) then
			return {
				message = 'Again!',
				repetitions = card.ability.extra.repetitions,
				message_card = card,
				card = context.other_card
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/LittlePetiteGirl', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}