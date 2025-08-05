SMODS.Joker { -- Permission pending
  key = 'toiletpaper',
  blueprint_compat = true,

  atlas = 'reddit_jokers',
  pos = {x = 8, y = 7},

  rarity = 2,
  cost = 6,
  config = {extra = {Xmult_gain = 0.2, Xmult = 1}},

  loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.Xmult_gain, card.ability.extra.Xmult}}
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint then
      print(context.consumeable.config.center.key)
      if context.consumeable.config.center.key == 'c_uranus' then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
        return {
          message = localize('k_upgrade_ex')
        }
      end
    end
    if context.before and context.main_eval and context.scoring_name == 'Flush' and not context.blueprint then
      card.ability.extra.Xmult = 1
      return {
        message = localize('k_reset')
      }
    end
    if context.joker_main then
      return {
        Xmult = card.ability.extra.Xmult,
      }
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('Ecstatic_Plum2304', false)
    badges[#badges+1] = credit_badge('Ohakoko', true) 
  end
}