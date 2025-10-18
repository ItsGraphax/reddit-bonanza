-- Ping Pong
SMODS.Joker {
    key = 'ping_pong',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {extra = {max_jokers = 3, repetitions = 1}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.max_jokers}}
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = {x = 13, y = 2},

    cost = 7,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and
            not context.repetition_only and #G.jokers.cards <=
            card.ability.extra.max_jokers then
            return {repetitions = card.ability.extra.repetitions, message_card = card, card = context.other_card, message = "Again!"}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Lawn_Mower_6639', false)
    end
}
