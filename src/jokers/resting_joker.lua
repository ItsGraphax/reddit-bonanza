-- JOKER NAME
SMODS.Joker {
	key = 'resting_joker',
	blueprint_compat = true,
	perishable_compat = false, -- false if is a scaling joker, except retroactive scaling

	config = { extra = {chips_gain = 7, chips = 0} },
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.chips_gain, card.ability.extra.chips} }
	end,

	rarity = 1, -- 1 for common through 4 for legendary
	
	atlas = 'reddit_jokers',
	pos = { x = 11, y = 4 },

	cost = 5,

	calculate = function(self, card, context)
    if context.before and not context.blueprint then
			print('checking for unscored cards')
			for _, v in ipairs(context.full_hand) do
				if not SMODS.in_scoring(v, context.scoring_hand) then
					if v:get_id() == 7 then
						card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
						return {
							message = localize('k_upgrade_ex')
						}
					end
				end
			end
		end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end,

	set_badges = function(self, card, badges)
		badges[#badges+1] = credit_badge('Deitiessoul', false)
	end
}
