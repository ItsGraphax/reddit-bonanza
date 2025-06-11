SMODS.Voucher {
    key = 'card_counting',
    loc_txt = {
        name = 'Card Counting',
        text = {
            'I like trains'
        }
    },
    config = { extra = { normal = 1, odds = 20 } },

    calculate = function(self, card, context)
        if context.card_added and
        pseudorandom('v_reddit_card_counting') < card.ability.extra.normal / card.ability.extra.odds then
            local other_card = context.card
            if other_card and
            ( other_card.ability.set == 'Planet' or
            other_card.ability.set == 'Tarot' or
            other_card.ability.set == 'Spectral' ) then
                other_card:set_edition('e_negative')
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('submiss1vefemb0y', false)
    end
}