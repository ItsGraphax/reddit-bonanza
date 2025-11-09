-- PNG of a grenade
SMODS.Joker {
    key = 'grenade_png',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    config = {extra = {card_req = 5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.card_req}}
    end,

    rarity = 1,

    atlas = 'reddit_jokers',
    pos = {x = 15, y = 2},

    cost = 5,

    calculate = function(self, card, context)
        if context.before and #context.full_hand == card.ability.extra.card_req then
            SMODS.destroy_cards(context.full_hand)
            card.getting_sliced = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true
                end
            }))
            return {
                message = "Boom!"
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('JustTryHard_inc', false)
    end
}
