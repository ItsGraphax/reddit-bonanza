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
            for _, card in ipairs(context.scoring_hand) do
                if card:get_id() == 11 then

                    card:set_seal(SMODS.poll_seal({ -- add seal
                        key = 'reddit_aleister',
                        guaranteed = true
                    }))

                    card:set_edition( -- add edition
                    SMODS.poll_edition({
                        key = "reddit_aleister",
                        no_negative = true,
                        guaranteed = true
                    }), true)

                    card:set_ability( -- add enhancement
                    SMODS.poll_enhancement({
                        key = "reddit_aleister",
                        guaranteed = true
                    }), true)

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))

                end
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('JustTryHard_inc', false)
    end
}
