-- Laundromat
SMODS.Joker {
	key = 'laundromat',
	blueprint_compat = true,
	loc_txt = {
		name = 'Laundromat',
		text = {
			"Gives {C:money}$#1#{} for each time you exceed",
            "the blind requirement by 5%",
            "Requirement doubles with every $#1#",
			"{C:inactive}(Max of {C:money}$#2#{C:inactive})",
            "{C:inactive}(Ex: {C:attention}#1#$=5%{C:inactive}, {C:attention}#2#$=10%{C:inactive}, {C:attention}#3#$=20%{C:inactive}, {C:attention}etc.{C:inactive})"
		}
	},

	config = { extra = { dollars = 1, dollars_max = 20 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars, card.ability.extra.dollars * 2, card.ability.extra.dollars * 3 } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 5 },

	cost = 6,

	calc_dollar_bonus = function(self, card)
        chips = G.GAME.chips
		blindreq = G.GAME.blind.chips
		percentage = ( (chips - blindreq) / blindreq ) * 100
		money = math.floor(math.log(percentage / 5) / math.log(2)) + 1
		money = money * card.ability.extra.dollars
		if money > card.ability.extra.dollars_max then
			money = card.ability.extra.dollars_max
		end
		return money
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('PokeAreddit', false)
	end
}
