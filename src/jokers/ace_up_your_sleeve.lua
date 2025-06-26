-- Ace up your Sleeve
SMODS.Joker {
    key = 'ace_up_your_sleeve',
    blueprint_compat = true,

    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    rarity = 3,

    atlas = 'reddit_jokers',
    pos = { x = 6, y = 4 },

    cost = 8,

    calculate = function(self, card, context)
		local edition = poll_edition('reddit_ace_up_your_sleeve', nil, true, true)--, editions)
        if context.first_hand_drawn then
            local _card = SMODS.create_card {
                set = "Base",
                seal = SMODS.poll_seal({ guaranteed = true, type_key = 'reddit_ace_up_your_sleeve' }),
                edition = edition,
                area = G.discard
            }

            bases = {
                G.P_CARDS["C_A"],
                G.P_CARDS["S_A"],
                G.P_CARDS["H_A"],
                G.P_CARDS["D_A"]
            }
            index = math.floor(pseudorandom('reddit_ace_up_your_sleeve') * #bases) + 1
            if index > #bases then
                index = #bases
            end
            _card:set_base(bases[index], true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:emplace(_card)
                    _card:start_materialize()
                    G.GAME.blind:debuff_card(_card)
                    G.hand:sort()
                    if context.blueprint_card then
                        context.blueprint_card:juice_up()
                    else
                        card:juice_up()
                    end
                    return true
                end
            }))
            SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
            return nil, true
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TheUn-Nottened', false)
    end
}