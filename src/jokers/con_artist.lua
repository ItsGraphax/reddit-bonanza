-- Con Artist
SMODS.Joker {
	key = 'con_artist',
	blueprint_compat = true,
	loc_txt = {
		name = 'Con Artist',
		text = {
			"Choose an extra card",
            "from any {C:attention}Booster Pack{}"
		}
	},

	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 7, y = 6 },

	cost = 6,
    add_to_deck = function (self, card, from_debuff)
        G.GAME.extra_pack_choice = G.GAME.extra_pack_choice or 0
        G.GAME.extra_pack_choice = G.GAME.extra_pack_choice + 1
    end,
    remove_from_deck = function ()
        G.GAME.extra_pack_choice = G.GAME.extra_pack_choice - 1
    end,
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
        badges[#badges+1] = credit_badge('JohnseGamer', false)
	end
}
