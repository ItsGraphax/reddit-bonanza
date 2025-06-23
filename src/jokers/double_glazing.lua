local gpv = SMODS.get_probability_vars
function SMODS.get_probability_vars(trigger_obj, base_numerator, base_denominator)
    if trigger_obj and trigger_obj.ability.name == "Glass Card" then
        base_denominator = base_denominator * (2 ^ #SMODS.find_card('j_reddit_double_glazing'))
    end
    return gpv(trigger_obj, base_numerator, base_denominator)
end

-- Double glazing
SMODS.Joker {
	key = 'double_glazing',
	blueprint_compat = false,
    enhancement_gate = 'm_glass',
	loc_txt = {
		name = 'Double Glazing',
		text = {
			"{C:attention}Glass cards{} are half as",
			"likely to be destroyed"
		}
	},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return { vars = { G.GAME.probabilities.normal or 1, 8 } }
    end,
	config = { },
	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 0 },
	cost = 6,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('NeoShard1', false)
    end
}