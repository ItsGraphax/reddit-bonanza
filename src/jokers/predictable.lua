-- JOKER NAME
SMODS.Joker {
	key = 'predictable', -- Expected Value is also good, and maybe easier to make art for
	blueprint_compat = true,

	config = { extra = {mult = 4, dollars = 1} },
	loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS['m_lucky']
		return { vars = {card.ability.extra.mult, card.ability.extra.dollars} }
	end,

	rarity = 2, -- 1 for common through 4 for legendary
	
	atlas = 'reddit_jokers',
	pos = { x = 11, y = 7 },

	cost = 7,

	calculate = function(self, card, context)
         if context.individual and context.cardarea == G.hand and not context.end_of_round and SMODS.has_enhancement(context.other_card, 'm_lucky') then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    mult = card.ability.extra.mult,
                    dollars = card.ability.extra.dollars
                }
            end
        end
	end,

	set_badges = function(self, card, badges)
		badges[#badges+1] = credit_badge('Aggressive-Jacket819', false)
	end
}
