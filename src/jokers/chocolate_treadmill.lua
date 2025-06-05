-- Chocolate Treadmill
get_hand_loc = function(card)
	if card.ability.extra.hands == 1 then
		return "hand"
	else
		return "hands"
	end
end

SMODS.Joker {
	key = 'chocolate_treadmill',
	blueprint_compat = true,
	loc_txt = {
		name = 'Chocolate Treadmill',
		text = {
			"Joker gains {C:attention}+1 hand{} and",
			"loses {X:chips,C:white}X#5#{} chips if played",
			"hand contains a {C:attention}straight{}, else",
			"gains {X:chips,C:white}X#4#{} chips.",
			"{C:inactive}(Curently {C:attention}#1# #2#{C:inactive} and {C:chips}+#3# Chips{C:inactive})"
		}
	},

	config = { extra = { chips = 500, hands = 2, good_mult = 2, bad_mult = 0.5 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.hands,  get_hand_loc(card), card.ability.extra.chips, card.ability.extra.good_mult, card.ability.extra.bad_mult } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 0 },
	cost = COST,
	calculate = function(self, card, context)
        if context.joker_main then

			return {
				chips = card.ability.extra.chips
			}
		end
		if context.after and context.main_eval and not context.blueprint then
			if next(context.poker_hands['Straight']) then
				card.ability.extra.chips = math.floor(card.ability.extra.chips * card.ability.extra.bad_mult)
				card.ability.extra.hands = card.ability.extra.hands + 1
				return {
					message = tostring(card.ability.extra.chips),
					colour = G.C.CHIPS
				}
			else
				card.ability.extra.chips = card.ability.extra.chips * card.ability.extra.good_mult
				card.ability.extra.hands = card.ability.extra.hands - 1

				if card.ability.extra.hands <= 0 then
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
									card:remove()
									return true
								end
							}))
							return true
						end
					}))
					return {
						message = 'Exhausted!',
						colour = G.C.CHIPS
					}
				else
					return {
						message = tostring(card.ability.extra.chips),
						colour = G.C.CHIPS
					}
				end

			end
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/jah2277', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}
