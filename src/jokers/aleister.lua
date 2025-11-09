-- Aleister
SMODS.Joker {
    key = 'aleister',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {extra = {card = 10}},
    loc_vars = function(self, info_queue, card) return {vars = {}} end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = {x = 14, y = 2},

    cost = 7,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:get_id() == 11 then
                    scored_card:set_seal(SMODS.poll_seal({
                        guaranteed = true,
                        type_key = 'reddit_aleister'
                    }))
                    scored_card:set_ability(
                        poll_edition('reddit_aleister', nil, true, true), nil,
                        true)
                end
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('JustTryHard_inc', false)
    end
}
