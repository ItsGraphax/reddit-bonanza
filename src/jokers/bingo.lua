-- Bingo
SMODS.Joker {
    key = 'bingo',
    blueprint_compat = false,

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
			final_string = localize('k_none')
		else
			table.sort(played_rank_strs, function (a, b)
				return SMODS.Ranks[a].id < SMODS.Ranks[b].id
			end)
			for idx, str in pairs(played_rank_strs) do
				final_string = final_string .. localize(str, 'ranks')
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
				if not SMODS.has_no_rank(played_card) then
					card.ability.extra.played_ranks[played_card:get_id()] = true
				end
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
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', true)
	end
}