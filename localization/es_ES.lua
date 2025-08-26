return {
    descriptions = {
        Back = {},
        Blind = {},
        Edition = {},
        Enhanced = {},
        Joker = {
            j_reddit_abstinent_joker = {
                name = 'Comodín abstinente',
                text = {
                    "{C:chips}+#2#{} fichas por cada",
                    "carta jugada con el palo",
                    "de {C:clubs}#1#{} cuando anota",
                }
            },
            j_reddit_triplets = {
                name = 'Trillizos',
                text = {
                    'Cada {C:attention}3{} que anota otorga',
                    '{C:chips}+#1#{} fichas, {C:mult}+#2#{} multi y {C:money}$#3#{}'
                }
            },
            j_reddit_up_the_sleeve = {
                name = 'Bajo la manga',
                text = {
                    '{C:white,X:mult}X#1#{} multi por cada',
                    '{C:attention}as{} sin sacar en tu baraja',
                    '{C:inactive}(Actual: {C:white,X:mult}X#2#{C:inactive} multi)'
                }
            },
            j_reddit_richard = {
                name = 'Richard',
                text = {
                    'Gana {C:chips}+#1#{} fichas cada {C:attention}mano{}',
                    '{C:inactive}(Actual: {C:chips}#2#{C:inactive} fichas)'
                }
            },
            j_reddit_doppelganger = {
                name = 'Doble falso',
                text = {
                    'Cuando la {C:attention}ciega{} es derrotada con',
                    'al menos el {C:attention}doble{} de lo requerido,',
                    'se agrega una copia permanente de la ',
                    'última carta jugada y se saca a la mano'
                }
            },
            j_reddit_ace_up_your_sleeve = {
                name = 'As en la manga',
                text = {
                    'Cuando comienza la ronda,',
                    'agrega un {C:attention}as{} con',
                    'una {C:attention}edición{} y {C:attention}sello{}',
                    'aleatorios a tu mano'
                }
            },
            j_reddit_ad_break = {
                name = 'Pausa publicitaria',
                text = {
                    "Los efectos {C:attention}al final de la ronda{}",
                    "se activan después de cada",
                    "mano jugada"
                }
            },
            j_reddit_album_cover = {
                name = 'Portada de álbum',
                text = {
                    "Todos los paquetes potenciadores contienen",
                    "una carta extra"
                }
            },
            j_reddit_all_in = {
                name = 'Todo o Nada',
                text = {
                    "{X:mult,C:white}X#1#{} multi",
                    "Pierde todo tu dinero cuando se",
                    "selecciona la {C:attention}ciega{}"
                }
            },
            j_reddit_slot_machine = {
                name = 'Tragaperras', -- this name is funny
                text = {
                    'Pierde {C:mult}$#1#{} por carta anotada',
                    'Gana entre {C:money}$#2#{} y',
                    '{C:money}$#3#{} al final de la ronda'
                }
            },
            j_reddit_roasted_marshmallow = {
                name = 'Malvavisco asado',
                text = {
                    '{C:white,X:red}X#1#{} multi',
                    '{C:green}#2# en #3#{} probabilidad',
                    'de que la carta se destruya',
                    'cuando la mano excede lo',
                    'requerido'
                }
            },
            j_reddit_artist = {
                name = 'Artista',
                text = {
                    "{C:attention}+#1#{} tamaño de mano",
                    "por cada {C:attention}comodín",
                    "con una edición",
                    "{C:inactive}(Actual: {C:attention}+#2#{C:inactive} tamaño de mano){}"
                }
            },
            j_reddit_bingo = {
                name = '¡Bingo!',
                text = {
                    "Gana {C:money}$#1#{} cuando se ha jugado",
                    "una carta de cada categoría",
                    "{C:inactive}(Jugado: #2#){}"
                }
            },
            j_reddit_birbal = {
                name = 'Birbal',
                text = {
                    "{X:mult,C:white}X#1#{} multi cuando un",
                    "{C:attention}comodín{} es activado",
                }
            },
            j_reddit_blank_joker = {
                name = 'Comodín en blanco',
                text = {
                    "Vende esta carta después de ",
                    "derrotar {C:attention}#1#{} ciegas jefe para",
                    " crear una ranura de {C:attention}comodín{} adicional",
                    "{C:inactive}(Actual {C:attention}#2#{C:inactive}/{C:attention}#1#{C:inactive})"
                }
            },
            j_reddit_cashback = {
                name = 'Reembolso',
                text = {
                    'Gana {C:money}$#1# {C:attention}del valor de venta',
                    'en cada compra'
                }
            },
            j_reddit_charitable_joker = {
                name = 'Comodín Caritativo',
                text = {
                    "{C:chips}+#2#{} fichas por cada",
                    "carta jugada con el palo",
                    "de {C:diamonds}#1#{} cuando anota",
                }
            },
            j_reddit_chaste_joker = {
                name = 'Comodín Casto',
                text = {
                    "{C:chips}+#2#{} fichas por cada",
                    "carta jugada con el palo",
                    "de {C:hearts}#1#{} cuando anota",
                }
            },
            j_reddit_chocolate_treadmill = {
                name = 'Caminadora de chocolate',
                text = {
                    "Este comodín gana {C:attention}+1 mano{}",
                    "y, pierde {X:chips,C:white}X#5#{} fichas si la mano",
                    "jugada contiene una {C:attention}escalera{}, de lo ",
                    "contrario gana {X:chips,C:white}X#4#{} fichas.",
                    "{C:inactive}(Actual: {C:attention}#1# #2#{C:inactive} y {C:chips}+#3# Fichas{C:inactive})"
                }
            },
            j_reddit_contagious_laughter = {
                name = 'Risa contagiosa',
                text = {
                    "{C:mult}+#1#{} multi",
                    "Cuando se selecciona la {C:attention}ciega{},",
                    "reemplaza el comodín a la derecha ",
                    "con una copia {C:dark_edition}negativa{} de",
                    "{C:attention}Risa contagiosa{}"
                }
            },
            j_reddit_con_artist = {
                name = 'Estafador',
                text = {
                    "Elige una carta extra de",
                    "cualquier {C:attention}paquete potenciador{}"
                }
            },
            j_reddit_crimson_dawn = {
                name = 'Amanecer carmesí',
                text = {
                    "Reactivas todas las",
                    "cartas de puntos en la {C:attention}primera{}",
                    "{C:attention}mano{} de la ronda"
                }
            },
            j_reddit_diamond_pickaxe = {
                name = 'Pico de diamante',
                text = {
                    "{C:green}#1# en #2#{} probabilidad de",
                    "ganar {C:money}$#3#{} al descartar",
                    "cualquier {C:attention}Carta Mejorada{}"
                }
            },
            j_reddit_double_glazing = {
                name = 'Doble acristalamiento',
                text = {
                    "Las {C:attention}Cartas de vidrio{} tienen la mitad de",
                    "probabilidad de ser destruidas"
                }
            },
            j_reddit_engagement_ring = {
                name = 'Anillo de compromiso',
                text = {
                    '{C:green}#1# en #2#{} probabilidad de reactivar',
                    'las cartas jugadas con el',
                    'palo de {C:diamonds}#3#'
                }
            },
            j_reddit_enigma = {
                name = 'Enigma',
                text = {
                    "{C:green}#1# en #2#{} probabilidad de ",
                    "crear una carta {C:blue}Espectral",
                    "{C:dark_edition}Negativa{} cuando se use una ",
                    "carta de {C:tarot}tarot {}o {C:planet}planeta{}"
                }
            },
            j_reddit_entangled_joker = {
                name = 'Comodín enredado',
                text = {
                    "Copia la habilidad de",
                    "un {C:attention}comodín{} aleatorio, cambia",
                    "cuando se selecciona ciega",
                    "{s:0.8}No se puede copiar Comodín enredado{}",
                    "{C:inactive}(Actual: #1#){}",
                }
            },
            j_reddit_feelin_lucky = {
                name = 'Me Siento Afortunado',
                text = {
                    "Probabilidad de {C:green}#1# en #2#{} de",
                    "reactivar cartas {C:clubs}#3#{}",
                    "{C:attention}de la suerte{} tres veces"
                }
            },
            j_reddit_glass_house = {
                name = 'Casa de vidrio',
                text = {
                    "Mejora la última carta jugada",
                    "en una {C:attention}carta de vidrio{} si",
                    "la mano jugada contiene un", 
                    "{C:attention}#1#{}"
                }
            },
            j_reddit_haunted_house = {
                name = 'Casa embrujada',
                text = {
                    "{C:green}#1# en #2#{} probabilidad de crear",
                    "una {C:blue}Carta Espectral{} cuando la",
                    "mano jugada contiene un {C:attention}#3#{}"
                }
            },
            j_reddit_hi_five = {
                name = 'Choca esos cinco',
                text = {
                    "Gana {C:money}$#1#{} por cada",
                    "{C:money}#2#{} en tu mazo",
                    "{C:inactive}(Actual: {C:attention}$#3#{C:inactive}){}"
                }
            },
            j_reddit_hollow_point = {
                name = 'Punto hueco',
                text = {
                    "{C:mult}+#1#{} multi por cada",
                    "ranura de {C:attention}comodín{} vacía.",
                    "{s:0.8}Punto hueco incluido{}",
                    "{C:inactive}(Actual: {C:mult}+#2#{C:inactive})"
                }
            },
            j_reddit_jimbos_loss = {
                name = 'La pérdida de Jimbo',
                text = {
                    "Gana {X:mult,C:white}X#1#{} multi cuando",
                    "{C:attention}#2#{} o más cartas de {C:attention}figura{}",
                    "se descartan",
                    "{C:inactive}(Actual: {X:mult,C:white}X#3#{C:inactive} multi)"
                }
            },
            j_reddit_jokerdex = {
                name = 'Comodex',
                text = {
                    "{C:mult}+#1#{} multi por cada",
                    "comodín {C:attention}único{} obtenido",
                    "en esta partida",
                    "{C:inactive}(Actual: {C:mult}+#2#{C:inactive} multi)"
                }
            },
            j_reddit_kind_joker = {
                name = 'Comodín amable',
                text = {
                    "{C:chips}+#2#{} fichas por cada",
                    "carta jugada con el palo",
                    "de {C:spades}#1#{} cuando anota",
                }
            },
            j_reddit_kleptomaniac = {
                name = 'Cleptómano',
                text = {
                    "Reembolsa todos los {C:attention}artículos{} ",
                    "comprados en la {C:attention}tienda{}",
                    "{C:green} #1# en #2#{} probabilidad de perder todo el",
                    " dinero adeudado en vez de reembolsar",
                    "{C:inactive}Pierde el 30% del dinero", "{C:inactive}adeudado al vender{}",
                    "{C:inactive}(Actual: {C:money}#3#${C:inactive}){}"
                }
            },
            j_reddit_lamb = {
                name = 'Cordero',
                text = {
                    "Después de jugar cada",
                    "mano base, vende este {C:attention}comodín{}",
                    "para crear un comodín {C:legendary}Legendario{}",
                    "{C:inactive}(#1#/9){}"
                }
            },
            j_reddit_laundromat = {
                name = 'Lavandería',
                text = {
                    "Gana {C:money}$#1#{} por cada vez que superes",
                    "el requisito de {C:attention}ciega{} por un {C:attention}5%",
                    "El requisito se duplica con cada {C:money}$#1#",
                    "{C:inactive}(Máximo de {C:money}$#2#{C:inactive})"
                }
            },
            j_reddit_legally_distinct = {
                name = 'Legalmente distinto',
                text = {
                    'Todas las cartas cartas de {C:attention}figura{} jugadas',
                    'se convierten en {C:attention}cartas de acero{}',
                    'al puntuar'
                }
            },
            j_reddit_lets_go_gambling = {
                name = '¡Vamos a apostar!',
                text = {
                    'Crea una {C:purple}Rueda de la Fortuna',
                    'al final de cada ronda',
                }
            },
            j_reddit_marvin = {
                name = 'Marvin',
                text = {
                    '{X:mult,C:white}X#1#{} multi si',
                    'tienes {C:money}$#2#{} o menos'
                }
            },
            j_reddit_match3 = {
                name = 'Empareja 3',
                text = {
                    "Si al menos {C:attention}#1#{} cartas puntuadas",
                    "son de la misma {C:attention}categoría{}",
                    " y {C:attention}palo{}, gana {C:chips}+#2#{} fichas",
                    "y +{C:money}$#3#{} por cada",
                    "carta anotada que califique"
                }
            },
            j_reddit_medusa = {
                name = 'Medusa',
                text = {
                    'Todas las cartas cartas de {C:attention}figura{} jugadas',
                    'se convierten en {C:attention}cartas de piedra{}',
                    'al puntuar'
                }
            },
            j_reddit_metronome = {
                name = 'Metrónomo',
                text = {
                    "Gana {C:mult}+#1#{} multi si la mano ",
                    "jugada es igual a la segunda ",
                    "mano anterior, pero no la última",
                    "{C:inactive}(Actual: {C:mult}+#2#{C:inactive} multi)",
                    "{C:inactive}(Última Actual: {C:attention}#3#{C:inactive})",
                    "{C:inactive}(Antepenúltima Actual: {C:attention}#4#{C:inactive})"
                }
            },
            j_reddit_nichola = {
                name = 'Nichola',
                text = {
                    "Previene que la apuesta suba",
                    "{C:inactive}(Restante: {C:attention}#1#{C:inactive} veces)"
                }
            },
            j_reddit_oracle = {
                name = 'Oráculo',
                text = {
                    "Gana {X:mult,C:white}X#1#{} Multiplicador por",
                    "cada Carta{C:spectral} Espectral{} usada en esta",
                    "partida",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive})"
                }
            },
            j_reddit_pharaoh = {
                name = 'Faraón',
                text = {
                    'Gana {X:mult,C:white}X#1#{} Multiplicador cuando el dinero',
                    'obtenido es mayor que {C:money}$#2#',
                    '{C:inactive}(Aumenta en {C:money}$#3#{C:inactive} cada ronda)'
                }
            },
            j_reddit_phoenix = {
                name = 'Fénix',
                text = {
                    "{X:mult,C:white}X#1#{} multiplicador.",
                    "{C:green}#2# en #3#{} probabilidad de destruir",
                    "esta carta al final de",
                    "la ronda",
                    "{C:inactive}({X:mult,C:white}X1{C:inactive} y la mitad de la",
                    "{C:inactive}probabilidad de destrucción por{}",
                    "{C:attention}Fénix{C:inactive} destruido en esta",
                    "{C:attention}partida{C:inactive}){}"
                }
            },
            j_reddit_biker = {
                name = 'Motociclista',
                text = {
                    '{C:white,X:mult}X#1#{} Multiplicador por cada',
                    '{C:attention}Motociclista{} en poseción',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multiplicador)'
                }
            },
            j_reddit_gourmand = {
                name = 'Goloso',
                text = {
                    '+1 {C:attention}Espacio Consumible{}'
                }
            },
            j_reddit_butter_fingers = {
                name = 'Dedos de Mantequilla',
                text = {
                    'Cada carta descartada',
                    'gana {C:mult}+#1#{} Multiplicador'
                }
            },
            j_reddit_pier = {
                name = 'Muelle',
                text = {
                    "Si el primer descarte de la ronda",
                    "tiene solo 1 carta, obtiene",
                    "un sello aleatorio"
                }
            },
            j_reddit_plumber = {
                name = 'Fontanero',
                text = {
                    "Subir de nivel la mano {C:attention}Flush{}",
                    "sube de nivel todos los tipos de {C:attention}Flush{}"
                }
            },
            j_reddit_promotion = {
                name = 'Promoción',
                text = {
                    "Aumenta el rango de",
                    "{C:attention}primera{} carta puntuadora en {C:attention}1{}"
                }
            },
            j_reddit_rainbow = {
                name = 'Comodín Arcoíris',
                text = {
                    "Gana {X:mult,C:white}X1{} multi",
                    "por cada {C:attention}palo{} único",
                    "en las cartas que puntuan"
                }
            },
            j_reddit_rover = {
                name = 'Rover',
                text = {
                    'Gana {C:mult}+#1#{} Multiplicador por cada',
                    'Carta de {C:attention}Piedra jugada{}',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multiplicador)'
                }
            },
            j_reddit_savings_account = {
                name = 'Cuenta de Ahorros',
                text = {
                    "{C:chips}+#1#{} fichas por cada {C:money}$1{} de",
                    "{C:attention}interés{} ganado en esta",
                    "partida",
                    "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} fichas)"
                }
            },
            j_reddit_sinister_joker = {
                name = 'Comodín Siniestro',
                text = {
                    "Gana {X:mult,C:white}X#1#{} multiplicador por cada Comodín a la derecha",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} multiplicador)"
                }
            },
            j_reddit_slothful = {
                name = 'Comodín Perezoso',
                text = {
                    "Las cartas {C:attention}de Piedra{} puntuadas",
                    "dan {C:mult}+#1#{} mult"
                }
            },
            j_reddit_sphinx = {
                name = 'Esfinge de Cuarzo Negro',
                text = {
                    "Cuando se selecciona una {C:attention}Ciega{},",
                    "crea {C:attention}1{} {C:green}Comodín{} {C:attention}Poco Común",
                    "{C:inactive}(Debe haber espacio)"
                }
            },
            j_reddit_superstition = {
                name = 'Superstición',
                text = {
                    "{X:mult,C:white}X#1#{} multiplicador por cada {C:attention}7{}",
                    "en tu {C:attention}mazo completo{},",
                    "-{X:mult,C:white}X#1#{} multiplicador por cada 6",
                    "en tu {C:attention}mazo completo{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive}){}"
                }
            },
            j_reddit_touchdown = {
                name = 'Touchdown',
                text = {
                    "Gana {C:mult}+#1#{} multiplicador",
                    "una vez que las cartas",
                    "puntuadas superen {C:attention}#2#{}",
                    "{C:inactive}(Actualmente {C:mult}+#3#{C:inactive} mult)",
                    "{C:inactive}(Total actual: {C:attention}#4#{C:inactive})"
                }
            },
            j_reddit_trippy = {
                name = 'Comodín Psicodélico',
                text = {
                    "Gana {X:mult,C:white}X#1#{} mult",
                    "si la mano jugada es {C:attention}#2#{},",
                    "se reinicia de lo contrario",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#3#{C:inactive} multiplicador)"
                }
            },
            j_reddit_where_is_joker = {
                name = '¿Dónde está el Comodín?',
                text = {
                    "Da el valor de venta",
                    "del {C:attention}Comodín{} más a la izquierda al",
                    "final de la ronda",
                    "{C:inactive}(Máx {C:money}$#1#{C:inactive})",
                    "{C:inactive}(Actualmente: {C:money}$#2#{C:inactive}){}"
                }
            },
            j_reddit_wild_west = {
                name = 'Lejano Oeste',
                text = {
                    "{X:mult,C:white}X#1#{} multiplicador si la mano jugada",
                    "contiene {C:attention}3 o más cartas salvajes{}"
                }
            },
            j_reddit_wizard = {
                name = 'Mago',
                text = {
                    "{C:attention}+#1#{} Espacios Consumibles.",
                    "{C:chips}+#2#{} fichas por cada",
                    "consumible en posesión",
                    "{C:inactive}(Actualmente: {C:chips}+#3#{C:inactive} fichas){}"
                }
            },
        },
        Other = {
            items = {
                name = 'Artículos',
                text = {
                    'Vales, paquetes potenciadores',
                    'comodines, consumibles y',
                    'cartas de juego'
                }
            }
        },
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {},
        Tarot = {},
        Voucher = {},
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            b_reddit_enable_bonanza_packs = 'Habilitar Paquetes Bonanza (¡Requiere Reinicio!)',
            b_reddit_enable_joker_overrides = 'Habilitar Reemplazo de Comodines (¡Requiere Reinicio!)',
            a_hand_singular = "mano",
            a_hand_plural = "manos",
        },
        high_scores = {},
        labels = {},
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