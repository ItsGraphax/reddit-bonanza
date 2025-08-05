-- Plumber
local og_lv_up = level_up_hand
function level_up_hand(card, hand, instant, amount)
    local plumber_hands = {
        "Flush",
        "Flush Five",
        "Flush House",
        "Straight Flush"
    }
    local plumber_cards = SMODS.find_card('j_reddit_plumber')
    if not next(plumber_cards) then return og_lv_up(card, hand, instant, amount) end
    if amount < 1 then return og_lv_up(card, hand, instant, amount) end
    local card = plumber_cards[1]
    for i = 1, #plumber_hands do
        if hand == plumber_hands[i] then
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname='Flush Hands',chips = '...', mult = '...', level=''})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true end }))
            update_hand_text({delay = 0}, {mult = '+', StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true end }))
            update_hand_text({delay = 0}, {chips = '+', StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true end }))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})
            delay(1.3)
            for index, flush_hand in ipairs(plumber_hands) do
                og_lv_up(plumber_cards[1], flush_hand, true)
            end
            return
        end
    end
    og_lv_up(card, hand, instant, amount)
end
SMODS.Joker {
	key = 'plumber',
	blueprint_compat = false,
	
	config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

	rarity = 1,
	
	atlas = 'reddit_jokers',
	pos = { x = 7, y = 0 },

	cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('Kid4U_Reddit', false)
	end
}
