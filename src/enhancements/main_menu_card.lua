-- MMC
SMODS.Enhancement {
    key = 'mmc',
    pos = { x = 0, y = 0 },
    atlas = 'reddit_mmc',
    config = {
        x_mult = 1.5
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    weight = 0
}
