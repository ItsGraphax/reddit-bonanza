SMODS.Joker { -- Permission pending
  key = '4head',
  blueprint_compat = true,

  atlas = 'reddit_jokers',
  pos = {x = 9, y = 1},

  rarity = 3,
  cost = 8,
  config = {extra = {Xmult_gain = 0.5, Xmult = 1, faces = 4}},

  loc_vars = function(self, info_queue, card)
    local faces_tally = 0
    if G.playing_cards then
      for _, playing_card in ipairs(G.playing_cards) do
        if playing_card:is_face() then faces_tally = faces_tally + 1 end
      end
    end
    return { vars = {
      card.ability.extra.Xmult_gain,
      card.ability.extra.faces,
      card.ability.extra.Xmult + card.ability.extra.Xmult_gain * math.floor(faces_tally / 4)
    }}
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local faces_tally = 0
      for _, playing_card in ipairs(G.playing_cards) do
        if playing_card:is_face() then faces_tally = faces_tally + 1 end
      end
      return {
        Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain * math.floor(faces_tally / 4)
      }
    end

    in_pool = function(self, args)
      for _, playing_card in ipairs(G.playing_cards or {}) do
        if playing_card:is_face() then
          return true
        end
      end
      return false
    end
  end,

 set_badges = function(self, card, badges)
   badges[#badges+1] = credit_badge('ProstateFondler', false) -- what in the cursed names is this guy's username
 end
}
