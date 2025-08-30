SMODS.Blind { -- Permission pending
  key = 'spotlight',

  pos = {y = 0},
  atlas = 'reddit_blinds',

  boss = {min = 4},
  boss_colour = HEX('ccb987'),

  stay_flipped = function(self, area, card)
    if area ~= G.hand then return false end
    if not G.GAME.blind.disabled and card.area ~= G.jokers then
      if card.config.center == G.P_CENTERS.c_base then
        return true
      end
      return false
    end
  end,

  disable = function(self)
    for i = 1, #G.hand.cards do
      if G.hand.cards[i].facing == 'back' then
        G.hand.cards[i]:flip()
      end
    end
    for _, playing_card in pairs(G.playing_cards) do
      playing_card.ability.wheel_flipped = nil
    end
  end
}