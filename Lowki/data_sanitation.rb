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

$var_saints = '(Matthew|Maximilian|Bernardine|Peter|Martin|Benedict|Peregrine|Joseph|Monica|Venerable|Rose|Francis|Thomas|Catharine|Luke|Dominic|Sebastian|Raymond|Elizabeth|Nicholas|Louis|Cosmas|Ambrose|Gile|Lucas|Raphael|Wenceslaus|John|George|Agatha|Stephen|Nichola|Gabriel|Vincent|Robert|Charles|Aloysius|Maria|Jame|Isidore|Lawrence|Brigid|Ansgar|Apollonia|Jude|Rita|Giles|Polycarp|Patrick|Gregory|Augustine|Bridget|Catherine|Clare|Lucy|Andrew|Joan|Boniface|Agnes|Ann|Blessed|Teresa|Frances|Camillus|Martha|James|Jerome|Casimir|Anthony|Zita|Albert|Cecilia|Cyprian|Isaac|Mark|Scholastica|Mary|David|Stanislau|Georg|Ignatius|Basil|Casimi|Bede|Paschal|Cyril|Louise|Timothy|Alphonsus|Blaise|Josep|Philip|Gertrude)'	#This can be inserted as a disjunction into regex whenever we need to convert St. to Saint, or something similar.

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
		
		#Add comma before 'Unit' or 'No.'
		abb_street = abb_street.gsub( /(?<!\,)\s*(Unit|No\.)/i, ', \1' )
			
		#Eliminates unnecessary information from before an address.
		abb_street = abb_street.gsub( /.*\,\s+(\d+\b\s+\w)/i, '\1' )
		
		#Suites, apartments, and lots
		abb_street = abb_street.gsub( /(?<=\,)\s*\bs(ui)?te\.*/i, ' Suite' ).gsub( /(?<!\,)\s\bs(ui)?te\.*/i, ', Suite' ).gsub( /(?<!\,)\bs(ui)?te\.*/i, ', Suite' ).gsub( /(?<=\,)\s*\bap(artmen)?t\.*/i, ' Apt.' ).gsub( /(?<!\,)\s\bap(artmen)?t\.*/i, ', Apt.' ).gsub( /(?<!\,)\bap(artmen)?t\.*/i, ', Apt.' ).gsub( /(?<!\,)\s*\blot\b/i, ', Lot' ).gsub( /\bSuite\s*([A-Za-z0-9\-]{1,5})\s(?:&|and)\s([A-Za-z0-9\-]{1,5})/i, 'Suites \1 and \2' )
		
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
