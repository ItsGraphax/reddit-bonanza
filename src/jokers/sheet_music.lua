-- JOKER NAME
SMODS.Joker {
	key = 'sheet_music',
	blueprint_compat = true,

	config = { extra = {dollars = 1} },
	loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.extra.dollars} }
	end,

	rarity = 1, -- 1 for common through 4 for legendary
	
	atlas = 'reddit_jokers',
	pos = { x = 10, y = 6 },

	cost = 5,

	calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and (
      context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or
       context.other_card:get_id() == 4 or context.other_card:get_id() == 14
      ) then
        
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
        return {
          dollars = card.ability.extra.dollars,
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                G.GAME.dollar_buffer = 0
                return true
              end
            }))
          end
          }
      end
	end,

	set_badges = function(self, card, badges)
		badges[#badges+1] = credit_badge('Omicra98', false)
	end
}
