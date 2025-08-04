SMODS.Joker {
  key = 'golden_retriever',
  blueprint_compat = true,

  atlas = 'reddit_jokers',
  pos = {x = 8, y = 2},

  rarity = 2,
  cost = 7,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_gold
    info_queue[#info_queue+1] = G.P_SEALS["Gold"]
    return
  end,

  calculate = function(self, card, context)
    if context.first_hand_drawn then
      local _card = create_playing_card({
        front = pseudorandom_element(G.P_CARDS, pseudoseed('goldendog')),
        center = G.P_CENTERS.c_base
      }, G.discard, true, nil, {G.C.SECONDARY_SET.Enhanced }, true)
      _card:set_seal('Gold')
      _card:set_ability(G.P_CENTERS.m_gold)
      return {
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.hand:emplace(_card)
              _card:start_materialize()
              G.GAME.blind:debuff_card(_card)
              G.hand:sort()
              if context.blueprint_card then
                context.blueprint_card:juice_up()
              else
                card:juice_up()
              end
              return true
            end
          }))
          SMODS.calculate_context({playing_card_added = true, cards = {_card}})
        end
      }
    end
  end,

  set_badges = function(self, card, badges)
    badges[#badges+1] = credit_badge('WarmTranslator6633', false)
  end
}