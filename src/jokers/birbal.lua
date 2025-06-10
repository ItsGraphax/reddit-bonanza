-- Birbal
SMODS.optional_features.post_trigger = true
SMODS.get_optional_features()
SMODS.Joker {
	key = "birbal",
    blueprint_compat = true,
	loc_txt = {
        name = 'Birbal',
        text = {
            "{X:mult,C:white}X#1#{} mult when a",
            "{C:attention}joker{} is triggered",
        }
    },
    config = { extra = { xmult = 2, in_scoring = false } },
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    rarity = 4,
	calculate = function (self, card, context)
        if context.before then card.ability.extra.in_scoring = true end
		if context.post_trigger and card.ability.extra.in_scoring then
			return {
				Xmult = card.ability.extra.xmult
			}
		end
        if context.after then card.ability.extra.in_scoring = false end
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}