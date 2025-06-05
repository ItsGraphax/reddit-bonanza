CREDIT_TEXT_BG_COLOR = G.C.RED
CREDIT_TEXT_BG_COLOR_ALT = G.C.PURPLE
CREDIT_TEXT_COLOR = G.C.WHITE
CREDIT_TEXT_SIZE = 0.6

-- Feelin' lucky
SMODS.Joker {
	key = 'feelin_lucky',
	blueprint_compat = true,
	loc_txt = {
		name = 'Feelin\' Lucky',
		text = {
			"{C:green}#1# in #2#{} Chance to",
			"retrigger {C:attention}Lucky{}",
            "{C:clubs}#3#{} {C:attention}Cards{} thrice"
		}
	},

	config = { extra = { repetitions = 3, suit = 'Clubs', odds = 3 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, localize(card.ability.extra.suit, 'suits_singular') } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 0 },
	cost = 4,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only and
			context.other_card:is_suit(card.ability.extra.suit) and SMODS.has_enhancement(context.other_card, 'm_lucky') and 
            pseudorandom('j_reddit_feelin_lucky') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                message = 'Again!',
				message_card = card,
                repetitions = card.ability.extra.repetitions,
                card = context.other_card
            }
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Kleptomaniac
SMODS.Joker {
    key = "j_reddit_kleptomaniac",
	loc_txt = {
		name = 'Kleptomaniac',
		text = {
			"Refund all {C:attention}Items{} bought",
			"in the {C:attention}Shop{}",
            "{C:green} #1# in #2#{} Chance to deduct",
            "all money owed, on buying",
			"{C:inactive}Deducts 30% of owed money on sell{}",
            "{C:inactive}(Currently {C:money}#3#${C:inactive}){}"
		}
	},

	config = { extra = { odds = 10, owed = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.owed}}
	end,

    unlocked = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 4,
	atlas = 'reddit_jokers',
    pos = { x = 1, y = 0 },
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/WarmTranslator6633', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end,
	calculate = function(self, card, context)
		-- On Pay
        if context.buying_card or context.open_booster then
			-- Check if Caught
			if pseudorandom('j_reddit_kleptomaniac') < G.GAME.probabilities.normal / card.ability.extra.odds and context.card.cost >= 1 then
				money = -card.ability.extra.owed
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

-- Slothful Joker
SMODS.Joker {
	key = 'slothful',
	blueprint_compat = true,
	loc_txt = {
		name = 'Slothful Joker',
		text = {
			"Scored {C:attention}Stone Cards{}",
			"give {C:mult}+#1#{} Mult"
		}
	},

	config = { extra = { mult = 5 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 3, y = 0 },
	cost = 4,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_stone') then
				return {
					mult_mod = card.ability.extra.mult,
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
				}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/NeoShard1', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Rainbow Joker
SMODS.Joker {
	key = 'rainbow',
	blueprint_compat = true,
	loc_txt = {
		name = 'Rainbow Joker',
		text = {
			"Gives {X:mult,C:white}X1{} mult",
			"per unique {C:attention}suit{}",
			"in played hand"
		}
	},

	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 4, y = 0 },
	cost = 6,
	calculate = function(self, card, context)
        if context.joker_main then
			local suits = {
				Hearts = false,
				Diamonds = false,
				Spades = false,
				Clubs = false
			}

			for i = 1, #context.scoring_hand do
				local card = context.scoring_hand[i]
				local check_modded = not SMODS.has_any_suit(card)

				if not suits.Hearts and card:is_suit("Hearts", check_modded) then
					suits.Hearts = true
				elseif not suits.Diamonds and card:is_suit("Diamonds", check_modded) then
					suits.Diamonds = true
				elseif not suits.Spades and card:is_suit("Spades", check_modded) then
					suits.Spades = true
				elseif not suits.Clubs and card:is_suit("Clubs", check_modded) then
					suits.Clubs = true
				end
			end

			local count = 0
			if suits.Hearts then count = count + 1 end
			if suits.Diamonds then count = count + 1 end
			if suits.Spades then count = count + 1 end
			if suits.Clubs then count = count + 1 end

			return {
				xmult = count
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/NeoShard1', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

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

-- Touchdown
SMODS.Joker {
	key = 'touchdown',
	blueprint_compat = true,
	loc_txt = {
		name = 'Touchdown',
		text = {
			"Gains {C:mult}+#1#{} mult",
			"once playing cards",
			"scores exeed {C:attention}#2#{}",
			"{C:inactive}(Currently {C:mult}+#3#{C:inactive} mult)",
			"{C:inactive}(Current total: {C:attention}#4#{C:inactive})"
		}
	},

	config = { extra = { mult = 0, total_chips = 0, mult_mod = 7, total_limit = 100 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.total_limit, card.ability.extra.mult, card.ability.extra.total_chips } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 1 },
	cost = 6,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
			card.ability.extra.total_chips = card.ability.extra.total_chips + context.other_card:get_chip_bonus()
			if card.ability.extra.total_chips >= card.ability.extra.total_limit then
				card.ability.extra.total_chips = card.ability.extra.total_chips - card.ability.extra.total_limit
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
				return {
					message = "Upgrade!",
					colour = G.C.MULT,
					message_card = card
				}
			else
				return {
					message = tostring(card.ability.extra.total_chips),
					message_card = card
				}
			end
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/WarmTranslator6633', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Haunted House
SMODS.Joker {
	key = 'haunted_house',
	blueprint_compat = true,
	loc_txt = {
		name = 'Haunted House',
		text = {
			"{C:green}#1# in #2#{} chance to create",
			"a {C:blue}Spectral Card{} when the",
			"played hand contains a {C:attention}#3#{}"
		}
	},

	config = { extra = { odds = 4, poker_hand = 'Full House' } },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.poker_hand } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 1 },
	cost = 8,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.poker_hand]) and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and
			pseudorandom('j_reddit_haunted_house') < G.GAME.probabilities.normal / card.ability.extra.odds then

            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.add_card {
                        set = 'Spectral',
                        key_append = 'j_reddit_haunted_house' -- Optional, useful for checking the source of the creation in `in_pool`.
                    }
                    G.GAME.consumeable_buffer = 0
                    return true
                end)
            }))
            return {
                message = localize('k_plus_spectral'),
                colour = G.C.SECONDARY_SET.Spectral
			}
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/Ulik', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Jimbo's Loss
SMODS.Joker {
	key = 'jimbos_loss',
	blueprint_compat = true,
	loc_txt = {
		name = 'Jimbo\'s Loss',
		text = {
			"Gains {X:mult,C:white}X#1#{} mult when",
			"{C:attention}#2#{} or more {C:attention}face cards{}",
			"get discarded",
			"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} mult)"
		}
	},

	config = { extra = { faces = 3, mult_mod = 0.2, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.faces, card.ability.extra.Xmult } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 3, y = 1 },
	cost = 6,
    calculate = function(self, card, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            local face_cards = 0
            for _, discarded_card in ipairs(context.full_hand) do
                if discarded_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards >= card.ability.extra.faces then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.mult_mod
				return {
					message = 'X'..tostring(card.ability.extra.Xmult),
					colour = G.C.MULT
				}
            end
        end
		if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/aTOMic_Games', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Trippy Joker
SMODS.Joker {
	key = 'trippy',
	blueprint_compat = true,
	loc_txt = {
		name = 'Trippy Joker',
		text = {
			"Gains {X:mult,C:white}X#1#{} mult",
			"if played hand is {C:attention}#2#{},",
			"else lose {X:mult,C:white}X#1#{} mult",
			"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} mult)"
		}
	},

	config = { extra = { Xmult = 1, mult_mod = 0.2, hand = 'High Card' } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.hand, card.ability.extra.Xmult } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 4, y = 1 },
	cost = 4,
	calculate = function(self, card, context)
        if context.joker_main then
			if context.scoring_name == card.ability.extra.hand then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.mult_mod
			else
				card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.mult_mod
			end

			return {
				Xmult = card.ability.extra.Xmult
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/WarmTranslator6633', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Enigma
SMODS.Joker {
	key = 'enigma',
	blueprint_compat = true,
	loc_txt = {
		name = 'Enigma',
		text = {
			"{C:green}#1# in #2#{} chance to create",
			"a {C:blue}Negative Spectral{}",
			"card when you use a",
			"{C:attention}Tarrot {}or {C:attention}Planet{} card"
		}
	},

	config = { extra = { odds = 5 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 1 },
	cost = 8,
	calculate = function(self, card, context)
        if context.using_consumeable then
			if pseudorandom('j_reddit_enigma') < G.GAME.probabilities.normal / card.ability.extra.odds then
				if context.consumeable.ability.set == 'Planet' or context.consumeable.ability.set == 'Tarot' then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = (function()
							SMODS.add_card {
								set = 'Spectral',
								key_append = 'j_reddit_enigma' -- Optional, useful for checking the source of the creation in `in_pool`.
							}:set_edition('e_negative')
							G.GAME.consumeable_buffer = 0
							return true
						end)
					}))
					return {
						message = localize('k_plus_spectral'),
						colour = G.C.SECONDARY_SET.Spectral
					}
				end
        	end
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- M.A.D.
win_blind = function()
	if G.STATE ~= G.STATES.SELECTING_HAND then
		return
	end
	G.GAME.chips = G.GAME.blind.chips
	G.STATE = G.STATES.HAND_PLAYED
	G.STATE_COMPLETE = true
	end_round()
end

SMODS.Joker {
	key = 'mad',
	blueprint_compat = true,
	loc_txt = {
		name = 'M.A.D.',
		text = {
			"Sell this Joker to defeat",
			"{C.attention}this Blind{}, Increase",
			"{C:attention}Ante{} by {C:attention}+1{} and set",
			"money to {C:money}0{}"
		}
	},

	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 2 },
	cost = 15,
	calculate = function(self, card, context)
        if context.selling_self then
			return {
				func = function ()
					G.GAME.round_resets.ante = G.GAME.round_resets.ante + 1
					win_blind()
					ease_dollars(-G.GAME.dollars)
				end
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Sinister Joker
amount_of_jokers = function (card, mm)
	if not G.jokers then
		return '?'
	end

	for i=1, #G.jokers.cards do
		if G.jokers.cards[i] == card then
			return ( #G.jokers.cards - i ) * mm + 1
		end
	end

	return 0
end

SMODS.Joker {
	key = 'sinister_joker',
	blueprint_compat = true,
	loc_txt = {
		name = 'Sinister Joker',
		text = {
			"Gives {X:mult,C:white}X#1#{} mult",
			"for every Joker to the right",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} mult)"
		}
	},

	config = { extra = { mult_mod = 0.5 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod,  amount_of_jokers(card, card.ability.extra.mult_mod)} }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 1, y = 1 },
	cost = 5,
	calculate = function(self, card, context)
        if context.joker_main then
			return {
				Xmult = amount_of_jokers(card, card.ability.extra.mult_mod)
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/knockoutn336', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Medusa
SMODS.Joker {
	key = 'medusa',
	blueprint_compat = true,
	loc_txt = {
		name = 'Medusa',
		text = {
			"All scored {C:attention}face{} cards",
			"turn into {C:attention}stone{} cards"
		}
	},

	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 1, y = 2 },
	cost = COST,
	calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    faces = faces + 1
                    scored_card:set_ability('m_stone', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if faces > 0 then
                return {
                    message = 'Stone!',
                    colour = G.C.MONEY
                }
            end
        end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/PerfectAstronaut5998', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
		badges[#badges+1] = create_badge('art by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR_ALT, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Engagement Ring
SMODS.Joker {
	key = 'engagement_ring',
	blueprint_compat = true,
	loc_txt = {
		name = 'Engagement Ring',
		text = {
			"Retriggers all scored",
			"{C:diamonds}#1#{}"
		}
	},

	config = { extra = { suit = 'Diamonds', repetitions = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.suit } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 2 },
	cost = 4,
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only and
		context.other_card:is_suit(card.ability.extra.suit) then
			return {
				message = 'Again!',
				repetitions = card.ability.extra.repetitions,
				message_card = card,
				card = context.other_card
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/LittlePetiteGirl', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

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

-- All In
SMODS.Joker {
	key = 'all_in',
	blueprint_compat = true,
	loc_txt = {
		name = 'All In',
		text = {
			"Gives {X:mult,C:white}X#1#{} mult",
			"Lose all your money when",
			"{C:attention}Blind{} is selected"
		}
	},

	config = { extra = { Xmult = 5 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 4, y = 2 },
	cost = 6,
	calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and
		G.GAME.dollars > 0 then
			ease_dollars(- G.GAME.dollars)
			return {
				message = "All in!"
			}
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.Xmult
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/Kyuuseishu_', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Blank Joker
SMODS.Joker {
	key = 'blank_joker',
	blueprint_compat = true,
	loc_txt = {
		name = 'Blank Joker',
		text = {
			"Sell this card after beating",
			"{C:attention}#1#{} Boss Blinds",
			"to create an extra {C:attention}Joker Slot{}",
			"{C:inactive}(Currently {C:attention}#2#{C:inactive}/{C:attention}#1#{C:inactive})"
		}
	},

	config = { extra = { total_bosses = 2, current_bosses = 0, blind = false } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.total_bosses, card.ability.extra.current_bosses } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 2 },
	cost = 8,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			card.ability.extra.blind = context.blind.boss
		end

        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint and
		card.ability.extra.blind then
			card.ability.extra.current_bosses = card.ability.extra.current_bosses + 1
			return {
				message = "Boss Beaten!"
			}
		end

		if context.selling_self and
		card.ability.extra.current_bosses >= card.ability.extra.total_bosses then
			G.jokers:change_size(1)
			return {
				message = "+1 Slot!"
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/WarmTranslator6633', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Diamond Pickaxe 
SMODS.Joker {
	key = 'diamond_pickaxe',
	blueprint_compat = true,
	loc_txt = {
		name = 'Diamond Pickaxe',
		text = {
			"{C:green}#1# in #2#{} chance to",
			"give {C:money}$#3#{} when discarding any",
			"{C:attention}Enhanced Card{}"
		}
	},

	config = { extra = { odds = 16, money = 15 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.money } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 3 },

	cost = 6,

	calculate = function(self, card, context)
        if context.discard and
		next(SMODS.get_enhancements(context.other_card)) and
		pseudorandom('j_reddit_diamond_pickaxe') < G.GAME.probabilities.normal / card.ability.extra.odds then
			return {
				dollars = card.ability.extra.odds
			}
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Legally Distinct
SMODS.Joker {
    key = 'legally_distinct',
    blueprint_compat = true,
    loc_txt = {
        name = 'Legally Distinct',
        text = {
            'All played {C:attention}Face Cards{}',
'turn into {C:attention}Steel Cards{}',
'when scored'
        }
    },

    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    rarity = 3,

    atlas = 'reddit_jokers',
    pos = { x = 1, y = 3 },

    cost = 8,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    faces = faces + 1
                    scored_card:set_ability('m_steel', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if faces > 0 then
                return {
                    message = 'Steel!',
                    colour = G.C.MONEY
                }
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/Princemerkimer', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Bingo

tablelength = function (T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

SMODS.Joker {
    key = 'bingo',
    blueprint_compat = false,
    loc_txt = {
        name = 'Bingo!',
        text = {
            "Earn {C:money}$#1#{} when a card",
			"of every rank has been played",
			"{C:inactive}(Currently played: #2#){}"
        }
    },

    config = { extra = { money = 13, played_ranks = {} } },
    loc_vars = function(self, info_queue, card)
		local played_rank_strs = {}
		for _, rank in pairs(SMODS.Ranks) do
			if card.ability.extra.played_ranks[rank.id] == true then
				played_rank_strs[#played_rank_strs+1] = rank.key
			end
		end
		local final_string = ""
		if #played_rank_strs == 0 then
			final_string = "None"
		else
			for idx, str in pairs(played_rank_strs) do
				final_string = final_string .. str
				if idx ~= #played_rank_strs then final_string = final_string .. ", " end
			end
		end
        return { vars = { card.ability.extra.money, final_string } }
    end,

    rarity = 2,
    
    atlas = 'reddit_jokers',
    pos = { x = 3, y = 3 },

    cost = 5,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
			for idx, played_card in pairs(context.full_hand) do
				card.ability.extra.played_ranks[played_card:get_id()] = true				
			end
			for _, rank in pairs(SMODS.Ranks) do
				if card.ability.extra.played_ranks[rank.id] ~= true then
					return
				end
			end
			card.ability.extra.played_ranks = {}
			return {
				message = "Bingo!",
				dollars = card.ability.extra.money
			}
		end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/WarmTranslator6633', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
	end
}

-- Hi Five
get_tally = function ()
	local tally = 0
	for _, playing_card in ipairs(G.playing_cards) do
		if playing_card:get_id() == 5 then tally = tally + 1 end
	end
	return tally
end

SMODS.Joker {
	key = 'hi_five',
	blueprint_compat = true,
	loc_txt = {
		name = 'Hi Five',
		text = {
			"Gives {C:money}$#1#{} per",
			"{C:money}#2#{} in your deck",
			"{C:inactive}(Currently {C:money}$#3#{C:inactive}){}"
		}
	},

	config = { extra = { dollars = 2, rank = 5, sell_cost = 0 } },
    loc_vars = function(self, info_queue, card)
		tally = 0
		if G.playing_cards then
			tally = get_tally()
		end
		return { vars = { card.ability.extra.dollars,card.ability.extra.rank, card.ability.extra.dollars * tally} }
	end,

	rarity = 3,
	
	atlas = 'reddit_jokers',
	pos = { x = 4, y = 3 },

	cost = 8,

	add_to_deck = function (self, card, from_debuff)
		tally = get_tally()
		card.sell_cost = tally * card.ability.extra.dollars
	end,

	calculate = function (self, card, context)
		if context.selling_self or context.playing_card_added and not context.blueprint then
			tally = get_tally()
			card.sell_cost = tally * card.ability.extra.dollars
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/Thomassaurus', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Wild West
SMODS.Joker {
	key = 'wild_west',
	blueprint_compat = true,
	loc_txt = {
		name = 'Wild West',
		text = {
			"{X:mult,C:white}X#1#{} Mult if played Hand",
			"contains {C:attention}3 or more wild cards{}"
		}
	},

	config = { extra = { Xmult = 3 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 3 },

	cost = 6,

	calculate = function(self, card, context)
        if context.joker_main then
			local wild_cards = 0
            for _, scored_card in ipairs(context.full_hand) do
                if SMODS.has_enhancement(scored_card, 'm_wild') then wild_cards = wild_cards + 1 end
            end
			if wild_cards >= 3 then
				return {
					xmult = card.ability.extra.Xmult
				}
			end
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/GreedyHase', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}

-- Lamb
SMODS.Joker {
    key = 'lamb',
    blueprint_compat = false,
    loc_txt = {
        name = 'Lamb',
        text = {
            "After playing every",
			"base {C:attention}Poker hand{}, sell this",
			"to create a {C:legendary}Legendary{} joker",
			"{C:inactive}(#1#/9){}"
        }
    },

    config = { extra = { played_hands = {
		["High Card"] = false,
		["Pair"] = false,
		["Two Pair"] = false,
		["Three of a Kind"] = false,
		["Straight"] = false,
		["Flush"] = false,
		["Full House"] = false,
		["Four of a Kind"] = false,
		["Straight Flush"] = false
	} } },
    loc_vars = function(self, info_queue, card)
		local num_hands = 0
		for k, v in pairs(card.ability.extra.played_hands) do
			if v then
				num_hands = num_hands + 1
			end
		end
        return { vars = { num_hands } }
    end,

    rarity = 3,
    
    atlas = 'reddit_jokers',
    pos = { x = 1, y = 3 },

    cost = 7,

    calculate = function(self, card, context)
        if context.before then
			card.ability.extra.played_hands[context.scoring_name] = true
			for k, v in pairs(card.ability.extra.played_hands) do
				if not v then
					return
				end
			end
			local eval = function(card) return not card.REMOVED end
            juice_card_until(card, eval, true)
			return { message = localize('k_active_ex') }
		elseif context.selling_self then
			for k, v in pairs(card.ability.extra.played_hands) do
				if not v then
					return
				end
			end

			G.E_MANAGER:add_event(Event({
                    func = function()
						SMODS.add_card {
							set = 'Joker',
							legendary = true,
						}
						return true
                    end
                }))
		end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/Beasstvg', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}
