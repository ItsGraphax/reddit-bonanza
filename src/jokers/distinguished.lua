SMODS.Joker {
	key = 'distinguished',
	blueprint_compat = true,

  config = {extra = {enhancement = 'm_wild'}},
  loc_vars = function(self, info_queue, card)
      return {vars = {localize {type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement}}}
  end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 10, y = 2 },

	cost = 6,

	calculate = function(self, card, context)
    if context.setting_blind then
      local chosen = nil
      local pool = {}
      for _, enhanced_center in ipairs(G.P_CENTER_POOLS.Enhanced) do
        if enhanced_center.key ~= 'm_wild' then
          pool[#pool + 1] = enhanced_center.key
        end
      end
      chosen = pool[pseudorandom("distinguished", 1, #pool)]
      card.ability.extra.enhancement = chosen
      print(chosen)
      return {
        message = localize {type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement}
      }
    end
    if context.check_enhancement then
      if context.other_card.config.center.key == "m_wild" then
        local ret = {}
        ret[card.ability.extra.enhancement] = true
        return ret
      end
    end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Omicra98', false)
	end
}