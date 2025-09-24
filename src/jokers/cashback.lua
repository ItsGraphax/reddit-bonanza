-- CashBack
SMODS.Joker {
    key = 'cashback',
    blueprint_compat = false,

    config = { extra = { gain = 1, sell_value = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain } }
    end,

    rarity = 1,

    atlas = 'reddit_jokers',
    pos = { x = 6, y = 2 },

    cost = 4,

    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then -- prevents it from resetting it's sell cost after no longer being debuffed
            card.ability.extra.sell_value = card.sell_cost
        end
    end,

    calculate = function(self, card, context)
        if context.buying_card or context.open_booster then
            card.ability.extra.sell_value = card.ability.extra.sell_value + card.ability.extra.gain
            card.sell_cost = card.ability.extra.sell_value
            return {
                message = 'CashBack!'
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', true)
    end
}