SMODS.Joker {
	key = 'thunderstruck',
	blueprint_compat = true,

  config = { extra = {odds = 4} },
  loc_vars = function(self, info_queue, card)
      return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds} }
  end,

	rarity = 3,
	
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 0 },

	cost = 9,

	calculate = function(self, card, context)
    if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
      local my_pos = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          my_pos = i
          break
        end
      end
      if 
      G.jokers.cards[my_pos+1] and context.other_card == G.jokers.cards[my_pos+1] or
      G.jokers.cards[my_pos-1] and context.other_card == G.jokers.cards[my_pos-1] 
      then
        if pseudorandom('thunderstruck') < G.GAME.probabilities.normal / card.ability.extra.odds then
          return {
            repetitions = 1
          }
      end
      end
    end
	end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
	end
}
