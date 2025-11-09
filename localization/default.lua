return {
    descriptions = {
        Back = {},
        Blind = {
            bl_reddit_spotlight = {
                name = 'The Spotlight',
                text = {
                    'Non-enhanced cards',
                    'are drawn face down'
                }
            },
            bl_reddit_gourmet= {
                name = 'The Gourmet',
                text = {
                    'All cards are debuffed',
                    'until a consumable is',
                    'used or sold'
                }
            },
        },
        Edition = {},
        Enhanced = {
            m_reddit_mmc = {
                name = 'Surprise!',
                text = {
                    'You have just catched an {C:attention}ultra rare{} bug!',
                    'Here, have some {C:white,X:mult}x1.5{} Mult (Don\'t tell anyone!)',
                    '{C:inactive}PS: I dont know atm how to fix it so please don\'t report this'
                },
            }
        },
        Joker = {
            j_reddit_abstinent_joker = {
                name = 'Abstinent Joker',
                text = {
                    'Played cards with',
                    '{C:clubs}#1#{} suit give',
                    '{C:chips}+#2#{} Chips when scored'
                }
            },
            j_reddit_triplets = {
                name = 'Triplets',
                text = {
                    'Each scored {C:attention}3{} gives',
                    '{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult and {C:money}$#3#{}'
                }
            },
            j_reddit_up_the_sleeve = {
                name = 'Up the Sleeve',
                text = {
                    '{C:white,X:mult}X#1#{} Mult for',
                    'every undrawn {C:attention}Ace{} in deck',
                    '{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)'
                }
            },
            j_reddit_richard = {
                name = 'Richard',
                text = {
                    'Gains {C:chips}+#1#{} Chips every played {C:attention}hand{}',
                    '{C:inactive}(Currently {C:chips}#2#{C:inactive} Chips)'
                }
            },
            j_reddit_doppelganger = {
                name = 'Doppelganger',
                text = {
                    'When {C:attention}Blind{} is defeated with',
                    'at least {C:attention}double{} the requirement,',
                    'add a permanent copy of the last',
                    'played card and draw it to hand'
                }
            },
            j_reddit_ace_up_your_sleeve = {
                name = 'Ace Up Your Sleeve',
                text = {
                    'When round begins,',
                    'add an {C:attention}Ace{} with',
                    'a random {C:attention}Edition{} and',
                    '{C:attention}Seal{} to your hand'
                }
            },
            j_reddit_ad_break = {
                name = 'Ad Break',
                text = {
                    "{C:attention}End of round{} effects",
                    "trigger after every",
                    "hand played"
                }
            },
            j_reddit_album_cover = {
                name = 'Album Cover',
                text = {
                    "All {C:attention}Booster Packs{} contain",
                    "an extra card"
                }
            },
            j_reddit_all_in = {
                name = 'All In',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "Lose all money when",
                    "{C:attention}Blind{} is selected"
                }
            },
            j_reddit_slot_machine = {
                name = 'Slot Machine',
                text = {
                    'Lose {C:mult}$#1#{} per card scored',
                    'Earn between {C:money}$#2#{} and',
                    '{C:money}$#3#{} at end of round'
                }
            },
            j_reddit_roasted_marshmallow = {
                name = 'Roasted Marshmallow',
                text = {
                    '{C:white,X:red}X#1#{} Mult',
                    '{C:green}#2# in #3#{} chance this joker',
                    'gets destroyed when current',
                    'hand exceeds blind score'
                }
            },
            j_reddit_artist = {
                name = 'Artist',
                text = {
                    "{C:attention}+#1#{} hand size",
                    "for every {C:attention}Joker",
                    "with an {C:attention}edition",
                    "{C:inactive}(Currently {C:attention}+#2#{C:inactive} hand size){}"
                }
            },
            j_reddit_bingo = {
                name = 'Bingo!',
                text = {
                    "Earn {C:money}$#1#{} when a card",
                    "of every rank has been played",
                    "{C:inactive}(Currently played: #2#){}"
                }
            },
            j_reddit_birbal = {
                name = 'Birbal',
                text = {
                    "{X:mult,C:white}X#1#{} Mult when a",
                    "{C:attention}Joker{} is triggered",
                }
            },
            j_reddit_blank_joker = {
                name = 'Blank Joker',
                text = {
                    "Sell this card after",
                    "defeating {C:attention}#1# Boss Blinds",
                    "to create an extra {C:attention}Joker Slot{}",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)"
                }
            },
            j_reddit_cashback = {
                name = 'CashBack',
                text = {
                    'Gains {C:money}$#1#{} of {C:attention}sell value',
                    'for every purchase'
                }
            },
            j_reddit_charitable_joker = {
                name = 'Charitable Joker',
                text = {
                    'Played cards with',
                    '{C:diamonds}#1#{} suit give',
                    '{C:chips}+#2#{} Chips when scored'
                }
            },
            j_reddit_chaste_joker = {
                name = 'Chaste Joker',
                text = {
                    'Played cards with',
                    '{C:hearts}#1#{} suit give',
                    '{C:chips}+#2#{} Chips when scored'
                }
            },
            j_reddit_chocolate_treadmill = {
                name = 'Chocolate Treadmill',
                text = {
                    "Gains {C:attention}+1 hand{} and",
                    "loses {X:chips,C:white}X#5#{} Chips if played",
                    "hand contains a {C:attention}Straight{},",
                    "gains {X:chips,C:white}X#4#{} Chips otherwise",
                    "{C:inactive}(Curently {C:attention}#1# #2#{C:inactive} and {C:chips}+#3# Chips{C:inactive})"
                }
            },
            j_reddit_contagious_laughter = {
                name = 'Contagious Laughter',
                text = {
                    "{C:mult}+#1#{} Mult",
                    "When {C:attention}Blind{} is selected, replace",
                    "Joker to the right with a {C:dark_edition}Negative{}",
                    "copy of {C:attention}Contagious Laughter{}",
                    "{C:inactive}(Excluding Contagious Laughter){}"
                }
            },
            j_reddit_demon_core = {
                name = "Demon Core",
                text = {
                    "Retrigger all played cards",
                    "{C:attention}#2#{} times,",
                    "{C:chips}-#1#{} hands each round"
                }
            },
            j_reddit_con_artist = {
                name = 'Con Artist',
                text = {
                    "Choose an extra card",
                    "from any {C:attention}Booster Pack{}"
                }
            },
            j_reddit_crimson_dawn = {
                name = 'Crimson Dawn',
                text = {
                    "Retrigger all played",
                    "cards in {C:attention}first",
                    "{C:attention}hand{} of round"
                }
            },
            j_reddit_diamond_pickaxe = {
                name = 'Diamond Pickaxe',
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "earn {C:money}$#3#{} when discarding any",
                    "{C:attention}Enhanced Card{}"
                }
            },
            j_reddit_double_glazing = {
                name = 'Double Glazing',
                text = {
                    "{C:attention}Glass Cards{} have a",
                    "{C:green}#1# in #2#{} chance of being",
                    "destroyed"
                }
            },
            j_reddit_engagement_ring = {
                name = 'Engagement Ring',
                text = {
                    '{C:green}#1# in #2#{} chance to retrigger',
                    'played cards with {C:diamonds}#3#',
                    "suit"
                }
            },
            j_reddit_enigma = {
                name = 'Enigma',
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a random {C:dark_edition}Negative {C:blue}Spectral{}",
                    "card when a {C:tarot}Tarot or",
                    "{C:planet}Planet{} card is used"
                }
            },
            j_reddit_entangled_joker = {
                name = 'Entangled Joker',
                text = {
                    "Copies the ability",
                    "of a random {C:attention}Joker{}, changes",
                    "when {C:attention}Blind{} is selected",
                    "{s:0.8}Cannot copy Entangled Joker{}",
                    "{C:inactive}(Currently: #1#){}",
                }
            },
            j_reddit_feelin_lucky = {
                name = 'Feelin\' Lucky',
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "retrigger {C:attention}Lucky{}",
                    "{C:clubs}#3#{} cards thrice"
                }
            },
            j_reddit_glass_house = {
                name = 'Glass House',
                text = {
                    "Enhances last played card",
                    "into a {C:attention}Glass Card{} if",
                    "played hand contains a {C:attention}#1#{}"
                }
            },
            j_reddit_haunted_house = {
                name = 'Haunted House',
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a random {C:blue}Spectral{} card if ",
                    "played hand contains a",
                    "{C:attention}#3#{}"
                }
            },
            j_reddit_hi_five = {
                name = 'Hi Five',
                text = {
                    "Earn {C:money}$#1#{} per {C:attention}#2#{} in",
                    "your deck when sold",
                    "{C:inactive}(Currently {C:money}$#3#{C:inactive}){}"
                }
            },
            j_reddit_hollow_point = {
                name = 'Hollow Point',
                text = {
                    "{C:mult}+#1#{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Hollow Point included{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive})"
                }
            },
            j_reddit_jimbos_loss = {
                name = 'Jimbo\'s Loss',
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult when",
                    "discarding {C:attention}#2#{} or more ",
                    "{C:attention}face cards{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
                }
            },
            j_reddit_jokerdex = {
                name = 'Jokerdex',
                text = {
                    "{C:mult}+#1#{} Mult for every",
                    "unique {C:attention}Joker{} obtained",
                    "this run",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_reddit_kind_joker = {
                name = 'Kind Joker',
                text = {
                    'Played cards with',
                    '{C:spades}#1#{} suit give',
                    '{C:chips}+#2#{} Chips when scored'
                }
            },
            j_reddit_kleptomaniac = {
                name = 'Kleptomaniac',
                text = {
                    "Refund all {C:attention}items{} bought",
                    "in the {C:attention}shop{}",
                    "{C:green} #1# in #2#{} chance to lose",
                    "all refunded money instead",
                    "{C:inactive}Lose 30% of refunded",
                    "{C:inactive}money on sell{}",
                    "{C:inactive}(Currently {C:money}$#3#{C:inactive}){}"
                }
            },
            j_reddit_lamb = {
                name = 'Lamb',
                text = {
                    "After playing every base",
                    "{C:attention}Poker Hand{}, sell this card to",
                    "create a random {C:legendary}Legendary{} {C:attention}Joker",
                    "{C:inactive}(#1#/9){}"
                }
            },
            j_reddit_laundromat = {
                name = 'Laundromat',
                text = {
                    "Earn {C:money}$#1#{} for each time you exceed",
                    "the {C:attention}Blind{} score requirement by {C:attention}5%",
                    "Requirement doubles with every {C:money}$#1#",
                    "{C:inactive}(Max of {C:money}$#2#{C:inactive})",
                }
            },
            j_reddit_legally_distinct = {
                name = 'Legally Distinct',
                text = {
                    'All played {C:attention}face{} cards',
                    'become {C:attention}Steel Cards{}',
                    'when scored'
                }
            },
            j_reddit_lets_go_gambling = {
                name = 'Let\'s go Gambling!',
                text = {
                    'Creates a {C:purple}Wheel of Fortune',
                    'at the end of every round'
                }
            },
            j_reddit_marvin = {
                name = 'Marvin',
                text = {
                    '{X:mult,C:white}X#1#{} Mult if',
                    'you have {C:money}$#2#{} or less'
                }
            },
            j_reddit_match3 = {
                name = 'Match 3',
                text = {
                    "If at least {C:attention}#1#{} scored",
                    "cards are of the same",
                    "{C:attention}rank{} and {C:attention}suit{}, {C:chips}+#2#{} Chips",
                    "and {C:money}$#3#{} for every",
                    "scored qualifying card"
                }
            },
            j_reddit_medusa = {
                name = 'Medusa',
                text = {
                    "All played {C:attention}face{} cards",
                    "become {C:attention}Stone Cards",
                    "when scored"
                }
            },
            j_reddit_metronome = {
                name = 'Metronome',
                text = {
                    "Gains {C:mult}+#1#{} Mult if",
                    "played hand is same as",
                    "second last hand, but not last",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                    "{C:inactive}(Current Last: {C:attention}#3#{C:inactive})",
                    "{C:inactive}(Current Second Last: {C:attention}#4#{C:inactive})"
                }
            },
            j_reddit_nichola = {
                name = 'Nichola',
                text = {
                    "Prevents the {C:attention}Ante{} from",
                    "increasing {C:attention}#1#{} #2#",
                }
            },
            j_reddit_oracle = {
                name = 'Oracle',
                text = {
                    "{X:mult,C:white}X#1#{} Mult per {C:spectral}Spectral{}",
                    "card used this run",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive})"
                }
            },
            j_reddit_pharaoh = {
                name = 'Pharaoh',
                text = {
                    '{X:mult,C:white}X#1#{} Mult if',
                    'you have {C:money}$#2#{} or more',
                    '{C:inactive}(Increases by {C:money}$#3#{C:inactive} every round)'
                }
            },
            j_reddit_phoenix = {
                name = 'Phoenix',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:green}#2# in #3#{} chance to destroy",
                    "this card at the end of round",
                    "Gains {X:mult,C:white}X#4#{} Mult and {C:attention}halves",
                    "probability of destruction when",
                    "this card destroys itself"
                }
            },
            j_reddit_biker = {
                name = 'Biker',
                text = {
                    '{C:white,X:mult}X#1#{} Mult for each',
                    '{C:attention}Biker{} in possession',
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
                }
            },
            j_reddit_gourmand = {
                name = 'Gourmand',
                text = {
                    '{C:attention}+1{} consumable slot'
                }
            },
            j_reddit_butter_fingers = {
                name = 'Butter Fingers',
                text = {
                    'Every {C:attention}discarded{} card',
                    'gains {C:mult}+#1#{} Mult'
                }
            },
            j_reddit_pier = {
                name = 'Pier',
                text = {
                    "If {C:attention}first discard{} of round",
                    "has only {C:attention}1{} card, add",
                    "a random seal"
                }
            },
            j_reddit_plumber = {
                name = 'Plumber',
                text = {
                    "Leveling up one {C:attention}#1#{} type",
                    "levels up all {C:attention}#1#{} types"
                }
            },
            j_reddit_promotion = {
                name = 'Promotion',
                text = {
                    "Increase rank of",
                    "{C:attention}first{} scoring card by {C:attention}1{}"
                }
            },
            j_reddit_rainbow = {
                name = 'Rainbow Joker',
                text = {
                    "{X:mult,C:white}X1{} Mult",
                    "per unique {C:attention}suit{}",
                    "in scoring hand"
                }
            },
            j_reddit_rover = {
                name = 'Rover',
                text = {
                    'Gains {C:mult}+#1#{} Mult per {C:attention}Stone',
                    '{C:attention}Card{} scored',
                    '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)'
                }
            },
            j_reddit_savings_account = {
                name = 'Savings Account',
                text = {
                    "{C:chips}+#1#{} Chips for every {C:money}$1{} of",
                    "{C:attention}interest{} earned this run",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_reddit_sinister_joker = {
                name = 'Sinister Joker',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Joker{} to the right",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_reddit_slothful = {
                name = 'Slothful Joker',
                text = {
                    "Played {C:attention}Stone Cards{}",
                    "give {C:mult}+#1#{} Mult when scored"
                }
            },
            j_reddit_sphinx = {
                name = 'Sphinx of Black Quartz',
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "create a random {C:green}Uncommon{} {C:attention}Joker",
                    "{C:inactive}(Must have room)"
                }
            },
            j_reddit_superstition = {
                name = 'Superstition',
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult for every {C:attention}7{}",
                    "in your {C:attention}full deck{},",
                    "Loses {X:mult,C:white}X#1#{} Mult for every {C:attention}6",
                    "in your {C:attention}full deck{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive}){}"
                }
            },
            j_reddit_touchdown = {
                name = 'Touchdown',
                text = {
                    "Gains {C:mult}+#1#{} Mult",
                    "once playing cards",
                    "scores exceed {C:attention}#2#{}",
                    "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
                    "{C:inactive}(Current total: {C:attention}#4#{C:inactive})"
                }
            },
            j_reddit_trippy = {
                name = 'Trippy Joker',
                text = {
                    "{X:mult,C:white}X#1#{} Mult for each",
                    "{C:attention}consecutive #2#{} played",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
                }
            },
            j_reddit_where_is_joker = {
                name = 'Where is Joker?',
                text = {
                    "Earn the sell value",
                    "of the {C:attention}leftmost joker{} at",
                    "end of round",
                    "{C:inactive}(Max {C:money}$#1#{C:inactive})",
                    "{C:inactive}(Currently: {C:money}$#2#{C:inactive}){}"
                }
            },
            j_reddit_wild_west = {
                name = 'Wild West',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played hand",
                    "contains {C:attention}3{} or more {C:attention}Wild Cards{}"
                }
            },
            j_reddit_wizard = {
                name = 'Wizard',
                text = {
                    "{C:attention}+#1#{} consumable slots,",
                    "{C:chips}+#2#{} Chips for every",
                    "consumable held",
                    "{C:inactive}(Currently: {C:chips}+#3#{C:inactive} Chips){}"
                }
            },
            -- i can't be bothered to alphabetize it rn; TheNeto06
            -- me neither; ItsGraphax

            j_reddit_event_horizon = {
                name = 'Event Horizon',
                text = {
                    '{C:green}#3# in #4#{} chance to {C:attention}destroy{}',
                    'a card when scored,',
                    '{X:mult,C:white}X#1#{} Mult for every destroyed',
                    '{C:attention}scoring card', 
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
                }
            },
            j_reddit_sisyphean_task = {
                name = "Sisyphean Task",
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult when each",
                    "played {C:attention}Stone Card{} is scored. Resets",
                    "after playing a {C:attention}High Card{} or {C:attention}Pair{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_reddit_golden_retriever = { 
                name = 'Golden Retriever',
                text = {
                    'Add a {C:attention}Gold Card{} with a',
                    '{C:attention}Gold Seal{} at the start',
                    'of every round'
                }
            },
            j_reddit_ore_vein = { 
                name = 'Ore Vein',
                text = {
                    '{C:attention}Stone Cards{} also',
                    'count as {C:attention}Gold Cards{}'
                }
            },
            j_reddit_waiting = {
                name = 'Waiting',
                text = {
                    'This Joker becomes a copy',
                    'of the next {C:rare}Rare{} Joker you',
                    'obtain. If no {C:rare}Rare{} Jokers',
                    'are acquired in {C:attention}#2#{} rounds,',
                    'this card is {C:attention}destroyed',
                    '{C:inactive}(Currently {C:attention#1#{C:inactive}/#2#)'
                }
            },
            j_reddit_lemonade = {
                name = 'Lemonade',
                text = {
                    '{C:white,X:mult}X#1#{} Mult',
                    'Loses {C:white,X:mult}X#2#{} for each',
                    'card sold or destroyed'
                }
            },
            j_reddit_meninblack = {
                name = 'Secret Agent',
                text = {
                    'After {C:attention}#1#{} #3#, sell this card to',
                    'create a random {C:rare}Rare{} Joker',
                    '{C:inactive}(Must have room)',
                    '{C:inactive}({C:attention}#2#{C:inactive} remaining)'
                }
            },
            j_reddit_notfunny = {
                name = 'Not Funny',
                text = {
                    'All {C:attention}Jokers{} to the left',
                    'of this card are {C:attention}disabled{}',
                    'when a hand is played,',
                    '{X:mult,C:white}X#1#{} Mult for every Joker',
                    'disabled this way',
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)',
                    '{C:inactive,s:0.7}({C:dark_edition,s:0.7}Negative{C:inactive,s:0.7} Jokers excluded)'
                }
            },
            j_reddit_toiletpaper = {
                name = 'Toilet Paper',
                text = {
                    '{X:mult,C:white}X#1#{} Mult for',
                    'every {C:planet}Uranus{} card used,',
                    'resets when a {C:attention}Flush',
                    'is played',
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
                }
            },
            j_reddit_4head = {
                name = '4Head',
                text = {
                    'Gives {X:mult,C:white}X#1#{} Mult for',
                    'every {C:attention}#2# face{} cards',
                    'in your {C:attention}full deck',
                    '{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)'
                }
            },
            j_reddit_newspaper = {
                name = 'Frontpage',
                text = {
                    'When round begins,',
                    'draw {C:attention}#1#{} extra cards'
                }
            },
            j_reddit_thunderstruck = {
                name = 'Thunderstruck',
                text = {
                    '{C:green}#1# in #2#{} chance to',
                    'retrigger adjacent {C:attention}Jokers'
                }
            },
            j_reddit_sweetener = {
                name = 'Artificial Sweetener',
                text = {
                    'The next {C:attention}#1#{} created {C:attention}consumable',
                    'cards become {C:dark_edition}Negative{}'
                }
            },
            j_reddit_decalcomania = {
                name = 'Decalcomania',
                text = {
                    '{C:green}#1# in #2#{} chance to add',
                    '{C:attention}Foil{}, {C:attention}Holographic{}, or',
                    '{C:attention}Polychrome{} edition to',
                    'played scoring cards'
                }

            },
            j_reddit_class_notes = {
                name = 'Class Notes',
                text = {
                    'Copies ability of',
                    '{C:attention}Joker{} to the left,',
                    '{C:green}#1# in #2#{} chance to',
                    '{C:attention}destroy{} itself at the',
                    'end of round'
                }
            },
            j_reddit_tough_crowd = {
                name = 'Tough Crowd',
                text = {
                    'Retrigger', 
                    'each played',
                    '{C:attention}6{}, {C:attention}7{}, {C:attention}8{}, or {C:attention}9'
                }
            },
            j_reddit_distinguished = {
                name = 'Distinguished',
                text = {
                    'When {C:attention}Blind{} is selected,',
                    '{C:attention}Wild Cards{} gain an',
                    'additional {C:attention}Enhancement{},',
                    'changes every round',
                    '{C:inactive}(Currently #1#)'
                }
            },
            j_reddit_pizza = {
                name = "Pizza",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "Loses {X:mult,C:white}X#2#{} Mult per round played"
                }
            },
            j_reddit_mad = {
                name = 'M.A.D.',
		        text = {
                    "Sell this Joker to defeat",
                    "this {C:attention}Blind{}, increase",
                    "{C:attention}Ante{} by {C:attention}1{} and set",
                    "money to {C:money}$0{}"
                }
            },
            j_reddit_snowman = {
                name = 'Snowman',
                text = {
                    'This Joker gains {C:chips}+#1#{} Chips',
                    'per scoring {C:attention}Bonus Card{} played,',
                    'removes card {C:attention}Enhancement',
                    '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)'
                }
            },
            j_reddit_molotov = {
                name = 'Molotov',
                text = {
                    '{C:attention}+#1#{} hand size if scoring',
                    'requirement is {C:attention}exceeded{}',
                    'in one hand',
                    '{S:1.1,C:red,E:2}self destructs'
                }
            },
            j_reddit_thalia = {
                name = 'Thalia',
                text = {
                    'All cards in {C:attention}first',
                    '{C:attention}discard{} of round',
                    'are converted to',
                    '{C:attention}Wild 8s'
                }
            },
            j_reddit_seal_clubber = {
                name = "Seal Clubber",
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult per",
                    "scoring card with a {C:attention}seal{},",
                    "removes {C:attention}seal{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_reddit_ufo = {
                name = 'Unidentified Flying Object',
                text = {
                    'Levels up a random {C:attention}poker hand{} once',
                    'for every {C:attention}unique{} hand type played',
                    'this round at the end of round'
                }
            },
            j_reddit_sheet_music = {
                name = 'Sheet Music',
                text = {
                    'Earn {C:money}$#1#{} when each played',
                    '{C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, or {C:attention}4{} is scored'
                }
            },
            j_reddit_irises = {
                name = "Irises",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played hand",
                    "contains at least {C:attention}#2#{} unique",
                    "{C:attention}Enhancements{}"
                }
            },
            j_reddit_crown = {
                name = "Crown",
                text = {
                    "Earn {C:money}$#1#{} if played hand",
                    "is a {C:attention}#2#{}"
                }
            },
            j_reddit_ping_pong = {
                name = "Ping Pong",
                text = {
                    "Retrigger all scored {C:attention}Playing{}",
                    "{C:attention}Cards{} if you have {C:attention}#1#{} or fewer",
                    "{C:attention}Jokers{}",
                    "{C:inactive}(Ping Pong included){}"
                }
            },
            j_reddit_grenade_png = {
                name = "PNG of a grenade",
                text = {
                    "If hand has {C:attention}#1#{} scoring",
                    "cards, destroy {C:attention}this Joker{}",
                    "and all {C:attention}played cards{}"
                }
            },
            j_reddit_aleister = {
                name = "Aleister",
                text = {
                    "Played {C:attention}Jacks{} gain a random",
                    "{C:attention}edition{}, {C:attention}enhancement{} and",
                    "{C:attention}seal{}"
                }
            },
            j_reddit_pineapple = {
                name = "Pineapple",
                text = {
                    "{X:mult,C:white}X#1#{} or {X:mult,C:white}X0{} Mult,",
                    "Alternates every round.",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            }
        },
        Other = {
            p_reddit_bonanza_pack1 = {
                name = "Bonanza Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
                    "{V:1}Reddit Bonanza{} Jokers",
                },
            },
            p_reddit_bonanza_pack2 = {
                name = "Bonanza Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
                    "{V:1}Reddit Bonanza{} Jokers"
                },
            },
            p_reddit_bonanza_pack_jumbo1 = {
                name = "Jumbo Bonanza Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
                    "{V:1}Reddit Bonanza{} Jokers"
                },
            },
            p_reddit_bonanza_pack_mega1 = {
                name = "Mega Bonanza Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
                    "{V:1}Reddit Bonanza{} Jokers"
                },
            },

            items = {
                name = 'Items',
                text = {
                    'Vouchers, Booster Packs',
                    'Jokers, Consumables and',
                    'playing cards'
                }
            },
            -- reddit_flipped = 'The joker is flipped' -- Why is it breaking :<
        },
        Planet = {},
        Spectral = {
        --     -- Card Czar compatibility (why did he hardcode it :pepehands:)
        --     c_talisman = {
        --         text = {
        --             "Add a {C:attention}Gold Seal{}",
        --             "to {C:attention}#1#{} selected",
        --             "card in your hand"
        --         }
        --     },
        --     c_deja_vu = {
        --         text = {
        --             "Add a {C:attention}Red Seal{}",
        --             "to {C:attention}#1#{} selected",
        --             "card in your hand"
        --         }
        --     },
        --     c_trance = {
        --         text = {
        --             "Add a {C:attention}Blue Seal{}",
        --             "to {C:attention}#1#{} selected",
        --             "card in your hand"
        --         }
        --     },
        --     c_medium = {
        --         text = {
        --             "Add a {C:attention}Purple Seal{}",
        --             "to {C:attention}#1#{} selected",
        --             "card in your hand"
        --         }
        --     },
        --     c_wraith = {
        --         text = {
        --             "Creates a random",
        --             "{C:red}Rare{C:attention} Joker{},",
        --             "sets money to {C:money}$#1#",
        --         }
        --     },
        --     c_black_hole = {
        --         text = {
        --             "Upgrade every",
        --             "{C:legendary,E:1}poker hand",
        --             "by {C:attention}#1#{} level",
        --         }
        --     }
        },
        Stake = {},
        Tag = {
            tag_reddit_reddit = { -- this isn't gonna get confusing
                name = 'Bonanza Tag',
                text = {
                    'Gives a free',
                    '{C:attention}Mega Bonanza Pack'
                }
            }
        },
        Tarot = {},
        Voucher = {
            v_reddit_trolley_problem = {
                name = "Trolley Problem",
                text = {
                    "When skipping a {C:attention}blind{}, choose",
                    "between 2 available tags"
                }
            },
            v_reddit_track_drift = {
                name = "Multi-Track Drift",
                text = {
                    "When skipping a {C:attention}blind{},",
                    "gain 2 tags"
                }
            },
            v_reddit_deterioration = {
                name = 'Deterioration',
                text = {
                    '{C:red}X0.75{} base {C:attention}Blind{} size'
                }
            },
            v_reddit_decay = {
                name = 'Decay',
                text = {
                    '{C:red}X0.5{} base {C:attention}Blind{} size'
                }
            }
        }
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            b_reddit_enable_bonanza_packs = 'Enable Bonanza Packs (Requires Restart!)',
            b_reddit_enable_joker_overrides = 'Enable Joker Overrides (Requires Restart!)',
            b_reddit_enable_dev_jokers = 'Enable Development Jokers (Requires Restart!)',

            k_empty_ex = "Empty!",
            k_up_ex = "Up!",
            k_none = "None",
            reddit_bonanza_pack = 'Bonanza Pack',

            a_hand_singular = "hand",
            a_hand_plural = "hands",
            a_times_singular = "time",
            a_times_plural = "times",
        },
        high_scores = {},
        labels = {
            reddit_flipped = 'Flipped'
        },
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {},
        v_text = {},
    },
}
