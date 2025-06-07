function do_skip(tags_to_add)
    for k, tag in ipairs(tags_to_add) do
        add_tag(tag)
    end
    local skipped, skip_to = G.GAME.blind_on_deck or 'Small', 
    G.GAME.blind_on_deck == 'Small' and 'Big' or G.GAME.blind_on_deck == 'Big' and 'Boss' or 'Boss'
    G.GAME.round_resets.blind_states[skipped] = 'Skipped'
    G.GAME.round_resets.blind_states[skip_to] = 'Select'
    G.GAME.blind_on_deck = skip_to
    play_sound('generic1')
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        delay(0.3)
        for i = 1, #G.jokers.cards do
          G.jokers.cards[i]:calculate_joker({skip_blind = true})
        end
        save_run()
        for i = 1, #G.GAME.tags do
          G.GAME.tags[i]:apply_to_run({type = 'immediate'})
        end
        for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
        end
        return true
      end
    }))
end
G.FUNCS.skip_blind = function(e)
    stop_use()
    G.CONTROLLER.locks.skip_blind = true
    G.E_MANAGER:add_event(Event({
        no_delete = true,
        trigger = 'after',
        blocking = false,blockable = false,
        delay = 2.5,
        timer = 'TOTAL',
        func = function()
          G.CONTROLLER.locks.skip_blind = nil
          return true
        end
      }))
    local _tag = e.UIBox:get_UIE_by_ID('tag_container')
    G.GAME.skips = (G.GAME.skips or 0) + 1
    if _tag then 
      do_skip({_tag.config.ref_table[1]})
    end
  end
G.FUNCS.skip_blind2 = function(e)
    stop_use()
    G.CONTROLLER.locks.skip_blind = true
    G.E_MANAGER:add_event(Event({
        no_delete = true,
        trigger = 'after',
        blocking = false,blockable = false,
        delay = 2.5,
        timer = 'TOTAL',
        func = function()
          G.CONTROLLER.locks.skip_blind = nil
          return true
        end
      }))
    local _tag = e.UIBox:get_UIE_by_ID('tag_container')
    G.GAME.skips = (G.GAME.skips or 0) + 1
    if _tag then 
      do_skip({_tag.config.ref_table[2]})
    end
  end
G.FUNCS.skip_blind3 = function(e)
    stop_use()
    G.CONTROLLER.locks.skip_blind = true
    G.E_MANAGER:add_event(Event({
        no_delete = true,
        trigger = 'after',
        blocking = false,blockable = false,
        delay = 2.5,
        timer = 'TOTAL',
        func = function()
          G.CONTROLLER.locks.skip_blind = nil
          return true
        end
      }))
    local _tag = e.UIBox:get_UIE_by_ID('tag_container_track')
    G.GAME.skips = (G.GAME.skips or 0) + 1
    if _tag then 
      do_skip(_tag.config.ref_table)
    end
