SMODS.Joker {
  key = 'ore_vein',
  blueprint_compat = false,

  atlas = 'reddit_jokers',
  pos = {x = 9, y = 3},

  rarity = 2,
  cost = 7,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_gold
    return
  end,

  calculate = function(self, card, context)
    if context.check_enhancement then
      if context.other_card.config.center.key == "m_stone" then
        return {m_gold = true}
      end
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('Chum724', false)
  end
}