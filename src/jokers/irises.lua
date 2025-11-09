-- Irises
local function has_value(tab, val)
    for index, value in ipairs(tab) do if value == val then return true end end

    return false
end

SMODS.Joker {
    key = 'irises',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {extra = {xmult = 3, min_enhancements = 2}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult, card.ability.extra.min_enhancements
            }
        }
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = {x = 11, y = 1},

    cost = 7,

    calculate = function(self, card, context)
        if context.joker_main then
            local found_enhancements = {}
            for _, card in ipairs(context.full_hand) do
                if not has_value(found_enhancements, card.config.center.key) then
        			found_enhancements[#found_enhancements+1] = card.config.center.key
                end
            end

            if #found_enhancements > card.ability.extra.min_enhancements then -- we check for greater than here because no enhancement also counts as one
                return {xmult = card.ability.extra.xmult}
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Lawn_Mower_6639', false)
    end
}
