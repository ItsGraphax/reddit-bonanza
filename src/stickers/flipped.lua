-- card:flip() hook
local flip_ref = Card.flip
function Card:flip()
    if self.ability.reddit_flipped then
        -- copied from card.lua
        if self.facing == 'front' then 
            self.flipping = 'f2b'
            self.facing='back'
            self.pinch.x = true
        end
        return
    end
    -- before hook
    ret = flip_ref(self)
    -- after hook
    return ret  
end

SMODS.Sticker {
    key = 'flipped',
    rate = 0.2,
    needs_enable_flag = true,
    apply = function(self, card, val)
        card.cost = 5
        card:flip()
        card.ability[self.key] = val
    end
}