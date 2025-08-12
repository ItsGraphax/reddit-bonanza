SMODS.Joker {
	key = 'thalia',
	blueprint_compat = true,

	loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_wild
	end,

	rarity = 4, -- 1 for common through 4 for legendary
	
	atlas = 'reddit_jokers',
	pos = {x = 14, y = 1},
  soul_pos = {x = 15, y = 1},

	cost = 20,

	calculate = function(self, card, context)
    if context.pre_discard and G.GAME.current_round.discards_used <= 0 and not context.hook then
      for i = 1, #G.hand.highlighted do
        assert(SMODS.change_base(G.hand.highlighted[i], nil, '8'))
        G.hand.highlighted[i]:set_ability('m_wild', nil, true)
        G.hand.highlighted[i]:juice_up()
      end
    end
	end,

	set_badges = function(self, card, badges)
		badges[#badges+1] = credit_badge('Deitiessoul', false)
	end
}