end
function SMODS.current_mod.reset_game_globals(run_start)
    if G.GAME.round_resets.blind_states.Boss == 'Defeated' or not G.GAME.round_resets.blind_tags2 then
        G.GAME.round_resets.blind_tags2 = {}
        local tag_options = {}
        for key, _ in pairs(G.P_TAGS) do
            tag_options[#tag_options+1] = key
        end
        G.GAME.round_resets.blind_tags2['Small'] = pseudorandom_element(tag_options, pseudoseed('v_reddit_trolley'))
        G.GAME.round_resets.blind_tags2['Big'] = pseudorandom_element(tag_options, pseudoseed('v_reddit_trolley'))
    end
end
function create_UIBox_blind_tag(blind_choice, run_info)
  G.GAME.round_resets.blind_tags = G.GAME.round_resets.blind_tags or {}
  if not G.GAME.round_resets.blind_tags[blind_choice] then return nil end
  local _tag = Tag(G.GAME.round_resets.blind_tags[blind_choice], nil, blind_choice) 
  local _tag2 = Tag(G.GAME.round_resets.blind_tags2[blind_choice], nil, blind_choice)
  
  local _tag_ui, _tag_sprite = _tag:generate_UI()
  local _tag_ui2, _tag_sprite2 = _tag2:generate_UI()

  _tag_sprite.states.collide.can = not not run_info
  _tag_sprite2.states.collide.can = not not run_info

  if G.GAME.track_active then
    _tag_sprite.states.collide.can = true
    _tag_sprite2.states.collide.can = true
    return {n=G.UIT.C, config={id = 'tag_container_track', ref_table = {_tag, _tag2}, align = "cm"}, nodes={
        {n=G.UIT.R, config={align = 'tm', minh = 0.65}, nodes={
            {n=G.UIT.T, config={text = localize('k_or'), scale = 0.55, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}},
        }},
        {n=G.UIT.R, config={id = 'tags_'..blind_choice, align = "cm", r = 0.1, padding = 0.1, can_collide = true, ref_table = {_tag_sprite, _tag_sprite2}}, nodes={
            _tag_ui, _tag_ui2
        }},
        not run_info and {n=G.UIT.R, config={align = "cm", colour = G.C.UI.BACKGROUND_INACTIVE, minh = 1, minw = 1, padding = 0.07, r = 0.1, shadow = true, hover = true, one_press = true, button = 'skip_blind3', ref_table = _tag}, nodes={
            {n=G.UIT.T, config={text = localize('b_skip_blind'), scale = 0.4, colour = G.C.UI.TEXT_INACTIVE}}
        }} or {n=G.UIT.R, config={align = "cm", padding = 0.1, emboss = 0.05, colour = mix_colours(G.C.BLUE, G.C.BLACK, 0.4), r = 0.1, maxw = 2, minh = 1}, nodes={
            {n=G.UIT.T, config={text = localize('b_skip_reward'), scale = 0.35, colour = G.C.WHITE}},
        }}
    }}
  end


  local final_ui = {n=G.UIT.R, config={id = 'tag_container', ref_table = {_tag, _tag2}, align = "cm"}, nodes={
    {n=G.UIT.R, config={align = 'tm', minh = 0.65}, nodes={
      {n=G.UIT.T, config={text = localize('k_or'), scale = 0.55, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}},
    }},
    {n=G.UIT.R, config={id = 'tag_'..blind_choice, align = "cm", r = 0.1, padding = 0.1, minw = 1, can_collide = true, ref_table = _tag_sprite}, nodes={
     {n=G.UIT.C, config={id = 'tag_desc', align = "cm", minh = 1}, nodes={
        _tag_ui
      }},
      not run_info and {n=G.UIT.C, config={align = "cm", colour = G.C.UI.BACKGROUND_INACTIVE, minh = 0.6, minw = 2, maxw = 2, padding = 0.07, r = 0.1, shadow = true, hover = true, one_press = true, button = 'skip_blind1', func = 'hover_tag_proxy', ref_table = _tag}, nodes={
        {n=G.UIT.T, config={text = localize('b_skip_blind'), scale = 0.4, colour = G.C.UI.TEXT_INACTIVE}}
      }} or {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, colour = mix_colours(G.C.BLUE, G.C.BLACK, 0.4), r = 0.1, maxw = 2}, nodes={
        {n=G.UIT.T, config={text = localize('b_skip_reward'), scale = 0.35, colour = G.C.WHITE}},
      }},
    }},
  }}

  if G.GAME.trolley_active then
    final_ui.nodes[3] = 
      {n=G.UIT.R, config={id = 'tag2_'..blind_choice, align = "cm", r = 0.1, padding = 0.1, minw = 1, can_collide = true, ref_table = _tag_sprite2}, nodes={
        {n=G.UIT.C, config={id = 'tag_desc', align = "cm", minh = 1}, nodes={
          _tag_ui2
        }},
        not run_info and {n=G.UIT.C, config={align = "cm", colour = G.C.UI.BACKGROUND_INACTIVE, minh = 0.6, minw = 2, maxw = 2, padding = 0.07, r = 0.1, shadow = true, hover = true, one_press = true, button = 'skip_blind2', func = 'hover_tag_proxy', ref_table = _tag2}, nodes={
          {n=G.UIT.T, config={text = localize('b_skip_blind'), scale = 0.4, colour = G.C.UI.TEXT_INACTIVE}}
        }} or {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, colour = mix_colours(G.C.BLUE, G.C.BLACK, 0.4), r = 0.1, maxw = 2}, nodes={
          {n=G.UIT.T, config={text = localize('b_skip_reward'), scale = 0.35, colour = G.C.WHITE}},
        }},
      }}
  end

  return final_ui
