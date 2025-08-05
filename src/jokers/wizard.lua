-- Wizard
SMODS.Joker {
	key = 'wizard',
	blueprint_compat = true,
	
	config = { extra = { slots = 3, chips = 40 } },
    loc_vars = function(self, info_queue, card)
        local consumeable_count = 0
        if G.consumeables then consumeable_count = #G.consumeables.cards end
		return { vars = { 
            card.ability.extra.slots, 
            card.ability.extra.chips, 
            card.ability.extra.chips * consumeable_count
        } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 2, y = 4 },
	cost = 6,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slots
                return true
            end }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit - (card.ability.extra.slots or 3)
                return true
            end }))
    end,

	calculate = function(self, card, context)
        if context.joker_main then
			return {
				chips = card.ability.extra.chips * #G.consumeables.cards
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}
