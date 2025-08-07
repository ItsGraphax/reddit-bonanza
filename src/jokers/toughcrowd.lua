-- literally copy-pasted from Hack
SMODS.Joker {
  key = "tough_crowd",
  blueprint_compat = true,
  
  config = { extra = { repetitions = 1 } },

  rarity = 2,
  cost = 6,

  atlas = 'reddit_jokers',
  pos = { x = 10, y = 1 },
  
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.other_card:get_id() == 6 or
        context.other_card:get_id() == 7 or
        context.other_card:get_id() == 8 or
        context.other_card:get_id() == 9 then
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
    end
  end
}