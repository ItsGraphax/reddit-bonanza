SMODS.Joker {
  key = 'lemonade',
  blueprint_compat = true,
  eternal_compat = false,

  atlas = 'reddit_jokers',
  pos = {x = 8, y = 4},

  rarity = 2,
  cost = 7,
  config = {extra = {Xmult = 2.5, Xmult_gain = 0.25}},

  loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_gain}}
  end,

  calculate = function(self, card, context)
    if context.selling_card or context.remove_playing_cards and not context.blueprint then
      local rem = 1
      if context.remove_playing_cards then
        rem = #context.removed
      else
        if context.selling_self then
          rem = 0
        end
      end
      card.ability.extra.Xmult = card.ability.extra.Xmult - (card.ability.extra.Xmult_gain * rem)
      if card.ability.extra.Xmult <= 1 then
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
          message = localize('k_drank_ex'),
          colour = G.C.FILTER
        }
      end
      return {
        message = localize {type = 'variable', key = 'a_xmult_minus', vars = {card.ability.extra.Xmult_gain * rem}},
        colour = G.C.FILTER
      }
    end
    if context.joker_main then
      return {
        Xmult = card.ability.extra.Xmult,
      }
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('alex_tmwk', false)
  end
}