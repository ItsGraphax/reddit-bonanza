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
	
	config = { extra = { dollars = 2, rank = 5, sell_cost = 0 } },
    loc_vars = function(self, info_queue, card)
		local tally = 0
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
		local tally = get_tally()
		card.sell_cost = tally * card.ability.extra.dollars
	end,

	calculate = function (self, card, context)
		if context.selling_self or context.playing_card_added and not context.blueprint then
			local tally = get_tally()
			card.sell_cost = tally * card.ability.extra.dollars
		end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Thomassaurus', false)
    end
}
