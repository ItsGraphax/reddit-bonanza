-- Legally Distinct
SMODS.Joker {
    key = 'legally_distinct',
    blueprint_compat = true,
    loc_txt = {
        name = 'Legally Distinct',
        text = {
            'All played {C:attention}Face Cards{}',
'turn into {C:attention}Steel Cards{}',
'when scored'
        }
    },

    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    rarity = 3,

    atlas = 'reddit_jokers',
    pos = { x = 1, y = 3 },

    cost = 8,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    faces = faces + 1
                    scored_card:set_ability('m_steel', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if faces > 0 then
                return {
                    message = 'Steel!',
                    colour = G.C.MONEY
                }
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Princemerkimer', false)
    end
}
