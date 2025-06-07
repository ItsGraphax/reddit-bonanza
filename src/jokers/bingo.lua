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
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
	end
}