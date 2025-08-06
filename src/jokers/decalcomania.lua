SMODS.Joker {
	key = 'decalcomania',
	blueprint_compat = true,

  config = { extra = {odds = 7} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds} }
  end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 9, y = 6 },

	cost = 6,

	calculate = function(self, card, context)
    if context.before and context.main_eval then
      local msg = false
      for _, v in ipairs(G.play.cards) do
        if pseudorandom('event_horizon') < G.GAME.probabilities.normal / card.ability.extra.odds and not v.edition then
          local edition = poll_edition('vremade_wheel_of_fortune', nil, true, true, {'e_polychrome', 'e_holo', 'e_foil'})
          msg = true
          v:set_edition(edition, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              v:juice_up()
              return true 
            end
          }))
        end
      end
      if msg then
        return {
          message = localize('k_upgrade_ex')
        }
      else 
        return {
          message = localize('k_nope_ex')
        }
      end
    end
	end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('USER', false)
	end
}
