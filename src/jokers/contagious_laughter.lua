-- Contagious Laugter
SMODS.Joker {
	key = 'contagious_laughter',
	blueprint_compat = true,
	loc_txt = {
		name = 'Contagious Laughter',
		text = {
            "{C:mult}+#1#{} Mult",
			"When {C:attention}Blind{} is selected, replace",
            "Joker to the right with a {C:dark_edition}Negative{}",
            "copy of {C:attention}Contagious Laughter{}"
		}
	},

	config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,

	rarity = 2,
	
	atlas = 'reddit_jokers',
	pos = { x = 1, y = 5 },

	cost = 6,

	calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and
            not G.jokers.cards[my_pos + 1].ability.eternal and
            not G.jokers.cards[my_pos + 1].getting_sliced and
            G.jokers.cards[my_pos + 1].config.center_key ~= 'j_reddit_contagious_laughter' then
                local infect_card = G.jokers.cards[my_pos + 1]
                G.E_MANAGER:add_event(Event({
                    func = function()
                        infect_card:set_ability('j_reddit_contagious_laughter')
                        infect_card:set_edition('e_negative')
                        return true
                    end
                }))
                return {
                    message = "Infected!"
                }
            end
        elseif context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('USER', false)
	end
}
