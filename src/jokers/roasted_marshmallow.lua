-- Roasted Marshmallow
SMODS.Joker {
    key = 'roasted_marshmallow',
    blueprint_compat = true,

    config = { extra = { xmult = 3, rand_low = 1, rand_max = 3, old_chips = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.rand_low, card.ability.extra.rand_max } }
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = { x = 12, y = 0 },

    cost = 6,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.old_chips = to_number(G.GAME.chips)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        elseif context.before and not context.blueprint then
            print('before')
            card.ability.extra.old_chips = to_number(G.GAME.chips)
        elseif context.after and context.main_eval then
            print(to_number(G.GAME.chips))
            print(card.ability.extra.old_chips)
            if to_number(G.GAME.chips)-card.ability.extra.old_chips >= to_number(G.GAME.blind.chips) then
                card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        return true
                    end
                }))
                return {
                    message = 'Burnt!',
                    colour = G.C.RED,
                    no_juice = true
                }
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Karl_Lives', false)
    end
}
