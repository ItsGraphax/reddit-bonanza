-- Medusa
SMODS.Joker {
	key = 'medusa',
	blueprint_compat = true,
	
	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS['m_stone']
		return { vars = {  } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 1, y = 2 },
	cost = COST,
	calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    faces = faces + 1
                    scored_card:set_ability('m_stone', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if faces > 0 then
                return {
                    message = 'Stone!',
                    colour = G.C.MONEY
                }
            end
        end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('PerfectAstronaut5998', false)
		badges[#badges+1] = create_badge('art by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR_ALT, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}