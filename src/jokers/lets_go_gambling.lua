-- Let's go Gambling!
SMODS.Joker {
    key = 'lets_go_gambling',
    blueprint_compat = true,
    loc_txt = {
        name = 'Let\'s go Gambling!',
        text = {
            'Creates a {C:purple}Wheel of Fortune',
        'at the end of',
        'every round'
        }
    },

    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = { x = 7, y = 4 },

    cost = 6,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = SMODS.add_card {
                        set = 'Tarot',
                        key_append = 'reddit_lets_go_gambling'
                    }:set_ability('c_wheel_of_fortune')
                    return true
                end
            }))
            return {
                message = localize('k_plus_tarot'),
                colour = G.C.PURPLE,
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('chikinguny', false)
    end
}