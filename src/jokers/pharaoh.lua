-- Pharaoh
SMODS.Joker {
    key = 'pharaoh',
    blueprint_compat = true,

    config = { extra = { Xmult = 3, buffer = 25, increase = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.buffer, card.ability.extra.increase } }
    end,

    rarity = 3,

    atlas = 'reddit_jokers',
    pos = { x = 6, y = 1 },

    cost = 8,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.buffer = card.ability.extra.buffer + card.ability.extra.increase
            return {
                message = 'Increase!'
            }
        elseif context.joker_main then
            if to_big(G.GAME.dollars) >= card.ability.extra.buffer then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Omicra98', false)
    end
}