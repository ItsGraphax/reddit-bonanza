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
    pos = { x = 0, y = 4 },

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
        badges[#badges+1] = credit_badge('Beasstvg', false)
    end
}
