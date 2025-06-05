-- Glass House
SMODS.Joker {
	key = 'glass_house',
	blueprint_compat = true,
	loc_txt = {
		name = 'Glass House',
		text = {
			"Enhances last played card",
			"into a {C:attention}Glass Card{} if",
			"played hand contains a {C:attention}Full House{}"
		}
	},

	config = { extra = { enhancement = 'm_glass' } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
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
        badges[#badges+1] = create_badge('by u/WarmTranslator6633', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
        badges[#badges+1] = create_badge('art by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR_ALT, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}