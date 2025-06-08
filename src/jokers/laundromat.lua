-- Laundromat
SMODS.Joker {
	key = 'laundromat',
	blueprint_compat = true,
	loc_txt = {
		name = 'Laundromat',
		text = {
			"Gives {C:money}$#1#{} for each time you exceed",
            "the blind requirement by a growing margin",
            "Requirement doubles with every $#1#",
            "{C:inactive}(Ex: {C:attention}#1#$=5%{C:inactive}, {C:attention}#2#$=10%{C:inactive}, {C:attention}#3#$=20%{C:inactive}, {C:attention}etc.{C:inactive})"
		}
	},

	config = { extra = { dollars = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars, card.ability.extra.dollars * 2, card.ability.extra.dollars * 3 } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 5 },

	cost = 6,

	calc_dollar_bonus = function(self, card, context)
        -- CALCULATE
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('PokeAreddit', false)
	end
}
