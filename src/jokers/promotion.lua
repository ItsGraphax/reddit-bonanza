-- Promotion
SMODS.Joker {
	key = 'promotion',
	blueprint_compat = true,
	loc_txt = {
		name = 'Promotion',
		text = {
			"Increase Rank of",
            "{C:attention}first{} scoring Card by {C:attention}1{}"
		}
	},

	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 6, y = 6 },

	cost = 6,

	calculate = function(self, card, context)
        if context.before and context.main_eval then
            assert(SMODS.modify_rank(context.scoring_hand[1], 1))
            return {
                message = 'Promotion!'
            }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('USER', false)
	end
}
