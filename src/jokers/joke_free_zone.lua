function calc_chips(card)
  if not G.jokers then return end

  card.ability.extra.chips = 0
  for _, v in ipairs(G.jokers.cards) do
    if v.debuff then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
    end
  end
end

SMODS.Joker {
  key = 'joke_free_zone',
  blueprint_compat = true,

  config = { extra = { chips_gain = 125, chips = 0 } },
  loc_vars = function(self, info_queue, card)
    calc_chips(card)
    return { vars = { card.ability.extra.chips_gain, card.ability.extra.chips } }
  end,

  rarity = 2, -- if it was a common then the universe would explode

  atlas = 'reddit_jokers',
  pos = { x = 11, y = 5 },

  cost = 6,

  calculate = function(self, card, context)
    if context.selling_self then
      for i, v in ipairs(G.jokers.cards) do
        if v.debuff then
          SMODS.debuff_card(G.jokers.cards[i], false, 'j_reddit_joke_free_zone')
          G.E_MANAGER:add_event(Event({
            func = function()
              G.jokers.cards[i]:juice_up(0.3, 0.2)
              return true
            end
          }))
        end
      end
    end

    if context and not (context.selling_self or context.selling_card) then
      for i, v in ipairs(G.jokers.cards) do
        if v.config.center.rarity == 1 and not v.debuff then
          SMODS.debuff_card(G.jokers.cards[i], true, 'j_reddit_joke_free_zone')
          G.E_MANAGER:add_event(Event({
            func = function()
              G.jokers.cards[i]:juice_up(0.3, 0.2)
              return true
            end
          }))
        end
      end
    end

    if context.joker_main then
      calc_chips(card)
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = credit_badge('Unlikely_Movie_9073', false)
  end
}
