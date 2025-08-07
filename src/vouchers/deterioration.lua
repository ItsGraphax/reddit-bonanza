SMODS.Voucher {
  key = 'deterioration',

  atlas = 'reddit_vouchers',
  pos = { x = 0, y = 1 },

  config = {percent = 25},
  loc_vars = function(self, info_queue)
    return {vars = {self.config.percent}}
  end,

  redeem = function(self)
    print('base: ' .. G.GAME.starting_params.ante_scaling .. ', change: ' .. ((1 - self.config.percent) / 100) .. ', result: ' .. (G.GAME.starting_params.ante_scaling) - ((self.config.percent) / 100))


    G.GAME.starting_params.ante_scaling = (G.GAME.starting_params.ante_scaling) - ((self.config.percent) / 100)
  end
}

SMODS.Voucher {
  key = 'decay',

  atlas = 'reddit_vouchers',
  pos = { x = 1, y = 1 },

  config = {percent = 25},
  loc_vars = function(self, info_queue)
    return {vars = {self.config.percent}}
  end,

  redeem = function(self)
    G.GAME.starting_params.ante_scaling = (G.GAME.starting_params.ante_scaling) - ((self.config.percent) / 100)
  end
}