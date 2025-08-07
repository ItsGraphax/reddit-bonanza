-- Up The Sleeve
local calc_aces = function()
    local cards = {}
    if G.deck then
        cards = G.deck.cards
    end

    local aces = 0
    for _, card in ipairs(cards) do
        if card:get_id() == 14 then
            aces = aces + 1
        end
    end
    return aces
end

SMODS.Joker {
    key = 'up_the_sleeve',
    blueprint_compat = true,

    config = { extra = { xmult = 0.25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 1 + calc_aces() * card.ability.extra.xmult } }
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = { x = 10, y = 0 },

    cost = 6,

    calculate = function(self, card, context)
        if context.joker_main then
            local xmult = 1 + calc_aces() * card.ability.extra.xmult
            return {
                xmult = xmult
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Omegza', false)
        badges[#badges + 1] = credit_badge('TheBardicToast', true)
        badges[#badges + 1] = credit_badge('ItsGraphaxYT', true)
    end
}
