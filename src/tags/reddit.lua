local reddit_orange =  {1.0, 0.337, 0, 1}
SMODS.Tag {
  key = 'reddit',
  atlas = 'reddit_tags',
  pos = {x = 0, y = 0},
  min_ante = 2,

  loc_vars = function(self, info_queue)
    info_queue[#info_queue+1] = G.P_CENTERS.p_reddit_bonanza_pack_mega1
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', reddit_orange, function()
        local booster = SMODS.create_card { key = 'p_reddit_bonanza_pack_mega1', area = G.play }
        booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
        booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
        booster.T.w = G.CARD_W * 1.27
        booster.T.h = G.CARD_H * 1.27
        booster.cost = 0
        booster.from_tag = true
        G.FUNCS.use_card({ config = { ref_table = booster } })
        booster:start_materialize()
        G.CONTROLLER.locks[lock] = nil
        return true
      end)
      tag.triggered = true
      return true
    end
  end
}