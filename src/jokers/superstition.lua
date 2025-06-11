-- Superstition
local get_tally = function ()
    if not G.playing_cards then return 0 end
    local curr_tally  = 0
    for _, card in pairs(G.playing_cards) do
        if card:get_id() == 7 then curr_tally = curr_tally + 1
        elseif card:get_id() == 6 then curr_tally = curr_tally - 1 end
    end
    return curr_tally
end
SMODS.Joker {
	key = 'superstition',
	blueprint_compat = true,
	loc_txt = {
		name = 'Superstition',
		text = {
			"{X:mult,C:white}X#1#{} Mult for every {C:attention}7{}",
            "in your {C:attention}full deck{},",
			"-{X:mult,C:white}X#1#{} Mult for every 6",
			"in your {C:attention}full deck{}",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive}){}"
		}
	},

	config = { extra = { xmult_fac = 0.25 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { 
            card.ability.extra.xmult_fac, 
            1 + math.max(card.ability.extra.xmult_fac * get_tally(), 0)
        } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 0, y = 6 },
	cost = 6,
	calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = 1 + math.max(card.ability.extra.xmult_fac * get_tally(), 0)
            }
        end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Omicra98', false)
    end
}
