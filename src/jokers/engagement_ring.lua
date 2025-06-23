-- Engagement Ring
SMODS.Joker {
	key = 'engagement_ring',
	blueprint_compat = true,
	loc_txt = {
		name = 'Engagement Ring',
		text = {
			'{C:green}#1# in #2#{} chance to retrigger',
            '{C:attention}Scored {C:diamonds}#3#'
		}
	},

	config = { extra = { odds = 2, suit = 'Diamonds', repetitions = 1 } },
    loc_vars = function(self, info_queue, card)
		local num, denum = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
		return { vars = { num, denum, card.ability.extra.suit } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 2 },
	cost = 4,
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only and
		context.other_card:is_suit(card.ability.extra.suit) and
        SMODS.pseudorandom_probability(card, 'j_reddit_engagement_ring', 1, card.ability.extra.odds) then
            return {
                message = 'Again!',
				message_card = card,
                repetitions = card.ability.extra.repetitions,
                card = context.other_card
            }
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('LittlePetiteGirl', false)
		badges[#badges+1] = create_badge('art by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR_ALT, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}