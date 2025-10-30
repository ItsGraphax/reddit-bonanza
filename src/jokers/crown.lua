-- Crown
SMODS.Joker {
    key = 'crown',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {extra = {dollars = 25, hand = "Royal Flush", isCorrectHand = false}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars, card.ability.extra.hand}}
    end,

    rarity = 1,

    atlas = 'reddit_jokers',
    pos = {x = 12, y = 1},

    cost = 8,

    calculate = function(self, card, context)
        if context.evaluate_poker_hand then
            card.ability.extra.isCorrectHand = context.display_name == card.ability.extra.hand

        elseif context.joker_main and card.ability.extra.isCorrectHand then -- hacky workaround by n' since royal flush isn't actually a hand
            ease_dollars(to_big(card.ability.extra.dollars))
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Linkiostro', false)
        badges[#badges + 1] = credit_badge('TSAMarioYTReddit', true)
    end
}
