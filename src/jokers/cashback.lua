-- CashBack
SMODS.Joker {
    key = 'cashback',
    blueprint_compat = false,

    config = { extra = { gain = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain } }
    end,

    rarity = 1,

    atlas = 'reddit_jokers',
    pos = { x = 6, y = 2 },

    cost = 4,

    calculate = function(self, card, context)
        if context.buying_card then
            card.sell_cost = card.sell_cost + card.ability.extra.gain
            return {
                message = 'CashBack!'
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}