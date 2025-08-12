SMODS.Joker {
  key = 'notfunny',
  blueprint_compat = true,

  atlas = 'reddit_jokers',
  pos = {x = 8, y = 5},

  rarity = 3,
  cost = 8,
  config = {extra = {Xmult_gain = 1, Xmult = 1}},
  
  loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.Xmult_gain, card.ability.extra.Xmult}}
  end,

  calculate = function(self, card, context)
    if context.before then
      local my_pos = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          my_pos = i
          break
        end
      end

      for i,_ in ipairs(G.jokers.cards) do
        if i < my_pos then
          if not G.jokers.cards[i].edition or not G.jokers.cards[i].edition.negative then
            SMODS.debuff_card(G.jokers.cards[i], true, 'j_reddit_notfunny')
            G.E_MANAGER:add_event(Event({
              func = function() 
                G.jokers.cards[i]:juice_up(0.3,0.2)
                return true 
              end
            }))
          end
        else
          SMODS.debuff_card(G.jokers.cards[i], false, 'j_reddit_notfunny')
        end
      end

      card.ability.extra.Xmult = my_pos
      return {
        message = 'Not Funny.'
      }
    end
    if context.joker_main then
      return {
        Xmult = card.ability.extra.Xmult,
      }
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('Emanresu_4', false)
  end
}