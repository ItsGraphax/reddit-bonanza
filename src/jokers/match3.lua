-- Match 3
function match_qualified(card, hand, count)
    local same_rank = {}
    for _, c in ipairs(hand) do
        if c:get_id() == card:get_id() then
            same_rank[#same_rank+1] = c
        end
    end

    if #same_rank < count then return false end
    -- check if at least 3 of these cards are same suit

    for _, suit in pairs(SMODS.Suits) do
        local num_cards = 0
        for i, c in pairs(same_rank) do
            if c:is_suit(suit.key) then num_cards = num_cards + 1 end
        end
        if num_cards >= count then return true end
    end
    return false
end

SMODS.Joker {
	key = 'match3',
	blueprint_compat = true,
	
	config = { extra = { count = 3, chips = 50, money = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { 
            card.ability.extra.count,
            card.ability.extra.chips,
            card.ability.extra.money
        } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 4, y = 4 },
	cost = 6,
	calculate = function(self, card, context)
		if 
            context.individual and 
            context.cardarea == G.play and
            match_qualified(context.other_card, context.scoring_hand, card.ability.extra.count)
        then
			return {
                chips = card.ability.extra.chips,
                dollars = card.ability.extra.money
            }
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}
