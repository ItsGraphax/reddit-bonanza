SMODS.Voucher {
    key = 'card_counting',
    loc_txt = {
        name = 'Card Counting',
        text = {
            'I like trains'
        }
    },
    config = { extra = {odds = 20 } },

    calculate = function(self, card, context)
        if context.card_added and
        pseudorandom('card_counting') < G.GAME.probabilities.normal / card.ability.extra.odds then
            local other_card = context.card
            if other_card and other_card.ability.set ~= 'Joker' then
                other_card:set_edition('e_negative')
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('submiss1vefemb0y', false)
    end
}

SMODS.Voucher { -- this thing is so filled with bugs that it might as well never see the light of day
    key = 'card_czar',
    loc_txt = {
        name = 'Card Czar',
        text = {
            'I like trains'
        }
    },

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
            local hand = context.consumeable.ability.hand_type
            local eff_card = context.blueprint_card or card
            -- This is a copy of how a planet card sets the text when upgrading a hand (just formatted better)
            update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = localize(hand, 'poker_hands'),
                chips = G.GAME.hands[hand].chips,
                mult = G.GAME.hands[hand].mult,
                level = G.GAME.hands[hand].level
            }
            )

            G.E_MANAGER:add_event(Event {
            func = function()
                eff_card:juice_up()
                return true
            end
            })

            level_up_hand(context.consumeable or eff_card, hand)

            update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' }
            )
        end
        if context.using_consumeable and context.consumeable.config.center.key == 'c_black_hole'then
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize('k_all_hands'),chips = '...', mult = '...', level=''})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                play_sound('tarot1')
                context.consumeable:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true end }))
            update_hand_text({delay = 0}, {mult = '+', StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                context.consumeable:juice_up(0.8, 0.5)
                return true end }))
            update_hand_text({delay = 0}, {chips = '+', StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                context.consumeable:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true end }))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})
            delay(1.3)
            for k, v in pairs(G.GAME.hands) do
                level_up_hand(context.consumeable, k, true)
            end
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        end
    end,

    redeem = function(self)
        G.GAME.card_czar = true
        G.GAME.ecto_minus = G.GAME.ecto_minus - 1
        SMODS.Consumable:take_ownership('c_magician', {
            discovered = G.P_CENTERS.c_magician.discovered,
            config = {mod_conv = 'm_lucky', max_highlighted = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_high_priestess', {
            discovered = G.P_CENTERS.c_high_priestess.discovered,
            config = {planets = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_empress', {
            discovered = G.P_CENTERS.c_empress.discovered,
            config = {mod_conv = 'm_mult', max_highlighted = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_emperor', {
            discovered = G.P_CENTERS.c_emperor.discovered,
            config = {tarots = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_heirophant', {
            discovered = G.P_CENTERS.c_heirophant.discovered,
            config = {mod_conv = 'm_bonus', max_highlighted = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_lovers', {
            discovered = G.P_CENTERS.c_lovers.discovered,
            config = {mod_conv = 'm_wild', max_highlighted = 2}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_chariot', {
            discovered = G.P_CENTERS.c_chariot.discovered,
            config = {mod_conv = 'm_steel', max_highlighted = 2}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_justice', {
            discovered = G.P_CENTERS.c_justice.discovered,
            config = {mod_conv = 'm_glass', max_highlighted = 2}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_hermit', {
            discovered = G.P_CENTERS.c_hermit.discovered,
            config = {extra = 21} -- Thank you ItsGraphax for your important contribution
            },
        true
        )
        SMODS.Consumable:take_ownership('c_wheel_of_fortune', {
            discovered = G.P_CENTERS.c_wheel_of_fortune.discovered,
            config = {extra = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_strength', {
            discovered = G.P_CENTERS.c_strength.discovered,
            config = {max_highlighted = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_hanged_man', {
            discovered = G.P_CENTERS.c_hanged_man.discovered,
            config = {max_highlighted = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_death', {
            discovered = G.P_CENTERS.c_death.discovered,
            config = {max_highlighted = 3}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_temperance', {
            discovered = G.P_CENTERS.c_temperance.discovered,
            config = {extra = 51} -- again
            },
        true
        )
        SMODS.Consumable:take_ownership('c_devil', {
            discovered = G.P_CENTERS.c_devil.discovered,
            config = {mod_conv = 'm_gold', max_highlighted = 2}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_tower', {
            discovered = G.P_CENTERS.c_tower.discovered,
            config = {mod_conv = 'm_stone', max_highlighted = 2}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_star', {
            discovered = G.P_CENTERS.c_star.discovered,
            config = {suit_conv = 'Diamonds', max_highlighted = 4}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_moon', {
            discovered = G.P_CENTERS.c_moon.discovered,
            config = {suit_conv = 'Clubs', max_highlighted = 4}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_sun', {
            discovered = G.P_CENTERS.c_sun.discovered,
            config = {suit_conv = 'Hearts', max_highlighted = 4}
            },
        true
        )
        SMODS.Consumable:take_ownership('c_world', {
            discovered = G.P_CENTERS.c_world.discovered,
            config = {suit_conv = 'Spades', max_highlighted = 4}
        },
        true
        )
        SMODS.Consumable:take_ownership('c_mercury', {
            discovered = G.P_CENTERS.c_mercury.discovered,
            freq = 2
        },
        true
        )

        SMODS.Consumable:take_ownership('c_familiar', {
            discovered = G.P_CENTERS.c_familiar.discovered,
            config = {remove_card = true, extra = 4} -- can't change destroyed amount
        },
        true
        )
        SMODS.Consumable:take_ownership('c_grim', {
            discovered = G.P_CENTERS.c_grim.discovered,
            config = {remove_card = true, extra = 3}
        },
        true
        )
        SMODS.Consumable:take_ownership('c_incantation', {
            discovered = G.P_CENTERS.c_incantation.discovered,
            config = {remove_card = true, extra = 5}
        },
        true
        )
        SMODS.Consumable:take_ownership('c_talisman', {
            discovered = G.P_CENTERS.c_talisman.discovered,
            config = {extra = 'Gold', max_highlighted = 2},

        },
        true
        )
        SMODS.Consumable:take_ownership('c_wraith', {
            discovered = G.P_CENTERS.c_wraith.discovered,
            config = {dollars = 1},

        },
        true
        )
        SMODS.Consumable:take_ownership('c_immolate', {
            discovered = G.P_CENTERS.c_immolate.discovered,
            config = {remove_card = true, extra = {destroy = 6, dollars = 21}}
        },
        true
        )
        SMODS.Consumable:take_ownership('c_deja_vu', {
            discovered = G.P_CENTERS.c_deja_vu.discovered,
            config = {extra = 'Red', max_highlighted = 2}
        },
        true
        )
        SMODS.Consumable:take_ownership('c_trance', {
            discovered = G.P_CENTERS.c_trance.discovered,
            config = {extra = 'Blue', max_highlighted = 2}
        },
        true
        )
        SMODS.Consumable:take_ownership('c_medium', {
            discovered = G.P_CENTERS.c_medium.discovered,
            config = {extra = 'Purple', max_highlighted = 2}
        },
        true
        )
        SMODS.Consumable:take_ownership('c_cryptid', {
            discovered = G.P_CENTERS.c_cryptid.discovered,
            config = {extra = 3, max_highlighted = 1}
        },
        true
        )
        SMODS.Consumable:take_ownership('c_black_hole', {
            discovered = G.P_CENTERS.c_black_hole.discovered,
            config = {levels = 2},

        },
        true
        )
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('submiss1vefemb0y', false)
    end
}