SMODS.Joker {
  key = 'meninblack', -- funny reference guys get it right haha yeah i'm so smart and funny right guys
  blueprint_compat = false,

  atlas = 'reddit_jokers',
  pos = {x = 8, y = 6},

  rarity = 2,
  cost = 8,
  config = {extra = {total_hands = 10, hands_remaining = 10}},
  loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.total_hands, card.ability.extra.hands_remaining}}
  end,

  calculate = function(self, card, context)
    if context.after and not context.blueprint then
      card.ability.extra.hands_remaining = card.ability.extra.hands_remaining - 1
      if card.ability.extra.hands_remaining < 0 then card.ability.extra.hands_remaining = 0 end

      if card.ability.extra.hands_remaining == 0 then
        local eval = function(card) return not card.removed end
        juice_card_until(card, eval, true)
        return {
          message = localize('k_active_ex')
        }
      end
      return {
        message = card.ability.extra.hands_remaining .. ''
      }
    end
    if context.selling_self and card.ability.extra.hands_remaining == 0 and not context.blueprint then
      if #G.jokers.cards <= G.jokers.config.card_limit then
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card {
                set = 'Joker',
                rarity = 'Rare'
            }
            G.GAME.joker_buffer = 0
          return true
          end
        }))
      else
        return {message = localize('k_no_room_ex')}
      end
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('alex_tmwk', false)
  end
}