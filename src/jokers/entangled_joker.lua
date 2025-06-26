-- Entangled Joker
local awaiting_load = 0
local get_joker_idx = function(joker)
    for idx, card in ipairs(G.jokers.cards) do
        if joker == card then
            return idx
        end
    end
    return 0
end

-- Syncs the indices of all entangled jokers
local sync_ej = function ()
    -- load needs to be performed before we overwrite
    if awaiting_load > 0 then
        for ej, copied in pairs(G.GAME.r_entangled_indices) do
            G.jokers.cards[ej].ability.extra.other_joker = G.jokers.cards[copied]
            awaiting_load = awaiting_load - 1
        end
    end
    G.GAME.r_entangled_indices = {}
    for idx, card in ipairs(G.jokers.cards) do
        if card.config.center.key == 'j_reddit_entangled_joker' then
            G.GAME.r_entangled_indices[idx] = get_joker_idx(card.ability.extra.other_joker)
        end
    end
end

local og_save_run = save_run
function save_run()
    sync_ej()
    og_save_run()
end

-- We need to override this as 
-- copying entangled joker causes a stack overflow when copying the other jokers area
local og_copy_card = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    if other.config.center.key ~= 'j_reddit_entangled_joker' then 
        return og_copy_card(other, new_card, card_scale, playing_card, strip_edition)
    end
    local new_card = new_card or Card(other.T.x, other.T.y, G.CARD_W*(card_scale or 1), G.CARD_H*(card_scale or 1), G.P_CARDS.empty, G.P_CENTERS.c_base, {playing_card = playing_card, bypass_back = G.GAME.selected_back.pos})
    new_card:set_ability(other.config.center)
    new_card.ability.type = other.ability.type
    new_card:set_base(other.config.card)
    for k, v in pairs(other.ability) do
        if k == 'extra' then 
            new_card.ability['extra'] = { other_joker = v.other_joker }
        else
            if type(v) == 'table' then 
                new_card.ability[k] = copy_table(v)
            else
                new_card.ability[k] = v
            end
        end
    end

    if not strip_edition then 
        new_card:set_edition(other.edition or {}, nil, true)
        for k,v in pairs(other.edition or {}) do
            if type(v) == 'table' then
                new_card.edition[k] = copy_table(v)
            else
                new_card.edition[k] = v
            end
        end
    end
    check_for_unlock({type = 'have_edition'})
    new_card:set_seal(other.seal, true)
    if other.seal then
        for k, v in pairs(other.ability.seal or {}) do
            if type(v) == 'table' then
                new_card.ability.seal[k] = copy_table(v)
            else
                new_card.ability.seal[k] = v
            end
        end
    end
    if other.params then
        new_card.params = other.params
        new_card.params.playing_card = playing_card
    end
    new_card.debuff = other.debuff
    new_card.pinned = other.pinned
    
    return new_card
end


SMODS.Joker {
	key = 'entangled_joker',
	blueprint_compat = true,
	    
	config = { extra = { other_joker = nil } },
    
    load = function (self, card, card_table, other_card)
        awaiting_load = awaiting_load + 1
        G.E_MANAGER:add_event(Event{
            func = function()
                -- load has been taken care of
                if awaiting_load <= 0 then return true end
                local this_idx = get_joker_idx(card)
                card.ability.extra.other_joker = G.jokers.cards[G.GAME.r_entangled_indices[this_idx]]
                awaiting_load = awaiting_load - 1
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

        info_queue[#info_queue+1] = copy_table(card.ability.extra.other_joker.config.center)
        info_queue[#info_queue].config = card.ability.extra.other_joker.ability
        
        
		return { vars = { localize{
            type = "name_text", 
            set = "Joker", 
            key = card.ability.extra.other_joker.config.center.key
        } .. ' #' .. tostring(get_joker_idx(card.ability.extra.other_joker)) }, 
        main_end = main_end }
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
                if 
                    G.jokers.cards[i].config.center.key ~= card.config.center.key and
                    G.jokers.cards[i].config.center.blueprint_compat
                then
                    valid_cards[#valid_cards+1] = G.jokers.cards[i]
                end
            end
            card.ability.extra.other_joker = pseudorandom_element(valid_cards, pseudoseed('j_reddit_entangled'))
        end
        return SMODS.blueprint_effect(card, card.ability.extra.other_joker, context)
	end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = credit_badge('TSAMarioYTReddit', false)
    end
}