-- Gourmand
SMODS.Joker {
	key = 'gourmand',
	blueprint_compat = false,
	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 1,
	
	atlas = 'reddit_jokers',
	pos = { x = 6, y = 7 },

	cost = 4,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                return true
            end }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
                return true
            end }))
    end,

	calculate = function(self, card, context)
        -- CALCULATE
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Cuddly_Corvid', false)
	end
}
