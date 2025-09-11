SMODS.Stake {
    key = 'bonanza',
    prefix_config = { applied_stakes = { mod = false } },
    applied_stakes = {'gold'},
    loc_txt = { -- I'M ONLY DOING THIS CAUSE I'M TOO LAZY TO FIND OUT HOW TO ADD THE "Applies all previous stakes" TEXT MANUALLY
        sticker = {
            name = "Bonanza Sticker",
            text = {"Used this Joker", "to win on {C:attention}Bonanza", "{C:attention}Stake{} difficulty"}
        },
        name = "Bonanza Stake",
        text = {"Shop can have Jokers with", "Stickers found in {C:attention}Reddit Bonanza{}"}
    },
    modifiers = function()
        G.GAME.modifiers.enable_reddit_flipped = true
    end
}