end
local og_bc_handler = G.FUNCS.blind_choice_handler
G.FUNCS.blind_choice_handler = function (e)
    if G.GAME.track_active then
        if not e.config.ref_table.run_info and G.blind_select and G.blind_select.VT.y < 10 and e.config.id and G.blind_select_opts[string.lower(e.config.id)] then
            if (e.config.ref_table.deck ~= 'on' and e.config.id == G.GAME.blind_on_deck) or
            (e.config.ref_table.deck ~= 'off' and e.config.id ~= G.GAME.blind_on_deck) then
                local _tag = e.UIBox:get_UIE_by_ID('tags_'..e.config.id)
                local _tag_container = e.UIBox:get_UIE_by_ID('tag_container_track')
                local skip_btn = nil
                if _tag_container then skip_btn = _tag_container.children[3] end
                if e.config.id == G.GAME.blind_on_deck then
                    if _tag and _tag_container then
                        _tag_container.children[2].config.draw_after = false
                        _tag_container.children[2].config.colour = G.C.BLACK
                        skip_btn.config.button = 'skip_blind3'
                        _tag.config.outline_colour = adjust_alpha(G.C.BLUE, 0.5)
                        skip_btn.config.hover = true
                        skip_btn.config.colour = G.C.RED
                        skip_btn.children[1].config.colour = G.C.UI.TEXT_LIGHT
                        _tag.config.ref_table[1].config.force_focus = nil
                        _tag.config.ref_table[2].config.force_focus = nil
                    end
                elseif e.config.id ~= G.GAME.blind_on_deck then
                  if _tag and _tag_container then
                    if G.GAME.round_resets.blind_states[e.config.id] == 'Skipped' or
                       G.GAME.round_resets.blind_states[e.config.id] == 'Defeated' then
                      _tag_container.children[3]:set_role({xy_bond = 'Weak'})
                      _tag_container.children[2]:set_role({xy_bond = 'Weak'})
                      _tag_container.children[1]:set_role({xy_bond = 'Weak'})
                      _tag_container.children[3]:align(0, 10)
                      _tag_container.children[2]:align(0, 10)
                      _tag_container.children[1]:align(0, 10)
                    end
                    skip_btn.config.button = nil
                    _tag.config.outline_colour = G.C.UI.BACKGROUND_INACTIVE
                    skip_btn.config.hover = false
                    skip_btn.config.colour = G.C.UI.BACKGROUND_INACTIVE
                    skip_btn.children[1].config.colour = G.C.UI.TEXT_INACTIVE
                    _tag.config.ref_table[1].config.force_focus = true
                    _tag.config.ref_table[2].config.force_focus = true
                  end
                end
            end
        end
        og_bc_handler(e)
        return
    end

    if not G.GAME.trolley_active then
        og_bc_handler(e)
        return
    end
    -- trolley problem stuff
    if not e.config.ref_table.run_info and G.blind_select and G.blind_select.VT.y < 10 and e.config.id and G.blind_select_opts[string.lower(e.config.id)] then 
      if (e.config.ref_table.deck ~= 'on' and e.config.id == G.GAME.blind_on_deck) or
         (e.config.ref_table.deck ~= 'off' and e.config.id ~= G.GAME.blind_on_deck) then
          local _tag = e.UIBox:get_UIE_by_ID('tag2_'..e.config.id)
          local _tag_container = e.UIBox:get_UIE_by_ID('tag_container')
          if e.config.id == G.GAME.blind_on_deck then
            if _tag and _tag_container then 
              _tag_container.children[3].config.draw_after = false
              _tag_container.children[3].config.colour = G.C.BLACK
              _tag.children[2].config.button = 'skip_blind2'
              _tag.config.outline_colour = adjust_alpha(G.C.BLUE, 0.5)
              _tag.children[2].config.hover = true
              _tag.children[2].config.colour = G.C.RED
              _tag.children[2].children[1].config.colour = G.C.UI.TEXT_LIGHT
              local _sprite = _tag.config.ref_table
              _sprite.config.force_focus = nil
            end
          elseif e.config.id ~= G.GAME.blind_on_deck then
            if _tag and _tag_container then 
              if G.GAME.round_resets.blind_states[e.config.id] == 'Skipped' or
                 G.GAME.round_resets.blind_states[e.config.id] == 'Defeated' then
                _tag_container.children[3]:set_role({xy_bond = 'Weak'})
                _tag_container.children[3]:align(0, 10)
              end
              _tag.children[2].config.button = nil
              _tag.config.outline_colour = G.C.UI.BACKGROUND_INACTIVE
              _tag.children[2].config.hover = false
              _tag.children[2].config.colour = G.C.UI.BACKGROUND_INACTIVE
              _tag.children[2].children[1].config.colour = G.C.UI.TEXT_INACTIVE
              local _sprite = _tag.config.ref_table
              _sprite.config.force_focus = true
            end
          end
      end
    end
    og_bc_handler(e)
  end