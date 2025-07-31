-- Kleptomaniac
SMODS.Joker {
    key = "j_reddit_kleptomaniac",
	
	config = { extra = { odds = 10, owed = 0 } },
	loc_vars = function(self, info_queue, card)
		local num, denum = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
		return { vars = { num, denum, card.ability.extra.owed}}
	end,

    unlocked = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 4,
	atlas = 'reddit_jokers',
    pos = { x = 1, y = 0 },
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
    end,
	calculate = function(self, card, context)
		-- On Pay
        if context.buying_card or context.open_booster then
			-- Check if Caught
			if SMODS.pseudorandom_probability(card, 'j_reddit_kleptomaniac', 1, card.ability.extra.odds)
			and context.card.cost >= 1 then
				local money = -card.ability.extra.owed
				card.ability.extra.owed = 0

				return {
					message = 'Caught!',
					dollars = money
				}
			end

			-- Owed Money
			card.ability.extra.owed = card.ability.extra.owed + context.card.cost
            return {
				dollars = context.card.cost
            }

        end

		if context.selling_self then
			local partial_cost = - math.floor(card.ability.extra.owed / 3)
			ease_dollars(partial_cost)
			return {
				message = 'Escaped!'
			}
		end

    end
}