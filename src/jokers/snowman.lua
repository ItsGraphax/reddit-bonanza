SMODS.Joker {
	key = 'snowman',
	blueprint_compat = true,
  perishable_compat = false,

  config = {extra = {chips_gain = 30, chips = 0,}},
  loc_vars = function(self, info_queue, card)
      return {vars = {
        card.ability.extra.chips_gain,
        card.ability.extra.chips
      }}
  end,

	rarity = 3,
	
	atlas = 'reddit_jokers',
	pos = { x = 10, y = 3 },

	cost = 8,

	calculate = function(self, card, context)
    if context.before and context.main_eval and not context.blueprint then
      local enhanced = {}
      for _, scored_card in ipairs(context.scoring_hand) do
        if next(SMODS.get_enhancements(scored_card)) == 'm_bonus' and not scored_card.debuff and not scored_card.snowman_suck then
          print(next(SMODS.get_enhancements(scored_card)))
          enhanced[#enhanced + 1] = scored_card
          scored_card.snowman_suck = true
          scored_card:set_ability('c_base', nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              scored_card:juice_up()
              scored_card.snowman_suck = nil
              return true
            end
          }))
        end
      end

      if #enhanced > 0 then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain * #enhanced
        return {
          message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
          colour = G.C.CHIPS
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