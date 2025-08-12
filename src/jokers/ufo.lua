SMODS.Joker {
	key = 'ufo',
	blueprint_compat = true,

	config = { extra = {played_hands = {
		["High Card"] = false,
		["Pair"] = false,
		["Two Pair"] = false,
		["Three of a Kind"] = false,
		["Straight"] = false,
		["Flush"] = false,
		["Full House"] = false,
		["Four of a Kind"] = false,
		["Straight Flush"] = false,
    ["Five of a Kind"] = false,
    ["Flush House"] = false,
    ["Flush Five"] = false
	}}},

	rarity = 2, -- 1 for common through 4 for legendary
	
	atlas = 'reddit_jokers',
	pos = { x = 10, y = 5 },

	cost = 6,

	calculate = function(self, card, context)
    if context.before then
      card.ability.extra.played_hands[context.scoring_name] = true
    end

    if context.end_of_round and context.cardarea == G.jokers then
      print('end of round')
      local hands = 0
      for k, v in pairs(card.ability.extra.played_hands) do
        if v then
          hands = hands + 1
          card.ability.extra.played_hands[k] = false
        end
      end
      pool = {}


      for _, poker_hand in pairs(SMODS.PokerHands) do
        pool[#pool + 1] = poker_hand.key
      end
      chosen = pool[pseudorandom("ufo", 1, #pool)]
      SMODS.smart_level_up_hand(card, chosen, false, hands)
    end
	end,

	set_badges = function(self, card, badges)
		badges[#badges+1] = credit_badge('Kid4U_Reddit', false)
	end
}