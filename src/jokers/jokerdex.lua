-- Jokerdex
local og_add = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    og_add(self, from_debuff)
    if self.ability.set == 'Joker' then
        G.GAME.jokers_this_run = G.GAME.jokers_this_run or {}
        G.GAME.num_jokers_this_run = G.GAME.num_jokers_this_run or 0
        if not G.GAME.jokers_this_run[self.config.center.key] then
            G.GAME.jokers_this_run[self.config.center.key] = true
            G.GAME.num_jokers_this_run = G.GAME.num_jokers_this_run + 1
            SMODS.calculate_context({added_unique_joker = true})
        end
    end
end
local og_hover = Card.hover
function Card:hover()
    local jokerdexes = SMODS.find_card('j_reddit_jokerdex')
    if 
        self.ability.set == 'Joker' and
        next(jokerdexes) and 
        (self.area == G.shop_jokers or self.area == G.pack_cards) and
        not G.GAME.jokers_this_run[self.config.center.key]
    then
        G.E_MANAGER:add_event(Event({
            func = function ()
                for _, card in pairs(jokerdexes) do
                    card:juice_up(0.5, 0.5)
                end
                return true
            end
        }))
    end
    og_hover(self)
end
SMODS.Joker {
	key = 'jokerdex',
	blueprint_compat = true,
	
	config = { extra = { mult_per = 2 } },
    loc_vars = function(self, info_queue, card)
        G.GAME.num_jokers_this_run = G.GAME.num_jokers_this_run or 0
		return { vars = { card.ability.extra.mult_per, card.ability.extra.mult_per * G.GAME.num_jokers_this_run } }
	end,

	rarity = 1,
	
	atlas = 'reddit_jokers',
	pos = { x = 7, y = 3 },

	cost = 3,

	calculate = function(self, card, context)
        G.GAME.num_jokers_this_run = G.GAME.num_jokers_this_run or 0
        if context.joker_main then
            return {
                mult = card.ability.extra.mult_per * G.GAME.num_jokers_this_run
            }
        end
        if context.added_unique_joker then
            return {
                message = localize('k_upgrade_ex')
            }
        end
	end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Ethanlac', false)
	end
}