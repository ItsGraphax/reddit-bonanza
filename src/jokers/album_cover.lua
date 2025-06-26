-- Album Cover
SMODS.Joker {
	key = 'album_cover',
	blueprint_compat = false,
	
	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 1,
	add_to_deck = function (self, card, from_debuff)
        G.GAME.extra_pack_cards = G.GAME.extra_pack_cards or 0
        G.GAME.extra_pack_cards = G.GAME.extra_pack_cards + 1
    end,
    remove_from_deck = function ()
        G.GAME.extra_pack_cards = G.GAME.extra_pack_cards - 1
    end,
	atlas = 'reddit_jokers',
	pos = { x = 6, y = 3 },

	cost = 5,

    calculate = function(self, card, context)
        if context.open_booster then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    card:juice_up(0.3, 0.4)
                    return true
                end)
            }))
            return nil, true
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Omicra98', false)
	end
}
