-- Butter Fingers
SMODS.Joker {
    key = 'butter_fingers',
    blueprint_compat = true,

    config = { extra = { mult_mod = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_mod } }
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = { x = 9, y = 0 },

    cost = 6,

    calculate = function(self, card, context)
        if context.discard then
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Omicra98', false)
    end
}
