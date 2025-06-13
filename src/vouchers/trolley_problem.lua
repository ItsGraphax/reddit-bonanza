SMODS.Voucher {
    key = "trolley_problem",
    loc_txt = {
        name = "Trolley Problem",
        text = {
            "When skipping a blind, choose",
            "between 2 available tags"
        }
    },

    atlas = 'reddit_vouchers',
    pos = { x = 0, y = 0 },

    redeem = function (self, voucher)
        G.GAME.trolley_active = true
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('consider_its_tree', false)
    end
}
SMODS.Voucher {
    key = "track_drift",
    loc_txt = {
        name = "Track Drift",
        text = {
            "When skipping a blind,",
            "gain 2 tags"
        }
    },

    atlas = 'reddit_vouchers',
    pos = { x = 1, y = 0 },

    redeem = function (self, voucher)
        G.GAME.track_active = true
    end,
    requires = { 'v_reddit_trolley_problem' },
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('consider_its_tree', false)
    end
}

