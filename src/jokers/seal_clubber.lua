-- Seal Clubber
SMODS.Joker {
	key = 'seal_clubber',
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,

	config = { extra = { xmult_mod = 0.25, xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 11, y = 2 },

	cost = 6,

	calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        elseif context.before then
            local upgraded = false
            for _, playing_card in ipairs(context.full_hand) do
                if playing_card.seal then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            playing_card:set_seal(nil)
                            playing_card:juice_up()
                            return true
                        end
                    }))
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                    upgraded = true
                end
            end
            if upgraded then
                return {
                    message = "Upgrade!"
                }
            end
        end
	end,

	set_badges = function(self, card, badges)
		badges[#badges+1] = credit_badge('neon121', false)
	end
}
