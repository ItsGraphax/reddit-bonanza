SMODS.Joker {
  key = 'waiting',
  blueprint_compat = false,

  atlas = 'reddit_jokers',
  pos = {x = 8, y = 3},

  rarity = 3,
  cost = 9,
  config = {extra = {waiting_rounds = 0, total_rounds = 3}},
  
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.waiting_rounds, card.ability.extra.total_rounds}}
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      card.ability.extra.waiting_rounds = card.ability.extra.waiting_rounds + 1
      if card.ability.extra.waiting_rounds >= 2 then
        card.getting_sliced = true
        card:start_dissolve()
        return {
          colour = G.C.RED,
          message = 'So alone...',
        }
      else
        return {
          colour = G.C.INACTIVE,
          message = card.ability.extra.waiting_rounds .. ''
        }
      end
    end
    if context.card_added and not context.blueprint and context.card.config.center.key ~= "j_reddit_waiting" and not context.card.copied_by_waiting then
      if context.card.config.center.rarity == 3 then
        local copy = copy_card(context.card, nil, nil, nil, context.card.edition and context.card.edition.negative)
        copy.copied_by_waiting = true
        copy:add_to_deck()
        G.jokers:emplace(copy)
        card.getting_sliced = true
        card:start_dissolve()
        return {
          message = localize('k_duplicated_ex')
        }
      end
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('Gustalavalav', false)
  end
}