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
SMODS.Joker {
	key = 'nichola',
	blueprint_compat = false,
	loc_txt = {
		name = 'Nichola',
		text = {
			"Prevent the ante from",
            "going up",
            "{C:inactive}(Remaining: {C:attention}#1#{C:inactive} times)"
		}
	},

	config = { extra = { antes_left = 3 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.antes_left } }
	end,

	rarity = 4,
	
	atlas = 'reddit_jokers',
	pos = { x = 6, y = 5 },
    soul_pos = { x = 7, y = 5 },

	cost = 20,

	calculate = function(self, card, context)
        if context.nichola_block_ante and context.other_card == card then
            card.ability.extra.antes_left = card.ability.extra.antes_left - 1
            return { message = "Nope!" }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('USER', false)
	end
}
