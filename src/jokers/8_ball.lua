--  8 Ball
SMODS.Joker:take_ownership('8_ball', {

    name = 'reddit_8_ball',
    config = { extra = { spectral_odds = 8, spectral_base = 1, tarot_planet_odds = 8, tarot_planet_base = 3 } },

    loc_txt = {
        name = 'Magic 8 Ball',
        text = {
            'Each scored {C:attention}8{} has a',
            '{C:green}#1# in #2#{} chance to create a',
            '{C:spectral}Spectral{} Card and a',
            '{C:green}#3# in #4#{} chance to create a',
            '{C:tarot}Tarot{} or {C:planet}Planet{} card',
            '{C:inactive}(Must have room){}'
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.spectral_base, card.ability.extra.spectral_odds, card.ability.extra
            .tarot_planet_base, card.ability.extra.tarot_planet_odds }
        }
    end,

    atlas = 'reddit_jokers',
    pos = { x = 6, y = 0 },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if (context.other_card:get_id() == 8) then
                -- spectral
                if SMODS.pseudorandom_probability(card, 'j_reddit_8-ball', card.ability.extra.spectral_base, card.ability.extra.spectral_odds) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        extra = {
                            message = 'Spectral',
                            message_card = card,
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = (function()
                                        SMODS.add_card {
                                            set = 'Spectral',
                                            key_append = 'reddit_8_ball'
                                        }
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end)
                                }))
                            end
                        },

                    }
                end

                -- planetarot
                if SMODS.pseudorandom_probability(card, 'j_reddit_8-ball', card.ability.extra.tarot_planet_base, card.ability.extra.tarot_planet_odds) and
                    #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

                    local set = 'Tarot'
                    if pseudorandom('reddit_8_ball_decide_planot-tarot') < 0.5 then
                        set = 'Planet'
                    end

                    return {
                        extra = {
                            message = localize('k_plus_tarot'),
                            message_card = card,
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = (function()
                                        SMODS.add_card {
                                            set = 'Tarot',
                                            key_append = 'reddit_8_ball'
                                        }
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end)
                                }))
                            end
                        },
                    }
                end
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('TheBardicToast', false)
        badges[#badges + 1] = credit_badge('TSAMarioYTReddit', true)
    end
}
)
