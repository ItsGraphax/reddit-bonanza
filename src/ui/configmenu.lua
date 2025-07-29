local create_config_toggle = function(args)
    return {
        n = G.UIT.R,
        config = { align = "cl", padding = 0 },
        nodes = {
            {
                n = G.UIT.C,
                config = { align = "cl", padding = 0.05 },
                nodes = {
                    create_toggle { col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = reddit_config, ref_value = args.ref_value },
                }
            },
            {
                n = G.UIT.C,
                config = { align = "c", padding = 0 },
                nodes = {
                    { n = G.UIT.T, config = { text = localize(args.translate), scale = 0.45, colour = G.C.UI.TEXT_LIGHT } },
                }
            },
        }
    }
end

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {
            align = "m", r = 0.1, padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 6
        },
        nodes = {
            -- Rectangle???
            { n = G.UIT.R, config = { align = "cl", padding = 0, minh = 0.1 }, nodes = {} },

            -- Bonanza Packs
            create_config_toggle({ ref_value = 'enable_bonanza_packs', translate = 'b_reddit_enable_bonanza_packs' }),
            -- Joker Overrides
            create_config_toggle({ ref_value = 'enable_joker_overrides', translate = 'b_reddit_enable_joker_overrides' })
        }
    }
end
