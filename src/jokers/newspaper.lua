SMODS.Joker {
    key = 'newspaper',
    blueprint_compat = true,

    atlas = 'reddit_jokers',
    pos = {
        x = 9,
        y = 2
    },

    rarity = 1,
    cost = 5,
    config = {
        extra = {
            h_size = 4,
            has_size = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.h_size}
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            G.hand:change_size(card.ability.extra.h_size)
            card.ability.extra.has_size = true
            return {
                message = '+4 Cards'
            }
        end
        if context.first_hand_drawn then
            card.ability.extra.has_size = false
            G.hand:change_size(-card.ability.extra.h_size)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.has_size then
            card.ability.extra.has_size = false
            G.hand:change_size(-card.ability.extra.h_size)
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Emoz_', false)
    end
}
