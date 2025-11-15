-- Rover
SMODS.Joker {
    key = 'rover',
    blueprint_compat = true,
    perishable_compat = false,

    config = { extra = { gain = 1, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_stone']
        return { vars = { card.ability.extra.gain, card.ability.extra.mult } }
    end,

    rarity = 1,

    atlas = 'reddit_jokers',
    pos = { x = 7, y = 2 },

    cost = 4,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        elseif context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                return {
                    message = 'Upgrade!',
                    message_card = card
                }
            end
        end
    end,
    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_stone'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Omicra98', false)
    end
}
