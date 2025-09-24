-- Sisyphean Task
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

SMODS.Joker {
    key = 'sisyphean_task',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    config = {extra = {xmult_mod = 0.2, xmult = 1, trigger_hands = {"High Card", "Pair"}}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult_mod, card.ability.extra.xmult}}
    end,

    rarity = 3,

    atlas = 'reddit_jokers',
    pos = {x = 0, y = 0},

    cost = 8,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.play and not context.blueprint then
            -- Check reset
            if has_value(card.ability.extra.trigger_hands, context.scoring_name) and card.ability.extra.xmult > 1 then
                card.ability.extra.xmult = 1

                return {
                    message = localize("k_reset")
                }
            end

            -- Check scale
            local scale = false
            for _, playing_card in ipairs(context.full_hand) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then
                    scale = true
                    break
                end
            end

            if scale then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                return {
                    message = localize("k_up")
                }
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('The_Wall_The_Wall', false)
    end
}
