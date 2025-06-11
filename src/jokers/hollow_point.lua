-- Hollow Point
SMODS.Joker {
	key = 'hollow_point',
	blueprint_compat = true,
	loc_txt = {
		name = 'Hollow Point',
		text = {
			"{C:mult}+#1#{} Mult for each",
			"empty {C:attention}Joker{} slot.",
            "{s:0.8}Hollow Point included{}",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive})"
		}
	},

	config = { extra = { mult_fac = 5 } },
    loc_vars = function(self, info_queue, card)
        local mult = 0
        if G.jokers then
            mult = card.ability.extra.mult_fac * math.max(
                G.jokers.config.card_limit - 
                #G.jokers.cards + 
                #SMODS.find_card('j_reddit_hollow_point', true), 0)
        end
		return { vars = { 
            card.ability.extra.mult_fac,
            -- we still need the max for the case of overflowing joker slots
            mult
        } }
	end,

	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 4, y = 6 },
	cost = 6,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult_fac * math.max(
                    G.jokers.config.card_limit - 
                    #G.jokers.cards + 
                    #SMODS.find_card('j_reddit_hollow_point', true), 0)
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Omicra98', false)
    end
}
