-- MMC
SMODS.Enhancement {
    key = 'mmc',
    pos = { x = 0, y = 0 },
    atlas = 'reddit_mmc',
    config = {  },
    loc_vars = function(self, info_queue, card)
        return { }
    end,
    replace_base_card = true,
    overrides_base_rank = true,
    weight = 0
}