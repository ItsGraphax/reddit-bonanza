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
                    'última carta jugada y se saca a la {C:attention}mano'
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
                    'cuando la mano excede la',
                    'puntuacion requerida'
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
                    "{C:inactive}(Actual: {C:attention}#1# #2#{C:inactive} y {C:chips}+#3# fichas{C:inactive})"
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
                    "una carta {C:blue}espectral{} al azar cuando la",
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
                    "Previene que la {C:attention}apuesta{}",
                    "suba {C:attention}#1#{} #2#"
                }
            },
            j_reddit_oracle = {
                name = 'Oráculo',
                text = {
                    "{X:mult,C:white}X#1#{} multi por cada carta",
                    "{C:spectral}espectral{} usada en esta",
                    "partida",
                    "{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive})"
                }
            },
            j_reddit_pharaoh = {
                name = 'Faraón',
                text = {
                    '{X:mult,C:white}X#1#{} multi si',
                    'tienes {C:money}$#2#{} o más',
                    '{C:inactive}(Aumenta en {C:money}$#3#{C:inactive} cada ronda)'
                }
            },
            j_reddit_phoenix = {
                name = 'Fénix',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:green}#2# en #3#{} probabilidad de destruir",
                    "esta carta al final de la ronda",
                    "Gana {X:mult,C:white}X#4#{} multi y {C:attention}reduce{} la probabilidad",
                    "de destrucción {C:attention}por la mitad{} cuando esta",
                    "carta se destruye a sí misma"
                }
            },
            j_reddit_biker = {
                name = 'Motociclista',
                text = {
                    '{C:white,X:mult}X#1#{} multi por cada',
                    '{C:attention}Motociclista{} en poseción',
                    '{C:inactive}(Actual {X:mult,C:white}X#2#{C:inactive} multi)'
                }
            },
            j_reddit_gourmand = {
                name = 'Goloso',
                text = {
                    '{C:attention}+1{} ranura de consumible'
                }
            },
            j_reddit_butter_fingers = {
                name = 'Dedos de mantequilla',
                text = {
                    'Cada carta {C:attention}descartada',
                    'gana {C:mult}+#1#{} multi'
                }
            },
            j_reddit_pier = {
                name = 'Muelle',
                text = {
                    "Si el {C:attention}primer descarte{} de la ronda",
                    "tiene solo 1 carta, obtiene",
                    "un sello aleatorio"
                }
            },
            j_reddit_plumber = {
                name = 'Fontanero',
                text = {
                    "Subir de nivel la mano {C:attention}#1#{}",
                    "sube de nivel todos los tipos de {C:attention}#1#{}"
                }
            },
            j_reddit_promotion = {
                name = 'Promoción',
                text = {
                    "Aumenta la categoría de",
                    "{C:attention}primera{} carta anotada en {C:attention}1{}"
                }
            },
            j_reddit_rainbow = {
                name = 'Comodín arcoíris',
                text = {
                    "{X:mult,C:white}X1{} multi",
                    "por cada {C:attention}palo{} único",
                    "en las cartas que anotan"
                }
            },
            j_reddit_rover = {
                name = 'Rover',
                text = {
                    'Gana {C:mult}+#1#{} multi por cada',
                    '{C:attention}carta de piedra{} anotada',
                    '{C:inactive}(Actual: {C:mult}+#2#{C:inactive} multi)'
                }
            },
            j_reddit_savings_account = {
                name = 'Cuenta de ahorros',
                text = {
                    "{C:chips}+#1#{} fichas por cada {C:money}$1{} de",
                    "{C:attention}interés{} ganado en esta",
                    "partida",
                    "{C:inactive}(Actual {C:chips}+#2#{C:inactive} fichas)"
                }
            },
            j_reddit_sinister_joker = {
                name = 'Comodín siniestro',
                text = {
                    "{X:mult,C:white}X#1#{} multi",
                    "por cada comodín a la derecha",
                    "{C:inactive}(Actual {X:mult,C:white}X#2#{C:inactive} multi)"
                }
            },
            j_reddit_slothful = {
                name = 'Comodín perezoso',
                text = {
                    "Las {C:attention}cartas de piedra{} jugadas",
                    "dan {C:mult}+#1#{} multi cuando anotan"
                }
            },
            j_reddit_sphinx = {
                name = 'Esfinge de cuarzo negro',
                text = {
                    "Cuando se selecciona la {C:attention}ciega{},",
                    "crea un {C:attention}comodín{} {C:green}inusual{} al azar",
                    "{C:inactive}(Debe haber espacio)"
                }
            },
            j_reddit_superstition = {
                name = 'Superstición',
                text = {
                    "Gana {X:mult,C:white}X#1#{} multi por cada {C:attention}7{}",
                    "en tu {C:attention}baraja completa{},",
                    "Pierde {X:mult,C:white}X#1#{} multi por cada 6",
                    "en tu {C:attention}baraja completa{}",
                    "{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive}){}"
                }
            },
            j_reddit_touchdown = {
                name = 'Ensayo',
                text = {
                    "Gana {C:mult}+#1#{} multi una vez",
                    "que los puntos de las cartas",
                    "anotadas superen {C:attention}#2#{}",
                    "{C:inactive}(Actual: {C:mult}+#3#{C:inactive} multi)",
                    "{C:inactive}(Total actual: {C:attention}#4#{C:inactive})"
                }
            },
            j_reddit_trippy = {
                name = 'Comodín psicodélico',
                text = {
                    "{X:mult,C:white}X#1#{} multi por cada",
                    "{C:attention}#2#{} jugada consecutivamente",
                    "{C:inactive}(Actual {X:mult,C:white}X#3#{C:inactive} multi)"
                }
            },
            j_reddit_where_is_joker = {
                name = '¿Dónde está el comodín?',
                text = {
                    "Gana el valor de venta del",
                    "{C:attention}comodín más a la izquierda{} al",
                    "final de la ronda",
                    "{C:inactive}(Máx. de {C:money}$#1#{C:inactive})",
                    "{C:inactive}(Actual: {C:money}$#2#{C:inactive}){}"
                }
            },
            j_reddit_wild_west = {
                name = 'Lejano oeste',
                text = {
                    "{X:mult,C:white}X#1#{} multi si la mano jugada",
                    "contiene {C:attention}3 o más cartas versátiles{}"
                }
            },
            j_reddit_wizard = {
                name = 'Mago',
                text = {
                    "{C:attention}+#1#{} ranuras de consumibles.",
                    "{C:chips}+#2#{} fichas por cada",
                    "consumible en posesión",
                    "{C:inactive}(Actual: {C:chips}+#3#{C:inactive} fichas){}"
                }
            },
            j_reddit_event_horizon = {
                name = 'Horizonte de eventos',
                text = {
                    '{C:green}#3# en #4#{} probabilidad de',
                    '{C:attention}destruir{} una carta cuando anota,',
                    '{X:mult,C:white}X#1#{} multi por cada {C:attention}carta que ',
                    '{C:attention}anota{} destruida', 
                    '{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive} multi)'
                }
            },
            j_reddit_golden_retriever = { 
                name = 'Cobrador dorado',
                text = {
                    'Añade una {C:attention}carta de oro{} con',
                    'un {C:attention}sello de oro{} al comienzo',
                    'de cada ronda'
                }
            },
            j_reddit_ore_vein = { 
                name = 'Veta de mineral',
                text = {
                    '{C:attention}Cartas de piedra{} también',
                    'cuentan como {C:attention}cartas de oro{}'
                }
            },
            j_reddit_waiting = {
                name = 'Esperanza',
                text = {
                    'Este comodín se convierte en una copia',
                    'del próximo comodín {C:rare}raro{} que obtengas.',
                    'Si no se consigue ningún comodín {C:rare}raro{}',
                    'en {C:attention}#2#{} rondas, esta carta se {C:attention}destruye',
                    '{C:inactive}(Actual {C:attention}#1#{C:inactive}/#2#)'
                }
            },
            j_reddit_lemonade = {
                name = 'Limonada',
                text = {
                    '{C:white,X:mult}X#1#{} multi',
                    'Pierde {C:white,X:mult}X#2#{} por cada',
                    'carta vendida o destruida'
                }
            },
            j_reddit_meninblack = {
                name = 'Agente secreto',
                text = {
                    'Después de {C:attention}#1#{} #3#, vende esta carta',
                    'para crear un comodín {C:rare}raro{} al azar',
                    '{C:inactive}(Must have room)',
                    '{C:inactive}({C:attention}#2#{C:inactive} remaining)'
                }
            },
            j_reddit_notfunny = {
                name = 'No es gracioso',
                text = {
                    'Todos los {C:attention}comodines{} a la izquierda',
                    'de esta carta se {C:attention}inhabilitan{}',
                    'cuando se juega la mano,',
                    '{X:mult,C:white}X#1#{} multi por cada comodín',
                    'inhabilitado de esta manera',
                    '{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive} multi)',
                    '{C:inactive,s:0.7}(Comodines {C:dark_edition,s:0.7}negativos{C:inactive,s:0.7} se excluyen)'
                }
            },
            j_reddit_toiletpaper = {
                name = 'Papel higiénico',
                text = {
                    'Gana {X:mult,C:white}X#1#{} multi por',
                    'cada carta de {C:planet}Urano{} usada,',
                    'se reestablece cuando un',
                    '{C:attention}Color{} es jugado',
                    '{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive} multi)'
                }
            },
            j_reddit_4head = {
                name = 'Cabezota',
                text = {
                    '{X:mult,C:white}X#1#{} multi por',
                    'cada {C:attention}#2#{} cartas de {C:attention}figura{}',
                    'en tu {C:attention}baraja completa',
                    '{C:inactive}(Actual: {X:mult,C:white}X#3#{C:inactive} multi)'
                }
            },
            j_reddit_newspaper = {
                name = 'Portada',
                text = {
                    'Al comienzo de la ronda,',
                    'saca {C:attention}#1#{} cartas adicionales'
                }
            },
            j_reddit_thunderstruck = {
                name = 'Atónito',
                text = {
                    '{C:green}#1# en #2#{} probabilidad de',
                    'reactivar {C:attention}comodines{} adyacentes'
                }
            },
            j_reddit_sweetener = {
                name = 'Edulcorante artificial',
                text = {
                    'Las {C:attention}#1#{} próximas cartas de',
                    '{C:attention}consumibles{} se vuelven {C:dark_edition}negativas{}'
                }
            },
            j_reddit_decalcomania = {
                name = 'Decalcomanía',
                text = {
                    '{C:green}#1# en #2#{} probabilidad de agregar que sean',
                    '{C:attention}laminadas{}, {C:attention}holográficas{}, o {C:attention}polícromo{}',
                    ' a las cartas jugadas que anotan'
                }

            },
            j_reddit_class_notes = {
                name = 'Notas de clase',
                text = {
                    'Copia la habilidad del',
                    '{C:attention}comodín{} a la izquierda,',
                    '{C:green}#1# en #2#{} probabilidad de',
                    '{C:attention}destruirse{} a sí misma al',
                    'final de la ronda'
                }
            },
            j_reddit_tough_crowd = {
                name = 'Publico difícil',
                text = {
                    'Reactiva',
                    'todas las cartas',
                    '{C:attention}6{}, {C:attention}7{}, {C:attention}8{}, y {C:attention}9{} cuando se juegan'
                }
            },
            j_reddit_distinguished = {
                name = 'Distinguido',
                text = {
                    'Cuando se selecciona la {C:attention}ciega{},',
                    'las {C:attention}cartas versátiles{} ganan una',
                    '{C:attention}mejora{} adicional,',
                    'cambia en cada ronda',
                    '{C:inactive}(Actual: #1#)'
                }
            },
            j_reddit_mad = {
                name = 'D.M.A.',
		        text = {
                    "Vende este comodín para ",
                    "vencer esta {C:attention}ciega{}, subir la",
                    "{C:attention}apuesta{} en {C:attention}1{} y dejar",
                    " el dinero en {C:money}$0{}"
                }
            },
            j_reddit_snowman = {
                name = 'Hombre de nieve',
                text = {
                    '{C:chips}+#1#{} fichas por cada mano jugada',
                    '{C:chips}-#2#{} fichas al final de la ronda',
                    '{C:chips}-#3#{} fichas cuando se salta una {C:attention}ciega{}',
                    '{C:inactive}(Actual: {C:chips}+#4#{C:inactive} fhips)'
                }
            },
            j_reddit_molotov = {
                name = 'Molotov',
                text = {
                    '{C:attention}+#1#{} tamaño de mano si la',
                    'puntuación requerida es {C:attention}excedida{}',
                    'en una mano',
                    '{S:1.1,C:red,E:2}se autodestruye'
                }
            },
            j_reddit_thalia = {
                name = 'Thalia',
                text = {
                    'Todas las cartas en el {C:attention}primer',
                    '{C:attention}descarte{} de la ronda se',
                    'convierten en {C:attention}8s versátiles'
                }
            },
            j_reddit_ufo = {
                name = 'Objeto Volador No Identificado',
                text = {
                    'Sube de nivel una {C:attention}mano de póker{} al azar',
                    'una vez por cada tipo de mano {C:attention}único{} jugado',
                    'esta ronda al final de la ronda'
                }
            }
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
        Voucher = {
            v_reddit_trolley_problem = {
                name = "Problema del carrito",
                text = {
                    "Al saltar una {C:attention}ciega{}, elige",
                    "entre 2 etiquetas disponibles"
                }
            },
            v_reddit_track_drift = {
                name = "Derrape multicarril",
                text = {
                    "Al saltar una {C:attention}ciega{},",
                    "obtén 2 etiquetas"
                }
            },
            v_reddit_deterioration = {
                name = 'Deterioración',
                text = {
                    '{C:red}X0.75{} tamaño base de {C:attention}ciega'
                }
            },
            v_reddit_decay = {
                name = 'Decadencia',
                text = {
                    '{C:red}X0.5{} tamaño base de {C:attention}ciega{}'
                }
            }
        },
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
            b_reddit_enable_dev_jokers = 'Habilitar Comodines en Desarrollo (¡Requiere Reinicio!)',

            k_empty_ex = "Vacío!",

            a_hand_singular = "mano",
            a_hand_plural = "manos",
            a_times_singular = "vez",
            a_times_plural = "veces",
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