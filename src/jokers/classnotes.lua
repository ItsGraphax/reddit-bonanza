SMODS.Joker {
	key = 'class_notes',
	blueprint_compat = true,

  config = { extra = {odds = 5} },
  loc_vars = function(self, info_queue, card)
    if card.area and card.area == G.jokers then
      local other_joker
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
      end
      local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
      main_end = {
        {
          n = G.UIT.C,
          config = { align = "bm", minh = 0.4 },
          nodes = {
            {
              n = G.UIT.C,
              config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
              nodes = {
                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
              }
            }
          }
        }
      }
      return { 
        main_end = main_end,
        vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}
    }
    end
  end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = {x = 9, y = 7},

	cost = COST,

	calculate = function(self, card, context)
      local other_joker = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
      end

      if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
        if pseudorandom('classnotes') < G.GAME.probabilities.normal / card.ability.extra.odds then
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
            message = 'Destroyed!', -- idk what to put here and k_extinct_ex is most certainly not it
            colour = G.C.FILTER
          }
        end
      end
      return SMODS.blueprint_effect(card, other_joker, context)
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
	end
}
