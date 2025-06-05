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
