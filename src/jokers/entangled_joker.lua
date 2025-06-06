-- Entangled Joker
local awaiting_load = false
function get_joker_idx(joker)
    for idx, card in ipairs(G.jokers.cards) do
        if joker == card then
            return idx
        end
    end
    return 0
end

local og_save_run = save_run
function save_run()
    -- load needs to be performed before we overwrite
    if awaiting_load then
        for ej, copied in pairs(G.GAME.r_entangled_indices) do
            G.jokers.cards[ej].ability.extra.other_joker = G.jokers.cards[copied]
        end
        awaiting_load = false
    end
    G.GAME.r_entangled_indices = {}
    for idx, card in ipairs(G.jokers.cards) do
        if card.config.center.key == 'j_reddit_entangled_joker' then
            G.GAME.r_entangled_indices[idx] = get_joker_idx(card.ability.extra.other_joker)
        end
    end

    og_save_run()
end
SMODS.Joker {
	key = 'entangled_joker',
	blueprint_compat = true,
	loc_txt = {
		name = 'Entangled Joker',
		text = {
			"Copies the ability",
            "of a random {C:attention}Joker{}, changes",
            "when blind is selected",
            "{C:inactive}(Currently: #1#){}",
		}
	},
    
	config = { extra = { other_joker = nil } },
    
    load = function (self, card, card_table, other_card)
        awaiting_load = true
        G.E_MANAGER:add_event(Event{
            func = function()
                -- load has been taken care of
                if awaiting_load == false then return true end
                local this_idx = get_joker_idx(card)
                card.ability.extra.other_joker = G.jokers.cards[G.GAME.r_entangled_indices[this_idx]]
                awaiting_load = false
                return true
            end
        })
    end,
    loc_vars = function(self, info_queue, card)
        local compat_str = nil
        local compat_color = nil
        if 
            not card.ability.extra.other_joker or
            not card.ability.extra.other_joker.config.center.blueprint_compat 
        then
            compat_str = " " .. localize("k_incompatible") .. " "
            compat_color = mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8)
        else 
            compat_str = " " .. localize("k_compatible") .. " "
            compat_color = mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
        end
        -- the compatibilty ui
        main_end = { {
            n = G.UIT.C,
            config = { align = "cm", minh = 0.4 },
            -- the background colour
            nodes = {
                {
                    n = G.UIT.C,
                    config = { align = "cm", colour = compat_color, r = 0.05, padding = 0.06 },
                    -- the text node
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = { text = compat_str, colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 }
                        }
                    }
                }
            }
        } }
        if not card.ability.extra.other_joker then return { vars = { "None" } } end
		return { vars = { localize{
            type = "name_text", 
            set = "Joker", 
            key = card.ability.extra.other_joker.config.center.key
        }}, main_end = main_end }
	end,

	rarity = 3,
	atlas = 'reddit_jokers',
	pos = { x = 1, y = 4 },
	cost = 8,
    -- Because there's no context for
    -- destroyed jokers we have to check every frame
    update = function (self, card, dt)
        local target = card.ability.extra.other_joker
        if target == nil then return end
        if get_joker_idx(target) == 0 then card.ability.extra.other_joker = nil end
    end,
	calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local valid_cards = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    valid_cards[#valid_cards+1] = G.jokers.cards[i]
                end
            end
            card.ability.extra.other_joker = pseudorandom_element(valid_cards, pseudoseed('j_reddit_entangled'))
        end
        return SMODS.blueprint_effect(card, card.ability.extra.other_joker, context)
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('by u/TSAMarioYTReddit', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE)
    end
}