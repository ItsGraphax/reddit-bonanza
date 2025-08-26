-- Glass House
SMODS.Joker {
	key = 'glass_house',
	blueprint_compat = false,
	
	config = { extra = { enhancement = 'm_glass', poker_hand = 'Full House' } },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS['m_glass']
		return { vars = {localize(card.ability.extra.poker_hand, 'poker_hands')} }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 3, y = 2 },
	cost = 6,
	calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and
		next(context.poker_hands['Full House']) then
			for i, scored_card in ipairs(context.scoring_hand) do
				if i == #context.scoring_hand then

					scored_card:set_ability('m_glass', nil, true)
					G.E_MANAGER:add_event(Event({
						func = function()
							scored_card:juice_up()
							return true
						end
					}))
				end
			end

			return {
				message = 'Glass!',
				colour = G.C.MONEY
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
        badges[#badges+1] = create_badge('art by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR_ALT, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}