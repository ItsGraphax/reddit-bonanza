-- Nichola
local og_ease_ante = ease_ante
function ease_ante(mod)
    if mod > 0 then
        for idx, nic in pairs(SMODS.find_card('j_reddit_nichola')) do
            if nic.ability.extra.antes_left > 0 then
                -- use a context here so it counts as a trigger (for social media nad birbal)
                SMODS.calculate_context({ nichola_block_ante = true, other_card = nic })
                return
            end
        end
    end

    og_ease_ante(mod)
end

get_loc = function(card)
	if card.ability.extra.antes_left == 1 then
		return localize('a_times_singular')
	else
		return localize('a_times_plural')
	end
end

SMODS.Joker {
	key = 'nichola',
	blueprint_compat = false,
    perishable_compat = false,
	
	config = { extra = { antes_left = 3 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.antes_left, get_loc(card) } }
	end,

	rarity = 4,
	
	atlas = 'reddit_jokers',
	pos = { x = 6, y = 5 },
    soul_pos = { x = 7, y = 5 },

	cost = 20,

	calculate = function(self, card, context)
        if context.nichola_block_ante and context.other_card == card then
            card.ability.extra.antes_left = card.ability.extra.antes_left - 1
            if card.ability.extra.antes_left <= 0 then
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
                    message = localize('k_empty_ex'),
                    colour = G.C.FILTER
                }
            end

            return { message = localize('k_nope_ex') }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Ryan_Luna', false)
	end
}
