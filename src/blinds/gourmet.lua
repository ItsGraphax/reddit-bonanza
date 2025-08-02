SMODS.Blind { -- Permission pending
  key = "gourmet",
  loc_txt = {
    name = 'The Gourmet',
    text = {
      'All cards are debuffed',
      'until a consumable is',
      'used or sold'
    }
  },

  pos = {y = 1},
  atlas = 'reddit_blinds',

  boss = {min = 2},
  boss_colour = HEX("e3af36"),
  
  calculate = function(self, blind, context)
    if not blind.disabled then
      if context.debuff_card and context.debuff_card.area ~= G.jokers then
        return {
          debuff = true
        }
      end
    end
    if (context.selling_card and context.card.ability.set ~= 'Joker') or context.using_consumeable then
      G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          blind:disable()
          return true
        end
      }))
    end
  end
}