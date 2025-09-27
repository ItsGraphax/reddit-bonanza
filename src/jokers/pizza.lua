-- Pizza
SMODS.Joker {
    key = 'pizza',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {extra = {xmult = 4, xmult_mod = 1, ingredients = {"Pepperoni", "Salami", "Mozzarella", "Gorgonzola", "Tomato", "Pineapple", "Mushrooms", "Oregano"}}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult, card.ability.extra.xmult_mod}}
    end,

    rarity = 2,

    atlas = 'reddit_jokers',
    pos = {x = 12, y = 2},

    cost = 6,

    calculate = function(self, card, context)
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        elseif context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.xmult = card.ability.extra.xmult -
                                           card.ability.extra.xmult_mod

            if card.ability.extra.xmult <= 1 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = 'Eaten!'
                }
            end

            i = math.random(#card.ability.extra.ingredients)
            iv = card.ability.extra.ingredients[i]
            table.remove(card.ability.extra.ingredients, i)
            return {
                message = iv..'!'
            }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = credit_badge('AlastorFan666666', false)
    end
}
