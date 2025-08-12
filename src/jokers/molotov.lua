-- JOKER NAME
SMODS.Joker {
	key = 'molotov',
	blueprint_compat = true,
	eternal_compat = false, -- false if the joker has to be sold or can destroy itself

	config = {extra = {size = 1}},
	loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.size}}
	end,

	rarity = 2, -- 1 for common through 4 for legendary,
	
	atlas = 'reddit_jokers',
	pos = {x = 10, y = 4},

	cost = 7,

	calculate = function(self, card, context)
    if context.after and hand_chips * mult > G.GAME.blind.chips then
      G.hand:change_size(card.ability.extra.size)
      G.E_MANAGER:add_event(Event({
        func = function()
          play_sound('tarot1')
          card.T.r = -0.2
          card:juice_up(0.3, 0.4)
          card.states.drag.is = true
          card.children.center.pinch.x = true
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            blockable = false,
            func = function()
              G.jokers:remove_card(card)
              card:remove()
              card = nil
              return true;
            end
          }))
          return true
        end
      }))
      return {
        message = localize {type = "variable", key = "a_handsize", vars = {card.ability.extra.size}},
        colour = G.C.FILTER
      }
    end
	end,

	set_badges = function(self, card, badges)
		badges[#badges+1] = credit_badge('PandoraTWomen ', false)
	end
}
