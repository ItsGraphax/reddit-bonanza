-- JOKER NAME
SMODS.Joker {
  key = 'whos_that_joker',
  blueprint_compat = true,

  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS['c_judgement']
  end,

  rarity = 2, -- 1 for common through 4 for legendary

  atlas = 'reddit_jokers',
  pos = { x = 11, y = 6 },

  cost = 7,

  calculate = function(self, card, context)
    if context.setting_blind and context.cardarea == G.jokers and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.E_MANAGER:add_event(Event({
        func = function()
          local _card = SMODS.add_card {
            set = 'Tarot',
            key_append = 'reddit_whos_that_joker'
          }:set_ability('c_judgement')
          return true
        end
      }))
      return {
        message = localize('k_plus_tarot'),
        colour = G.C.PURPLE,
      }
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = credit_badge('Ethanlac', false)
  end
}
