def normalize(value)
  return value.capitalize
end

def nameswap(value, quary, nsalgs)
  return normalize(value)
end

#method to replace html entities
def html_entities(line)
		line = line.gsub( /&amp;|&#38;/, '&' ).gsub( /&nbsp;|&#160;/, ' ' ).gsub( /&lt;|&#60;/, '<' ).gsub( /&gt;|&#62;/, '>' ).gsub( /&#34;|&quot;/, '"' ).gsub( /&#39;|&apos;/, '\'' )
end

#method to capitalize first (and only the first) letter of all words in a string.
def cap_first(line)
		string = ""
		line = line.scan(/\b\S+/).each {|element| string << element.capitalize + " "}
		return string
end

#This variable can be inserted as a disjunction into regex whenever we need to convert 'St.' to 'Saint', or something similar.
$var_saints = '(Matthew|Maximilian|Bernardine|Peter|Martin|Benedict|Peregrine|Joseph|Monica|Venerable|Rose|Francis|Thomas|Catharine|Luke|Dominic|Sebastian|Raymond|Elizabeth|Nicholas|Louis|Cosmas|Ambrose|Gile|Lucas|Raphael|Wenceslaus|John|George|Agatha|Stephen|Nichola|Gabriel|Vincent|Robert|Charles|Aloysius|Maria|Jame|Isidore|Lawrence|Brigid|Ansgar|Apollonia|Jude|Rita|Giles|Polycarp|Patrick|Gregory|Augustine|Bridget|Catherine|Clare|Lucy|Andrew|Joan|Boniface|Agnes|Ann|Blessed|Teresa|Frances|Camillus|Martha|James|Jerome|Casimir|Anthony|Zita|Albert|Cecilia|Cyprian|Isaac|Mark|Scholastica|Mary|David|Stanislau|Georg|Ignatius|Basil|Casimi|Bede|Paschal|Cyril|Louise|Timothy|Alphonsus|Blaise|Josep|Philip|Gertrude)'	

$saints = ["Abadiu", "Abakuh", "Abanoub", "Abaskhayroun", "Abban", "Abbo", "Abdas", "Abel", "Abib", "Abo", "Abraam", "Abraham", "Abuna", "Abundius", "Acacius", "Acca", "Achilleus", "Adalbert", "Adalgar", "Adalgott", "Adamo", "Adelaide", "Adelin", "Adeodatus", "Adomn", "Adrian", "Afan", "Agapetus", "Agapitus", "Agatha", "Agatho", "Agnes", "Aidan", "Alberic", "Alberto", "Albertus", "Alcuin", "Alda", "Alexander", "Alexandra", "Alexei", "Alexis", "Alfred", "Alice", "Alipy", "Aloysius", "Alphege", "Alphonsa", "Alypius", "Amand", "Ambrose", "Ammon", "Amphilochius", "Anastasia", "Anastasius", "Andr", "Andrei", "Andrew", "Andronicus", "Angela", "Anianus", "Anna", "Anne", "Anselm", "Ansgar", "Anthony", "Antoine", "Aphrodisius", "Apollo", "Apollonia", "Apollos", "Aprax", "Arnold", "Arnulf", "Athanasius", "Augustine", "Avilius", "Avitus", "Baldred", "Barbatus", "Barsanuphius", "Basil", "Beatrix", "Benedetta", "Benedict", "Berlinda", "Bernadette", "Bernard", "Bernardino", "Bernardo", "Birinus", "Bonaventure", "Boniface", "Boris", "Botolph", "Brendan", "Bridget", "Brigid", "Brioc", "Bruno", "Budoc", "Caesarius", "Cajetan", "Camillus", "Candidus", "Canute", "Carantoc", "Casimir", "Catald", "Catherine", "Cedd", "Celadion", "Celestine", "Cettin", "Chad", "Charbel", "Charles", "Christina", "Christopher", "Chrysanthus", "Ciar", "Clare", "Claudus", "Clement", "Cleopatra", "Clodoald", "Clotilde", "Colette", "Columba", "Columbanus", "Comgall", "Congar", "Conrad", "Constantine", "Cosmas", "Crist", "Cristobal", "Cunigunde", "Cuthbert", "Cynllo", "Cyriacus", "Cyril", "Cyrus", "Damian", "Damien", "Daniel", "Danilo", "Dasya", "David", "Daydara", "Declan", "Demetrius", "Demiana", "Desiderius", "Deusdedit", "Didier", "Didymus", "Dietrich", "Dimitry", "Dionysius", "Dioscorus", "Doherty", "Dominic", "Dorothea", "Dorotheus", "Douai", "Drogo", "Dunstan", "Dymphna", "Eanfl", "Edburga", "Edith", "Editha", "Edmund", "Edward", "Edwin", "Egbert", "Eligius", "Elisabeth", "Elizabeth", "Emeric", "Emma", "Emmelia", "Emmeram", "Enda", "Engelbert", "Erbin", "Erentrude", "Ermengol", "Ermenilda", "Ethelbert", "Etheldreda", "Eugene", "Eulogius", "Eumenes", "Euphemia", "Euphrosyne", "Eustochia", "Euthymius", "Eysteinn", "Fachanan", "Faro", "Faustina", "Faustus", "Feichin", "Felix", "Ferdinand", "Ferr", "Fiacre", "Fidelis", "Filan", "Finbarr", "Florentina", "Franca", "Frances", "Francesca", "Francis", "Frei", "Frideswide", "Fructuosus", "Fulgentius", "Gabriel", "Gaetano", "Gal", "Gall", "Gallicanus", "Gaspar", "Gaudentius", "Gelasius", "Gelert", "Gemma", "Genesius", "Genevieve", "George", "Gerard", "Gerasimus", "Gereon", "Ghislain", "Gianna", "Gilbert", "Giovanni", "Goar", "Godehard", "Godric", "Gonsalo", "Grand", "Gratus", "Gregorio", "Gregory", "Grellan", "Gunther", "Hallvard", "Hedwig", "Helena", "Helier", "Henry", "Herman", "Herv", "Hilarius", "Hilda", "Hildebrand", "Hildegard", "Holos", "Hormisdas", "Hubertus", "Hugh", "Hyacinth", "Hyacintha", "Ignatius", "Illuminata", "Innocencio", "Innocent", "Irene", "Isaac", "Isabel", "Isfrid", "Isidore", "Italo", "Ivo", "Jacobo", "Jadwiga", "James", "Jean", "Joan", "Joaquina", "Job", "John", "Josaphat", "Josemar", "Joseph", "Josephine", "Josse", "Juan", "Judoc", "Julian", "Juliana", "Julie", "Justin", "Jutta", "Kassia", "Katharine", "Kea", "Kessog", "Kevin", "King", "Kinga", "Kirill", "Ladislaus", "Lambert", "Laura", "Laurent", "Lazar", "Leander", "Leo", "Leodegar", "Leopold", "Liam", "Lidwina", "Livinus", "Lorc", "Lorenzo", "Louis", "Louise", "Lucy", "Ludolph", "Lupus", "Lutgardis", "Machar", "Magdalen", "Magdalene", "Malachy", "Malo", "Marcellin", "Marcouf", "Margaret", "Marguerite", "Maria", "Marianita", "Marie", "Mark", "Martin", "Martyr", "Martyrs", "Mary", "Matthew", "Maurontius", "Maximillian", "Maximus", "Methodius", "Michael", "Miguel", "Milburga", "Modwen", "Moninne", "Mother", "Narcisa", "Naum", "Nectan", "Neot", "Nicephorus", "Nicholas", "Nikola", "Nikolai", "Nil", "Nilus", "Nimattullah", "Norbert", "Nothelm", "Nuno", "Odile", "Odo", "Olaf", "Oliver", "Opportuna", "Oswald", "Osyth", "Ouen", "Paraskeva", "Paschal", "Patrick", "Paul", "Paulina", "Paulinus", "Pavel", "Pedro", "Peregrine", "Peter", "Petroc", "Petrus", "Philip", "Philothei", "Photios", "Pierre", "Pio", "Piran", "Pius", "Praejectus", "Pyr", "Quinidius", "Quintian", "Rabanus", "Rafqa", "Rainerius", "Raphael", "Raymond", "Remigius", "Ren", "Richard", "Rictrude", "Rimbert", "Rita", "Robert", "Roch", "Roger", "Rognvald", "Romuald", "Roque", "Rosalia", "Rose", "Sabbas", "Sadalberga", "Saethryth", "Salonius", "Salvius", "Samson", "Sava", "Scholastica", "Seaxburh", "Seraphim", "Seraphina", "Sergius", "Severinus", "Sharbel", "Sigeberht", "Silverius", "Simeon", "Simon", "Simplicius", "Sophia", "Sophronius", "Stephen", "Stylianos", "Swithun", "Symeon", "Symmachus", "Tarasios", "Tathan", "Tatiana", "Tekle", "Teresa", "Theodore", "Theodosius", "Theophan", "Theophanes", "Therese", "Thomas", "Tikhon", "Tropez", "Tsar", "Tsarevna", "Turibius", "Tydfil", "Ubald", "Ulrich", "Urbicius", "Ursicinus", "Ursmar", "Ursula", "Varghese", "Varvara", "Venantius", "Veranus", "Vergilius", "Veronica", "Vicelinus", "Vicente", "Vietnamese", "Vincent", "Virginia", "Vitalian", "Vitalis", "Vitonus", "Vladimir", "Waningus", "Wenceslaus", "Werburgh", "Wiborada", "Wilfrid", "Willehad", "William", "Willibrord", "Wolfeius", "Wolfgang", "Wolfhelm", "Wulfram", "Xenia", "Xenophon", "Yaropolk", "Yegor", "Yrieix", "Zachary", "Zdislava", "Zita", "Zofia", "Zosimas", "Zygmunt"]

#method corresponding to abbreviated streets
def abbreviated_streets(street)

		#Replaces html entities
		abb_street = html_entities(street)

		#P.O. Boxes handled
		abb_street = abb_street.gsub( /((?:P\.?O\.?)?\s+Box\s+[0-9A-Za-z]+)\,\s+(.+)/i, '\2, \1' ).gsub( /(?:P\.?O\.?\s?)?\sbox\s+([0-9A-Za-z]+)/i, 'P.O. Box \1' )
		
		#U.S.
		abb_street = abb_street.gsub( /\bU\b\.?\s*\bS\b\.?/i, 'US' )

		#1st through 9th handled
		abb_street = abb_street.gsub( /\b1st\b/i, 'First' ).gsub( /\b2n?d\b/i, 'Second' ).gsub( /\b3r?d\b/i, 'Third' ).gsub( /\b4th\b/i, 'Fourth' ).gsub( /\b5th\b/i, 'Fifth' ).gsub( /\b6th\b/i, 'Sixth' ).gsub( /\b7th\b/i, 'Seventh' ).gsub( /\b8th\b/i, 'Eighth' ).gsub( /\b9th\b/i, 'Ninth' )

		#St. to Saint
		saint_regex = Regexp.new(('\bst\b\.*\s+(' + $var_saints +')' ), Regexp::IGNORECASE)
		abb_street = abb_street.gsub( saint_regex, 'Saint \1' )

		#Abbreviates Ave., St., and Blvd. according to AP guidelines.
		abb_street = abb_street.gsub(/(\d+\b.+\b)(\bave?nue\b|\bavn?\b\.*|\bave\b\.*)/i, '\1Ave.').gsub(/(\d+\b.+\b)(\bBo?u?le?va?r?d\b\.*|\bBoulv?\b\.*)/i, '\1Blvd.').gsub(/\bst(reet)?\b\.*/i, 'St.')

		#Spells out all remaining street names according to AP guidelines.
		abb_street = abb_street.gsub(/\bc(o(u|d)r)?t\b\.*/i, 'Court').gsub(/\bR(oa)?d\b\.*/i, 'Road' ).gsub( /\bDr(ive)?\b\.?/i, 'Drive' ).gsub( /\bLa?ne?\b\.?/i, 'Lane' ).gsub( /\bwa?y\b\.*/i, 'Way' ).gsub( /\bp(ar)?kw?a?y\b\.*/i, 'Parkway' ).gsub( /\btr(ai)?l\b\.*/i, 'Trail' ).gsub( /\bPl(ace)\b?\.*/i, 'Place' ).gsub( /\b(Cross|x)ing\b\.*/i, 'Crossing' ).gsub( /\bCir(cle)?\b\.*/i, 'Circle' ).gsub( /\bRi?dge?\b\.*/i, 'Ridge' ).gsub( /\bhwy\b/i, 'Highway' ).gsub( /\bTpke\b/i, 'Turnpike' ).gsub( /\bpla?za?\b\.*/i, 'Plaza' ).gsub( /\bpla?c?e?\b\.*/i, 'Place' ).gsub( /\br(ou)?te\b\.*/i, 'Route' ).gsub( /\bsq(are)?\b\.*/i, 'Square' ).gsub( /\bI\s*-?\s*(\d+)\s*/i, 'Interstate \1 ' )
		
		#Eliminates hashes in addresses.
		abb_street = abb_street.gsub( /(\A\s*#\s*)(?=\d+)/, '' ).gsub( /##/, 'No.' ).gsub( /(?<=Unit)(?:\,)?\s*(?:#|No\.)?\s*(\b\d+\b)/i, ' \1' ).gsub( /#unit/, 'Unit' ).gsub( /#\s*(\d+\w{0,1})\s*(?:&|and)\s*(\d+\w{0,1})/i, 'Units \1 and \2' ).gsub( /#\s*(\d+)\b/, 'No. \1' ).gsub(/(?<=.|\s)(?:#|No\.)\s*(\b\d+\b)/i, 'No. \1' ).gsub( /(?:#|No\.)\s*(\d+\-?[a-zA-Z]|[a-zA-Z]\-?\d+)/i, 'Unit \1' ).gsub( /(?:#|No\.)\s*([A-Za-z])\s*(\d+\-?[a-zA-Z]?)/i, 'Unit \1\2' )
		
		#Add comma before 'Unit', 'No.', or 'Lot'
		abb_street = abb_street.gsub( /(?<!\,)\s*\b(Unit\b|No\b\.|Lot\b)/i, ', \1' )
			
		#Eliminates unnecessary information from before an address.
		abb_street = abb_street.gsub( /.*\,\s+(\d+\b\s+\w)/i, '\1' )
		
		#Suites and apartments
		abb_street = abb_street.gsub( /(?<=\,)\s*\bs(ui)?te\.*/i, ' Suite' ).gsub( /(?<!\,)\s\bs(ui)?te\.*/i, ', Suite' ).gsub( /(?<!\,)\bs(ui)?te\.*/i, ', Suite' ).gsub( /(?<=\,)\s*\bap(artmen)?t\.*/i, ' Apt.' ).gsub( /(?<!\,)\s\bap(artmen)?t\.*/i, ', Apt.' ).gsub( /(?<!\,)\bap(artmen)?t\.*/i, ', Apt.' ).gsub( /\bSuite\s*([A-Za-z0-9\-]{1,5})\s(?:&|and)\s([A-Za-z0-9\-]{1,5})/i, 'Suites \1 and \2' )
		
		#Abbreviating compass points
		abb_street = abb_street.gsub( /\bN(orth)?\b\.*/i, 'N.' ).gsub( /\bE(ast)?\b\.*/i, 'E.' ).gsub( /\bW(est)?\b\.*/i, 'W.' ).gsub( /\bN(orth)?\.*\s*e(ast)?\b\.*/i, 'N.E.' ).gsub( /\bN(orth)?\.*\s*w(est)?\b\.*/i, 'N.W.' ).gsub( /\bS(outh)?\.*\s*e(ast)?\b\.*/i, 'S.E.' ).gsub( /\bS(outh)?\.*\s*w(est)?\b\.*/i, 'S.W.' ).gsub( /\b(?<!')S(outh)?\b\.*/i, 'S.' )
		
		#Proper Capitalization
		abb_street = cap_first(abb_street)
		
		#Exits
		abb_street = abb_street.gsub( /\(?Exit\s(\d+)\)?/i, 'at exit \1' )
		
		#Finishing touches (Or: things that need to be done near the end of the street abbreviation process)
		abb_street = abb_street.gsub( /P\.o\./, 'P.O.' )				#capitalizes 'o' in 'P.o.'
			if abb_street =~ /\b\d+\-?[a-z]\b/							#capitalizes, e.g., 'c' in '7c'
				unit = abb_street[ /\b\d+\-?[a-z]\b/ ].upcase
				abb_street = abb_street.gsub( /\b\d+\-?[a-z]\b/, unit )
			end
		abb_street = abb_street.gsub( /\bUs\b/, 'US' )					#Us to US
		abb_street = abb_street.gsub( /\bS\.e\./, 'S.E.' ).gsub( /\bS\.w\./, 'S.W.' ).gsub( /\bN\.e\./, 'N.E.' ).gsub( /\bN\.w\./, 'N.W.' )
			
		return abb_street
end

#Variable for 950 or so most common last names that are not easily mistaken for common nouns.
$var_last_names = ["abbott", "acevedo", "acosta", "adams", "adkins", "aguilar", "aguirre", "alexander", "ali", "allen", "allison", "alvarado", "alvarez", "andersen", "anderson", "andrade", "andrews", "anthony", "archer", "arellano", "arias", "armstrong", "arnold", "arroyo", "ashley", "atkins", "atkinson", "austin", "avery", "avila", "ayala", "ayers", "bailey", "baird", "baldwin", "ballard", "barajas", "barker", "barnes", "barnett", "barr", "barrera", "barrett", "barron", "barry", "bartlett", "barton", "bates", "bauer", "bautista", "baxter", "beasley", "beck", "becker", "beltran", "bender", "benitez", "benjamin", "bennett", "benson", "bentley", "benton", "berg", "berger", "bernard", "bishop", "blackburn", "blackwell", "blair", "blake", "blanchard", "blankenship", "blevins", "bolton", "bonilla", "booker", "boone", "bowen", "bowers", "bowman", "boyd", "boyer", "boyle", "bradford", "bradley", "bradshaw", "brady", "brandt", "braun", "bray", "brennan", "briggs", "bright", "brock", "brown", "browning", "bruce", "bryan", "bryant", "buchanan", "buckley", "bullock", "burch", "burgess", "burke", "burnett", "burns", "burton", "byrd", "cabrera", "cain", "caldwell", "calhoun", "callahan", "camacho", "cameron", "campbell", "campos", "cantrell", "cantu", "cardenas", "carey", "carlson", "carney", "carr", "carrillo", "carroll", "carson", "carter", "casey", "castaneda", "castillo", "castro", "cervantes", "chan", "chandler", "chaney", "chang", "chapman", "charles", "chavez", "chen", "cherry", "choi", "christensen", "christian", "chung", "cisneros", "clark", "clarke", "clayton", "clements", "cline", "cobb", "cochran", "coffey", "cohen", "cole", "coleman", "collier", "collins", "compton", "conley", "conner", "conrad", "contreras", "conway", "cooke", "cooley", "cooper", "copeland", "cordova", "cortez", "costa", "cowan", "cox", "craig", "crane", "crawford", "crosby", "cruz", "cuevas", "cummings", "cunningham", "curry", "curtis", "dalton", "daniel", "daniels", "daugherty", "davenport", "david", "davidson", "davies", "davila", "davis", "dawson", "dean", "decker", "delacruz", "deleon", "delgado", "dennis", "diaz", "dickerson", "dickson", "dillon", "dixon", "dodson", "dominguez", "donaldson", "donovan", "dorsey", "dougherty", "douglas", "downs", "doyle", "drake", "duarte", "dudley", "duffy", "duke", "duncan", "dunlap", "dunn", "duran", "durham", "dyer", "eaton", "edwards", "elliott", "ellis", "ellison", "english", "erickson", "escobar", "esparza", "espinoza", "estes", "estrada", "evans", "everett", "ewing", "farley", "farmer", "farrell", "faulkner", "ferguson", "fernandez", "ferrell", "fields", "figueroa", "finley", "fischer", "fisher", "fitzgerald", "fitzpatrick", "fleming", "fletcher", "flores", "flowers", "floyd", "flynn", "foley", "forbes", "ford", "foster", "fowler", "francis", "franco", "frank", "franklin", "frazier", "frederick", "freeman", "french", "frey", "friedman", "fritz", "frye", "fuentes", "fuller", "gaines", "gallagher", "gallegos", "galloway", "galvan", "gamble", "garcia", "gardner", "garner", "garrett", "garrison", "garza", "gates", "gentry", "george", "gibbs", "gibson", "gilbert", "giles", "gillespie", "gilmore", "glenn", "glover", "gomez", "gonzales", "gonzalez", "goodman", "goodwin", "gordon", "gould", "graham", "greene", "greer", "gregory", "griffin", "griffith", "grimes", "guerra", "guerrero", "gutierrez", "guzman", "haas", "hahn", "hale", "haley", "hamilton", "hammond", "hampton", "hancock", "haney", "hanna", "hansen", "hanson", "hardin", "harding", "hardy", "harmon", "harper", "harrell", "harrington", "harris", "harrison", "hart", "hartman", "harvey", "hatfield", "hawkins", "hayden", "hayes", "haynes", "hays", "heath", "hebert", "henderson", "hendricks", "hendrix", "henry", "hensley", "henson", "herman", "hernandez", "herrera", "herring", "hess", "hester", "hickman", "hicks", "higgins", "hines", "hinton", "ho", "hobbs", "hodge", "hodges", "hoffman", "hogan", "holden", "holland", "holloway", "holmes", "holt", "hooper", "hoover", "hopkins", "horne", "horton", "houston", "howard", "howe", "howell", "huang", "hubbard", "huber", "hudson", "huerta", "huff", "huffman", "hughes", "humphrey", "hurley", "hurst", "hutchinson", "huynh", "ibarra", "ingram", "irwin", "jackson", "jacobs", "jacobson", "james", "jarvis", "jefferson", "jenkins", "jennings", "jensen", "jimenez", "johns", "johnson", "johnston", "jones", "jordan", "joseph", "joyce", "juarez", "kaiser", "kane", "kaufman", "keith", "keller", "kelley", "kelly", "kemp", "kennedy", "kent", "kerr", "key", "khan", "kidd", "kim", "king", "kirby", "kirk", "klein", "kline", "knapp", "knight", "knox", "koch", "kramer", "krause", "krueger", "lam", "lamb", "lambert", "landry", "lang", "lara", "larsen", "larson", "lawrence", "lawson", "le", "leach", "leblanc", "lee", "leon", "leonard", "lester", "levine", "levy", "lewis", "li", "lin", "lindsey", "liu", "livingston", "lloyd", "logan", "lopez", "lowe", "lowery", "lozano", "lucas", "lucero", "luna", "lutz", "lynch", "lynn", "lyons", "macdonald", "macias", "madden", "maddox", "mahoney", "maldonado", "malone", "mann", "manning", "marks", "marquez", "marsh", "marshall", "martin", "martinez", "massey", "mata", "mathews", "mathis", "matthews", "maxwell", "mayer", "maynard", "mayo", "mays", "mcbride", "mccall", "mccann", "mccarthy", "mccarty", "mcclain", "mcclure", "mcconnell", "mccormick", "mccoy", "mccullough", "mcdaniel", "mcdonald", "mcdowell", "mcfarland", "mcgee", "mcgrath", "mcguire", "mcintosh", "mcintyre", "mckay", "mckee", "mckenzie", "mckinney", "mcknight", "mclaughlin", "mclean", "mcmahon", "mcmillan", "mcneil", "mcpherson", "medina", "mejia", "melendez", "melton", "mendez", "mendoza", "mercado", "mercer", "merritt", "meyer", "meyers", "meza", "michael", "middleton", "miles", "miller", "miranda", "mitchell", "molina", "monroe", "montes", "montgomery", "montoya", "moody", "moon", "mooney", "moore", "mora", "morales", "moran", "moreno", "morgan", "morris", "morrison", "morrow", "morse", "morton", "moses", "mosley", "moss", "moyer", "mueller", "mullen", "mullins", "munoz", "murillo", "murphy", "murray", "myers", "nash", "navarro", "neal", "nelson", "newman", "newton", "nguyen", "nichols", "nicholson", "nielsen", "nixon", "nolan", "norman", "norris", "norton", "novak", "nunez", "obrien", "ochoa", "oconnell", "oconnor", "odom", "odonnell", "oliver", "olsen", "olson", "oneal", "oneill", "orozco", "orr", "ortega", "ortiz", "osborn", "osborne", "owen", "owens", "pace", "pacheco", "padilla", "page", "palmer", "park", "parker", "parks", "parrish", "parsons", "patel", "patrick", "patterson", "patton", "paul", "payne", "pearson", "pena", "pennington", "perez", "perkins", "perry", "peters", "petersen", "peterson", "pham", "phelps", "phillips", "pierce", "pineda", "pittman", "pitts", "pollard", "ponce", "poole", "porter", "potts", "powell", "powers", "pratt", "preston", "pruitt", "pugh", "quinn", "ramirez", "ramos", "ramsey", "randall", "randolph", "rangel", "rasmussen", "raymond", "reed", "reese", "reeves", "reid", "reilly", "reyes", "reynolds", "rhodes", "richard", "richards", "richardson", "richmond", "riddle", "riggs", "riley", "rios", "ritter", "rivas", "rivera", "rivers", "robbins", "roberson", "roberts", "robertson", "robinson", "robles", "rocha", "rodgers", "rodriguez", "rogers", "rojas", "rollins", "roman", "romero", "rosales", "rosario", "ross", "roth", "rowe", "rowland", "roy", "rubio", "ruiz", "russell", "russo", "ryan", "salas", "salazar", "salinas", "sampson", "sanchez", "sanders", "sandoval", "sanford", "santana", "santiago", "santos", "saunders", "savage", "sawyer", "schaefer", "schmidt", "schmitt", "schneider", "schroeder", "schultz", "schwartz", "scott", "sellers", "serrano", "sexton", "shaffer", "shah", "shannon", "sharp", "shaw", "shea", "shelton", "shepard", "shepherd", "sheppard", "sherman", "shields", "short", "silva", "simmons", "simon", "simpson", "sims", "singh", "singleton", "skinner", "sloan", "smith", "snyder", "solis", "solomon", "sosa", "soto", "spence", "spencer", "stafford", "stanley", "stanton", "stark", "steele", "stein", "stephens", "stephenson", "stevens", "stevenson", "stewart", "strickland", "stuart", "suarez", "sullivan", "sutton", "swanson", "sweeney", "tanner", "tapia", "tate", "taylor", "terrell", "terry", "thomas", "thompson", "thornton", "todd", "torres", "townsend", "travis", "trevino", "trujillo", "tucker", "turner", "tyler", "underwood", "valdez", "valencia", "valentine", "valenzuela", "vance", "vang", "vargas", "vasquez", "vaughan", "vaughn", "vazquez", "vega", "velasquez", "velazquez", "velez", "villanueva", "villarreal", "villegas", "vincent", "wagner", "wallace", "waller", "walsh", "walter", "walters", "walton", "wang", "ward", "warner", "warren", "washington", "watkins", "watson", "webb", "weber", "webster", "weiss", "welch", "werner", "wheeler", "whitaker", "whitney", "wiggins", "wilcox", "wiley", "wilkerson", "wilkins", "wilkinson", "williams", "williamson", "willis", "wilson", "winters", "wolfe", "wong", "woodard", "woodward", "wright", "wu", "wyatt", "yang", "yates", "yoder", "york", "young", "yu", "zamora", "zavala", "zhang", "zimmerman", "zuniga"]

$var_first_names = ["aaron", "abigail", "abraham", "ada", "adam", "addie", "adeline", "adolph", "agnes", "aiden", "albert", "alberta", "alex", "alexander", "alexis", "alfred", "alice", "allen", "allie", "allison", "alma", "alta", "alton", "alvin", "alyssa", "amanda", "amelia", "amos", "amy", "andrew", "ann", "anna", "anne", "annie", "anthony", "archie", "arnold", "arthur", "ashley", "audrey", "august", "austin", "ava", "avery", "barbara", "beatrice", "ben", "benjamin", "bennie", "bernard", "bernice", "bert", "bertha", "bessie", "betty", "beulah", "blanche", "bonnie", "brandon", "brayden", "brianna", "caden", "caleb", "calvin", "cameron", "carl", "caroline", "carrie", "catherine", "cecelia", "cecil", "celia", "charles", "charley", "charlie", "charlotte", "chester", "chloe", "christian", "christine", "christopher", "clara", "clarence", "claude", "clayton", "cleo", "clifford", "clifton", "clinton", "clyde", "connor", "cora", "cornelius", "curtis", "dan", "daniel", "dave", "david", "della", "dennis", "dewey", "donald", "dora", "doris", "dorothy", "douglas", "dylan", "earl", "earnest", "ed", "eddie", "edgar", "edith", "edmund", "edna", "edward", "edwin", "effie", "elbert", "eleanor", "elijah", "eliza", "elizabeth", "ella", "ellen", "ellis", "elmer", "elsie", "elva", "emil", "emily", "emma", "emmett", "erma", "ernest", "essie", "estella", "estelle", "esther", "ethan", "ethel", "etta", "eugene", "eula", "eunice", "eva", "evan", "evelyn", "everett", "fannie", "felix", "fern", "flora", "florence", "flossie", "floyd", "frances", "francis", "frank", "franklin", "fred", "freda", "frederick", "frieda", "gabriel", "gavin", "geneva", "genevieve", "george", "georgia", "gerald", "geraldine", "gertrude", "gilbert", "gladys", "glen", "glenn", "goldie", "gordon", "hailey", "hannah", "harold", "harriet", "harvey", "hattie", "helen", "henrietta", "henry", "herbert", "herman", "hilda", "homer", "horace", "howard", "hubert", "hugh", "ida", "ina", "inez", "ira", "irene", "irma", "irvin", "irving", "isaac", "isabel", "isabella", "isabelle", "iva", "jackson", "jacob", "jaden", "jake", "james", "jane", "janie", "jasmine", "jean", "jeanette", "jennie", "jerome", "jerry", "jesse", "jessica", "jessie", "jim", "jimmie", "joe", "john", "johnie", "johnnie", "jonathan", "jordan", "jose", "joseph", "josephine", "joshua", "juan", "juanita", "julia", "julius", "justin", "kaitlyn", "katherine", "kathleen", "kathryn", "katie", "kayla", "kaylee", "kenneth", "kylie", "kyra", "laura", "lauren", "lawrence", "lee", "lela", "lena", "leo", "leola", "leon", "leona", "leonard", "leroy", "leslie", "lester", "lewis", "lillian", "lillie", "lily", "lizzie", "lloyd", "logan", "lois", "lola", "lonnie", "loretta", "lottie", "louis", "louise", "lucas", "lucile", "lucille", "lucy", "luella", "luke", "lula", "luther", "lydia", "mabel", "mable", "mack", "madeline", "madison", "mae", "maggie", "makayla", "makenzie", "mamie", "manuel", "margaret", "marguerite", "maria", "marian", "marie", "marion", "marjorie", "mark", "marshall", "martha", "martin", "marvin", "mary", "matilda", "matthew", "mattie", "maude", "maurice", "megan", "melvin", "mia", "michael", "mike", "mildred", "milton", "minnie", "miriam", "mollie", "morgan", "morris", "myrtle", "nancy", "nannie", "naomi", "natalie", "nathan", "nathaniel", "nell", "nellie", "nelson", "nettie", "nicholas", "nina", "noah", "nora", "norma", "norman", "ola", "olga", "olive", "oliver", "olivia", "ollie", "opal", "ora", "orville", "oscar", "otis", "otto", "owen", "patrick", "paul", "pauline", "pearl", "percy", "perry", "pete", "peter", "philip", "phillip", "rachel", "ralph", "raymond", "rebecca", "richard", "riley", "robert", "roger", "roland", "roosevelt", "rosa", "roscoe", "rosie", "roy", "rudolph", "rufus", "russell", "ruth", "ryan", "sadie", "sallie", "sally", "sam", "samantha", "samuel", "sara", "sarah", "savannah", "sean", "sidney", "sophia", "sophie", "stanley", "stella", "stephen", "steve", "susan", "susie", "sydney", "sylvester", "sylvia", "taylor", "ted", "thelma", "theodore", "theresa", "thomas", "tom", "tony", "tyler", "velma", "vera", "verna", "vernon", "victoria", "vincent", "viola", "virgie", "virgil", "vivian", "wallace", "walter", "warren", "wayne", "wesley", "wilbur", "willard", "william", "willie", "willis", "wilma", "winifred", "zachary", "zoe"]

$var_countries_nationalities = ["Afghanistan", "Albania", "Albanians", "Algeria", "Algerians", "American Samoa", "Americans", "Andorra", "Andorrans", "Angola", "Angolans", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Argentines", "Armenia", "Armenians", "Aromanians", "Aruba", "Arubans", "Australia", "Australians", "Austria", "Austrians", "Azerbaijan", "Azeris", "Bahamas", "Bahamians", "Bahrain", "Bahrainis", "Baltic Germans", "Baltic Russians", "Bangladesh", "Bangladeshis", "Barbadians", "Barbados", "Belarus", "Belarusians", "Belgians", "Belgium", "Belize", "Belizeans", "Benin", "Bermuda", "Bermudians", "Bhutan", "Boers", "Bolivia", "Bosnia and Herzegovina", "Bosnians", "Botswana", "Bouvet Island", "Brazil", "Brazilians", "Bretons", "British", "British Antarctic Territory", "British Indian Ocean Territory", "British Virgin Islanders", "British Virgin Islands", "Brunei", "Bulgaria", "Bulgarians", "Burkina Faso", "Burkinabès", "Burma", "Burundi", "Burundians", "Cambodia", "Cambodians", "Cameroon", "Cameroonians", "Canada", "Canadians", "Canton and Enderbury Islands", "Cape Verde", "Cape Verdeans", "Catalans", "Cayman Islands", "Central African Republic", "Chad", "Chadians", "Chile", "Chileans", "China", "Chinese", "Christmas Island", "Cocos Islands", "Colombia", "Colombians", "Comorians", "Comoros", "Congo", "Congolese", "Cook Islands", "Costa Rica", "Croatia", "Croatians", "Cuba", "Cubans", "Cypriots", "Cyprus", "Czech Republic", "Czechs", "Côte d’Ivoire", "Danes", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Dominicans", "Dominicans", "Dronning Maud Land", "Dutch", "East Germany", "East Timorese", "Ecuador", "Ecuadorians", "Egypt", "Egyptians", "El Salvador", "Emiratis", "English", "Equatorial Guinea", "Eritrea", "Eritreans", "Estonia", "Estonians", "Ethiopia", "Ethiopians", "Falkland Islands", "Faroe Islands", "Faroese", "Fiji", "Fijians", "Filipinos", "Finland", "Finnish Swedish", "Finns", "France", "French Guiana", "French Polynesia", "French Southern Territories", "French Southern and Antarctic Territories", "French citizens", "Gabon", "Gambia", "Georgia", "Georgians", "Germans", "Germany", "Ghana", "Ghanaians", "Gibraltar", "Gibraltar", "Greece", "Greeks", "Greenland", "Grenada", "Grenadians", "Guadeloupe", "Guam", "Guatemala", "Guatemalans", "Guernsey", "Guianese", "Guineans", "Guinea", "Guinea-Bissau", "Guyana", "Guyanese", "Haiti", "Haitians", "Heard Island and McDonald Islands", "Hondurans", "Honduras", "Hong Kong SAR China", "Hungarians", "Hungary", "Iceland", "Icelanders", "India", "Indians", "Indonesia", "Indonesians", "Iran", "Iranians", "Persians", "Iraqis", "Iraq", "Ireland", "Irish", "Isle of Man", "Israel", "Israelis", "Italians", "Italy", "Ivoirians", "Ivory Coast", "Jamaica", "Jamaicans", "Japan", "Japanese", "Jersey", "Johnston Island", "Jordan", "Jordanians", "Kazakhs", "Kazakhstan", "Keeling Islands", "Kenya", "Kenyans", "Kiribati", "Koreans", "Kosovo Albanians", "Kuwait", "Kuwaitis", "Kyrgyzstan", "Lao", "Laos", "Latvia", "Latvians", "Lebanese", "Lebanon", "Lesotho", "Liberia", "Liberians", "Libya", "Libyans", "Liechtenstein", "Liechtensteiners", "Lithuania", "Lithuanians", "Luxembourg", "Luxembourgers", "Macau", "Macedonia", "Macedonians", "Madagascar", "Malawi", "Malawians", "Malaysia", "Malaysians", "Maldives", "Maldivians", "Mali", "Malians", "Malta", "Maltese", "Manx", "Marshall Islands", "Martinique", "Mauritania", "Mauritians", "Mauritius", "Mayotte", "Metropolitan France", "Mexicans", "Mexico", "Micronesia", "Midway Islands", "Moldova", "Moldovans", "Monaco", "Mongolia", "Mongolians", "Montenegrins", "Montenegro", "Montserrat", "Moroccans", "Morocco", "Mozambique", "Myanmar ", "Namibia", "Namibians", "Nauru", "Nepal", "Nepalese", "Netherlands", "Netherlands Antilles", "Neutral Zone", "New Caledonia", "New Zealand", "New Zealanders", "Nicaragua", "Nicaraguans", "Niger", "Nigeria", "Nigerians", "Nigeriens", "Niue", "Norfolk Island", "North Korea", "North Vietnam", "Northern Mariana Islands", "Norway", "Norwegians", "Oman", "Pacific Islands Trust Territory", "Pakistan", "Pakistanis", "Palau", "Palauans", "Palestinian Territories", "Palestine", "Palestinians", "Panama", "Panama Canal Zone", "Panamanians", "Papua New Guinea", "Papua New Guineans", "Paraguay", "Paraguayans", "People's Democratic Republic of Yemen", "Peru", "Peruvians", "Philippines", "Pitcairn Islands", "Poland", "Poles", "Portugal", "Portuguese", "Puerto Ricans", "Puerto Rico", "Qatar", "Quebecers", "Romania", "Romanians", "Russia", "Russians", "Rwanda", "Rwandans", "Réunion", "Réunionnais", "Saint Barthélemy", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Martin", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Salvadorans", "Samoa", "San Marino", "Saudi Arabia", "Saudis", "Scots", "Senegal", "Senegalese", "Serbia", "Serbia and Montenegro", "Serbs", "Seychelles", "Sierra Leone", "Sierra Leoneans", "Sikhs", "Singapore", "Singaporeans", "Slovakia", "Slovaks", "Slovenes", "Slovenia", "Solomon Islands", "Somalia", "Somalis", "South Africa", "South Africans", "South Georgia and the South Sandwich Islands", "South Korea", "Spain", "Spaniards", "Sri Lanka", "Sri Lankans", "St Lucians", "Sudan", "Sudanese", "Suriname", "Surinamese", "Svalbard and Jan Mayen", "Swaziland", "Sweden", "Swedes", "Swiss", "Switzerland", "Syria", "Syrians", "São Tomé and Príncipe", "São Tomé and Príncipe", "Taiwan", "Taiwanese", "Tajikistan", "Tanzania", "Tanzanians", "Thailand", "Thais", "Tibetans", "Timor-Leste", "Tobagonians", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Trinidadians", "Tunisia", "Turkey", "Turkish Cypriots", "Turkmenistan", "Turks", "Turks and Caicos Islands", "Tuvalu", "Tuvaluans", "U.S. Minor Outlying Islands", "U.S. Miscellaneous Pacific Islands", "U.S. Virgin Islands", "Uganda", "Ugandans", "Ukraine", "Ukrainians", "Union of Soviet Socialist Republics", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uruguayans", "Uzbekistan", "Uzbeks", "Vanuatu", "Vanuatuans", "Vatican City", "Venezuela", "Venezuelans", "Vietnam", "Vietnamese", "Wake Island", "Wallis and Futuna", "Welsh", "Western Sahara", "Yemen", "Yemenis", "Zambia", "Zambians", "Zimbabwe", "Zimbabweans", "Åland Islands"]

$var_regex = ""

#Method to turn arrays into regular expressions where each element of the array is a disjunt in the regexp. So, [1, 2, 3] becomes 1|2|3
def var_to_regex(array)
		regex_prep = ""
		array.each do |element|
				regex_prep += "#{element}|"
		end		
		regex_prep = regex_prep.gsub(/\|\Z/, '')		#removes final '|'
		$var_regex = Regexp.new(regex_prep)
end		

#Method for capitalizing common proper nouns
def proper_nouns(line)
	
end

#Method for handling Canada Job Listings
def canada_jobs(job)
	
		#Put quotation marks around them
		if !job.match(/\-(?!time)|\,|\d+\Z|\bk\b|Enterprise/)		
		
				#html entities
				job = html_entities(job)
				
				#Lowercase all words in job title
				job = job.downcase
				
				#& to 'and'
				job = job.gsub( /\b\&\b/i, 'and' )
				
				#Slashes replaced with 'or'
				job = job.gsub(/\s*\/\s*/, ' or ' )
			
				#part-time, full-time considerations
				job = job.gsub( /\bp(art)?\s*\-?\/?\s*t(ime)?\b/i, 'part-time' ).gsub( /\bf(ull)?\s*\-?\/?\s*t(ime)?\b/i, 'full-time' ).gsub( /\btemp(?:orary)?\b\.?\s*(\bpart-time|full-time)/i, 'temporary, \1' )
				
				#Remove what's in parentheses
				job = job.gsub( /\([\w\s]+\)/i, '' )
				
				#miscellaneous changes, acronyms, recapitalization, etc.
				job = job.gsub( /\bsr\b/i, 'senior' ).gsub( /\*/i, '' ).gsub( /\bi\b/i, 'I' ).gsub( /\b([^aeiouy\s]{2,})\b/i) {|w| w.upcase}.gsub( /\bsqa\b/i) {|w| w.upcase}.gsub( /^(it|is)\b/i) {|w| w.upcase}.gsub( /(\biii?\b)/i) {|w| w.upcase}.gsub( /\bRN\b/i, 'registered nurse' ).gsub( /\bvp\b/i, 'vice president' ).gsub( /\bcoo\b/i, 'chief operating officer' ).gsub( /\bj(ava|avascript)\b/i, 'J\1' ).gsub( /\bunix\b/i, 'Unix' ).gsub( /ascii/i) {|w| w.upcase}.gsub( /\binternet\b/i, 'Internet' ).gsub( /\burl\b/i, 'URL' ).gsub( /\bandroid\b/i, 'Android' ).gsub( /\bu(nited)?\s*\.?\s*s(tates)?\b\.?(?=..)/, 'U.S.' )
				
		else 
			job = job.sub( /(.*)/, '\"\1\"' )
		end
	
end

#Method for selecting job categories formatted like this: 'Business,Transportation and Logistics,Trucking' => 'trucking'
def dc_job_category(category)
	
		#lowercase all characters
		category = category.downcase
			
		#drop all categories except the most specific
		category = category.gsub(/(?:.*)\,([^\,]+)\Z/i, '\1' )
	
end

def job_type(type)

		#part-time, full-time considerations
		type = type.gsub( /p(art)?\s*\-?\/?\s*t(ime)?/i, 'part-time' ).gsub( /f(ull)?\s*\-?\/?\s*t(ime)?/i, 'full-time')

end

def downcase_and_quotes(line)
		line = line.downcase.sub( /(.*)/, '"\1"' )
end


puts "Business,Transportation and Logistics,Trucking = " + dc_job_category("Business,Transportation and Logistics,Trucking").to_s
puts job_type("ft")
puts job_type("pt")
puts job_type("fulltime")
puts job_type("f time")
puts job_type("parttime")
