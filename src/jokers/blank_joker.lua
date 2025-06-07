-- Blank Joker
SMODS.Joker {
	key = 'blank_joker',
	blueprint_compat = true,
	loc_txt = {
		name = 'Blank Joker',
		text = {
			"Sell this card after beating",
			"{C:attention}#1#{} Boss Blinds",
			"to create an extra {C:attention}Joker Slot{}",
			"{C:inactive}(Currently {C:attention}#2#{C:inactive}/{C:attention}#1#{C:inactive})"
		}
	},

	config = { extra = { total_bosses = 2, current_bosses = 0, blind = false } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.total_bosses, card.ability.extra.current_bosses } }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 5, y = 2 },
	cost = 8,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			card.ability.extra.blind = context.blind.boss
		end

        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint and
		card.ability.extra.blind then
			card.ability.extra.current_bosses = card.ability.extra.current_bosses + 1
			if card.ability.extra.current_bosses >= card.ability.extra.total_bosses then
				local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
			end
			return {
				message = "Boss Beaten!"
			}
		end

		if context.selling_self and
		card.ability.extra.current_bosses >= card.ability.extra.total_bosses then
			G.jokers:change_size(1)
			return {
				message = "+1 Slot!"
			}
		end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('WarmTranslator6633', false)
    end
}
