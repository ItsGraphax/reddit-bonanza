-- Jimbo's Loss
SMODS.Joker {
	key = 'jimbos_loss',
	blueprint_compat = true,
	
	config = { extra = { faces = 3, mult_mod = 0.2, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.faces, card.ability.extra.Xmult } }
	end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 3, y = 1 },
	cost = 6,
    calculate = function(self, card, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            local face_cards = 0
            for _, discarded_card in ipairs(context.full_hand) do
                if discarded_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards >= card.ability.extra.faces then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.mult_mod
				return {
					message = 'X'..tostring(card.ability.extra.Xmult),
					colour = G.C.MULT
				}
            end
        end
		if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('aTOMic_Games', false)
    end
}