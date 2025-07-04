-- Artist
function count_editions()
    if not G.jokers then return 0 end
    local num_editions = 0
    for _, card in pairs(G.jokers.cards) do
        if card.edition then num_editions = num_editions + 1 end
    end
    return num_editions
end
SMODS.Joker {
	key = 'artist',
	blueprint_compat = false,
	
	config = { extra = { hand_size_mod = 1, num_editions = 0 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { 
            card.ability.extra.hand_size_mod,
            card.ability.extra.hand_size_mod * card.ability.extra.num_editions
        } }
	end,
    remove_from_deck =  function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_size_mod * card.ability.extra.num_editions)
    end,
    update = function (self, card, dt)
        local new_editions = count_editions()
        if card.ability.extra.num_editions ~= new_editions and not card.getting_sliced then
            local old_hand_size = card.ability.extra.hand_size_mod * card.ability.extra.num_editions
            local new_hand_size = card.ability.extra.hand_size_mod * new_editions
            card.ability.extra.num_editions = new_editions
            if card.area == G.jokers then
                G.hand:change_size(new_hand_size - old_hand_size)
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        -- reapply hand size
        G.hand:change_size(card.ability.extra.hand_size_mod * card.ability.extra.num_editions)
    end,

	rarity = 2,
	atlas = 'reddit_jokers',
	pos = { x = 3, y = 4 },
	cost = 5,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}
