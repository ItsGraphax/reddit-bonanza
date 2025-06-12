-- Chaste Joker
SMODS.Joker {
    key = 'chaste_joker',
    blueprint_compat = true,
    loc_txt = {
        name = 'Chaste Joker',
        text = {
            '{C:green}#1# in #2#{} chance to retrigger',
            '{C:attention}Scored {C:hearts}Heart {C:attention}Cards'
        }
    },

    config = { extra = { odds = 2, suit = 'Hearts', repetitions = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,

    rarity = 1,

    atlas = 'reddit_jokers',
    pos = { x = 5, y = 6 },

    cost = 4,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only and
		context.other_card:is_suit(card.ability.extra.suit) and
        pseudorandom('j_reddit_chaste_joker') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                message = 'Again!',
				message_card = card,
                repetitions = card.ability.extra.repetitions,
                card = context.other_card
            }
		end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('submiss1vefemb0y', false)
    end
}