-- All In
SMODS.Joker {
	key = 'phoenix',
	blueprint_compat = true,
    eternal_compat = false,
	loc_txt = {
		name = 'Phoenix',
		text = {
			"{X:mult,C:white}X#1#{} mult.",
			"{C:green}#2# in #3#{} chance to destroy",
			"this card at the end of",
            "round",
            "{C:inactive}({X:mult,C:white}X1{C:inactive} and half the",
            "{C:inactive}odds of destruction per{}",
            "{C:attention}Phoenix{C:inactive} destroyed this",
            "{C:attention}run{C:inactive}){}"
		}
	},

	config = { extra = { being_sold = false } },
    loc_vars = function(self, info_queue, card)
		return { vars = { 
            G.GAME.reddit_phoenix_mult or 1, 
            G.GAME.probabilities.normal or 1,
            G.GAME.reddit_phoenix_odds or 1,
        } }
	end,
    remove_from_deck = function(self, card, from_debuff)
        -- not from debuff or selling
        if not from_debuff and not card.ability.extra.being_sold then
            G.GAME.reddit_phoenix_mult = G.GAME.reddit_phoenix_mult + 1
            G.GAME.reddit_phoenix_odds = G.GAME.reddit_phoenix_odds * 2
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.reddit_phoenix_mult = G.GAME.reddit_phoenix_mult or 1
        G.GAME.reddit_phoenix_odds = G.GAME.reddit_phoenix_odds or 1
    end,
	rarity = 1,
	atlas = 'reddit_jokers',
	pos = { x = 1, y = 6 },
	cost = 3,
	calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            card.ability.extra.being_sold = true
		end
		if context.joker_main then
			return {
				xmult = G.GAME.reddit_phoenix_mult
			}
		end
        if context.end_of_round and context.main_eval and not context.blueprint then
            if pseudorandom('j_reddit_bird') < G.GAME.probabilities.normal / G.GAME.reddit_phoenix_odds then
                card.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))
            end
        end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
    end
}
