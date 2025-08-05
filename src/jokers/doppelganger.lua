-- Doppelganger
SMODS.Joker {
    key = 'doppelganger',
    blueprint_compat = true,

    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = { x = 13, y = 0 },

    cost = 4,

    calculate = function(self, card, context)
        if context.after
            and to_big(G.GAME.chips)+(hand_chips*mult) >= to_big(G.GAME.blind.chips) * 2 then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local copy_card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
            copy_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, copy_card)
            G.hand:emplace(copy_card)
            copy_card.states.visible = nil

            G.E_MANAGER:add_event(Event({
                func = function()
                    copy_card:start_materialize()
                    return true
                end
            }))
            return {
                message = localize('k_copied_ex'),
                colour = G.C.CHIPS,
                func = function() -- This is for timing purposes, it runs after the message
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
                            return true
                        end
                    }))
                end
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('Thomassaurus', false)
        badges[#badges + 1] = credit_badge('TSAMarioYTReddit', false)
    end
}
