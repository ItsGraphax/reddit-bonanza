-- Charitable Joker
SMODS.Joker {
    key = 'charitable_joker',
    blueprint_compat = true,
    loc_txt = {
        name = 'Charitable Joker',
        text = {
            'Played cards with',
            '{C:diamonds}#1#{} suit give',
            '{C:chips}+#2#{} chips when scored'
        }
    },

    config = { extra = { suit = 'Diamonds', chips = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.suit, card.ability.extra.chips } }
    end,

    rarity = 1,

    atlas = 'reddit_jokers',
    pos = { x = 1, y = 7 },

    cost = 4,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and 
            context.other_card:is_suit(card.ability.extra.suit) 
        then
            return { chips = card.ability.extra.chips }
		end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('submiss1vefemb0y', false)
    end
}