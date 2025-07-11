-- Rainbow Joker
SMODS.Joker {
	key = 'rainbow',
	blueprint_compat = true,
	
	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 2,
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
				if context.scoring_hand[i].ability.name == 'Wild Card' then
					suits.Hearts = true
					suits.Diamonds = true
					suits.Spades = true
					suits.Clubs = true
					break
				end
				if not suits.Hearts and card:is_suit("Hearts", check_modded) then
					suits.Hearts = true
				end
				if not suits.Diamonds and card:is_suit("Diamonds", check_modded) then
					suits.Diamonds = true
				end
				if not suits.Spades and card:is_suit("Spades", check_modded) then
					suits.Spades = true
				end
				if not suits.Clubs and card:is_suit("Clubs", check_modded) then
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
        badges[#badges+1] = credit_badge('NeoShard1', false)
    end
}