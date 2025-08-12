SMODS.Joker {
	key = 'snowman',
	blueprint_compat = true,
  perishable_compat = false,

  config = {extra = {chips_gain = 25, chips_lose = 25, chips_penalty = 50, chips = 0, message = false}},
  loc_vars = function(self, info_queue, card)
      return {vars = {
        card.ability.extra.chips_gain,
        card.ability.extra.chips_lose,
        card.ability.extra.chips_penalty,
        card.ability.extra.chips
      }}
  end,

	rarity = 3,
	
	atlas = 'reddit_jokers',
	pos = { x = 10, y = 3 },

	cost = 8,

	calculate = function(self, card, context)
    if card.ability.extra.message then
      card.ability.extra.message = false
      return {
          colour = G.C.BLUE,
          message = '-' .. card.ability.extra.chips_penalty -- why does this not work is it stupid
        }
    end
    if card.ability.extra.chips < 0 then
      card.ability.extra.chips = 0
    end
    if context.before then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
    end
    if context.end_of_round and context.cardarea == G.jokers then 
      if card.ability.extra.chips > 0 then
        card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_lose
        return {
          colour = G.C.BLUE,
          message = '-' .. card.ability.extra.chips_lose
        }
      end
    end
    if context.skip_blind then 
      if card.ability.extra.chips > 0 then
        card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_penalty
        card.ability.extra.message = true
        return {
          colour = G.C.BLUE,
          message = '-' .. card.ability.extra.chips_penalty -- why does this not work is it stupid
        }
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
      }
    end
	end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('sujoybyte', false)
	end
}