SMODS.Joker { -- Event Horizon
  key = 'event_horizon',
  blueprint_compat = true,
  perishable_compat = false,

  atlas = 'reddit_jokers',
  pos = {x = 8, y = 1},

  rarity = 3,
  cost = 8,
  config = {extra = {Xmult_gain = 0.2, odds = 5, Xmult = 1}},
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.Xmult_gain, card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds 
    }}
  end,

  calculate = function(self, card, context)
    if context.destroy_card and not context.blueprint and context.cardarea == G.play then
      if pseudorandom('event_horizon') < G.GAME.probabilities.normal / card.ability.extra.odds then
        return {
          remove = true
        }
      end
    end

    if context.remove_playing_cards and not context.blueprint then
      local destroyed = 0
      for _, removed_card in ipairs(context.removed) do
        destroyed = destroyed + 1
      end
      if destroyed > 0 then
        card.ability.extra.Xmult = card.ability.extra.Xmult + (card.ability.extra.Xmult_gain * destroyed)
        return {
          message = 'Upgrade!'
        }
      end
    end


    if context.joker_main then
      if card.ability.extra.Xmult == 1 then
        return
      end
      return {
        Xmult_mod = card.ability.extra.Xmult,
        message = 'X' .. card.ability.extra.Xmult
      }
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('TheNeto06', false)
  end
}