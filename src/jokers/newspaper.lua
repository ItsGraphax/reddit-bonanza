SMODS.Joker {
    key = 'newspaper',
    blueprint_compat = true,

    atlas = 'reddit_jokers',
    pos = {x = 9, y = 2},

    rarity = 1,
    cost = 5,
    config = {extra = {h_size = 4}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.h_size}}
    end,

    calculate = function(self, card, context)
        if context.drawing_cards and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
            return {
                message = '+4 Cards',
                cards_to_draw = G.hand.config.card_limit + card.ability.extra.h_size
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Emoz_', false)
    end
}
