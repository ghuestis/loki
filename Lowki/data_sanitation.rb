def normalize(value)
  value.gsub!(/\b([A-Za-z\'\-]+)\b/){|m| m.capitalize}
  value.gsub!(/\b(of|and|or|the|is|a|in|to|from)\b/i){|m| m.downcase} #UCLC exceptions
  return value
end

def downcase(value)
  value.gsub!(/\b([A-Za-z\'\-]+)\b/){|m| m.downcase}
  return value
end


def nameswap(value)
  #common formats
  value.sub!(/^\s*([A-Za-z\'\-]+)(?:, |\s{2,}|\t)([A-Za-z\'\-]+) ([A-Za-z\'\-]+)\s*$/, '\2 \3 \1')
  value = normalize(value)
  value.sub!(/\b([A-Z])\b\.*/, '\1.') unless value =~ $business_flags
  
  return value
  #placeholder
end

#method to replace html entities
def html_entities(line)
		line = line.gsub( /&amp;|&#38;/, '&' ).gsub( /&nbsp;|&#160;/, ' ' ).gsub( /&lt;|&#60;/, '<' ).gsub( /&gt;|&#62;/, '>' ).gsub( /&#34;|&quot;/, '"' ).gsub( /&#39;|&apos;/, '\'' )
end

#method to capitalize first (and only the first) letter of all words in a string.
#G - deprecating, this is normalization. \S+ is too broad, see 'normalize' method
#def cap_first(line)
#		string = ""
#		line = line.scan(/\b\S+/).each {|element| string << element.capitalize + " "}
#		return string
#end

$business_flags = Regexp.new(('(?:1990|1991|1992|1993|1994|1995|1996|1997|1998|1999|2000|2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|\bNewspapers\b|\bDeli\b|\bNewspaper\b|\bPlan\b|And Son|Assn|Assoc|Author|Beach |Commerc|COMMUNICATION |COMMUNICATIONS |Company |Corp|Court |Equest|Estates|Fund |Funding|\bInternational\b|\bIntl\b|\bIntern\b|\bIntrn\b|Invest|Invs|\bDBA\b|\bDoing Business As\b|\bDba\b|Propert\b|\bProp\b|\bRentals\b|\bRental\b|Real Est|Sales |Sands |Terrace\b|\bStreet |Valley |\bCtr\b|\bCenter |Canyon|\bWay |Road |Market |\bProperties\b|\bPlaza\b|Trade |1st|1th|2nd|2th|3rd|3th|4th|5th|6th|7th|8th|9th| Palm | Palms |Palm B|Palms | Beach |\bLtd\b|\bLimited| Indus|\bBank\b|\bMortgage\b|\bFinan\b|\bBankers\b|\bFinancial\b|\bInsurance\b|\bLoan |\bLabor | Servi |Serv |Serv. |\bSolutions\b|Wild Life|Wildlife|\bWeekly\b|\bState\b|\bStates\b|\bIllinois\b|\bChicago\b|\bMidwest\b|Tiitf|Fl |Fla |Florida|Foundation|Service|Centex|\bHomes\b|\bHousing\b|\bConcrete\b|\bHomeowners\b|\bApartments\b|\broofing\b|Town H|Townhome|Townhouse|\bROOFING\b|Develop\b|Devt|\bDev\b|Devco\b|Village |\bCollege\b|\bSchool\b|\bUniv\b|\bInstitute\b|\bHospital\b|\bLaboratory\b|\bFinger print\b|Wells Fargo|Citibank|Citifinancial|\bCity\b|\bCounty\b|Fannie M|Fsb|\bFa\b|\bNa\b|\bNo\b|\bMtg\b|B Nutter|\bSav\b|\bBa\b|\bCondom\b|\bCondomi\b|\bCondo |Tcif|\bReo |Ocean|Ocwen|Crest |Lehman |Mesquite|Manhattan |Distinctive|Distributors\b|\bDistributing\b|Classic|CERTIFIED|Vegas|Clark C|Resort|Vacation|\bGroup\b|\bGrp\b|\bUnited\b|\bSociety\b|\bClub\b|\bCommunity\b|\bFirm\b|L L C|\bL P\b|L L P|Lllp|\bLp\b|\bLlp\b|\bL.P.\b|\bDept\b|\bDepartment\b|\bInc\b|\bInc.\b|\bInc,\b|\bCo\b|\bCouncil\b|\bLands?(\b|cap(e|ing)\b)|Bureau|Manage|\bNew |Number |Kings |Bronx |Queens |Borough|Boro |Year |Children|\bNations|NETWORK |Republic|\bNetworks\b|Secretary|\bOf |\bAffairs\b|\bAccount\b|Partner|Ptnrs|P And S |\bDOR\b|\bPRODUCTS\b|Committee|\bAGENCY |basil ford|CURRIE MOTORS|SMITH DAWSON & ANDREWS|DENKMANN & GRABAVOY|GULF SOUTH MEDICAL SUPPLY|GREAT LAKES KWIK SPACE|Salomon Bro\b|Wal Mart|CAMERA HOUSE WEST |ROUSKEY \& BALDACCI |OTTOSN BRTZ KLLY COOPR&GLBRT|\bLLC\b|\bLlc\b|L.L.C. |Textile|Petroleum|Promotions |\bAllied\b|\bPLUMBING|\bUniforms\b|\bUniform\b|\bENGINEERING\b|\bDesign\b|\bStrategies\b|\bBuilding\b|\bMarketing\b|Publishing |Publications |\bM D\b|PHYSICIANS |PSYCHOLOGICAL |\bPharmacy\b|\bDiagnostics\b|\bErgometrics\b|\bCATERING |\bLawncare\b|\bTrucks\b|\bLANDSCAPING\b|\bTire\b|\bWork\b|\bElectronic |\bElectric\b|\bElection\b|GREG SIGNS |\bJuror\b|SUPPLY |SYSTEM|SYSTEMS|\bTechnologies\b|TECHNOLOGY|\bDOCUMENT\b|\boffice\b|\bClinic\b|\bTowing\b|\bProtection\b|\bPolice\b|\bCREDIT\b|\bcredit\b|\bDMD\b|\bUniversity\b|\bRadiologists\b|\bBOARD\b|\bCoalition\b|\bCharities\b|\bHabitat\b|\bGovernment\b|\bManagement\b|\bINDUSTRIAL\b|\bLawn & Power\b|\bParts\b|\bAuto\b|\bEQUIPMENT\b|\bLINER\b|\bEZ\b|\bFreeway\b|\bGOLF\b|\bHAWK FORD\b|\bJOE COTTON FORD\b|\bLawnmower\b|\bElectrical\b|\bElectronics\b|\bPACKEY WEBB FORD\b|\bRADIATOR\b|Autoforce|\bUSA\b|EXCHANGE|\bTRANSPORTATION\b|\bof Bensenville\b|\bSoil\b|\bCONTRACTORS\b|\bMECHANICAL\b|\bSERVICES\b|\bJ A SEXAUER\b|\bMENARDS\b|\bARCHITECTURAL\b|\bEXCELLENCE\b|\bRANCH\b|\bHEALTH\b|\bHOME\b|\bLAD LAKE\b|\bACADEMY\b|\bSALT\b|\bHARDWARE\b|\bCROSSBOW\b|\bINDUSTRIES\b|\bCORPORATION\b|\bMATERIAL\b|\bKRONE SUE RLA\b| \bSUE KRONE RLA\b| \bSUE KRONE, RLA\b|\bProfessional\b|\bOf Willowbrook\b|\bAmerican\b|Laundry|\bAssociation\b|\bCommission\b|\bCongress\b|\bLocal\b|\bTomorrow\b|\bYesterday\b|\bSigns\b|\bWireless\b|\bWarehouse\b|\bTransit\b|\bGas\b|AT\&T|A T \& T|\bLibrary\b|\bELECTIONS\b|\bConstruction\b|\bCAPITAL\b|INCORPORATED|CORPORATE|\bGROCERY\b|\bFood\b|^Alex\b|^Erica\b|\bA CUT ABOVE\b|\bTheatres\b|\btheater\b|\bEvening\b|\bContracting\b|\bBrother(s|)\b|\bsister(s|)\b|\bExpressions\b|\bKIA$|\bTREATMENT\b|\bVillage\b|\bCENTERS?\b|\bISLAND\b|\bDEVELOPMENT\b|\bAssocation\b|\bDestination\b|\bSporting\b|\bgoods\b|\bCONSULT(ANT|ING)\b|\bFoods\b|\bUNLIMITED\b|\bARMORED\b|\bArrangements\b|\bEnsembles\b|\bEXPLOSIVE\b|\bFACTORY\b|\bEatery\b|\bNAILS\b|\bChiropractic\b|^GEORG(i|e|io)|\bSweets\b|\bImprovements\b|^GRZEGORZ\b|\bTelecommunications\b|\bVending\b|\bEXPRESS\b|\bCOMMERCIAL\b|\bPROPERTY\b|\bESTATE\b|\bInsure\b|\bRESTORATION\b|\bHIGH$|^JOSEFINA\b|\bCLEANERS\b|\'s|\bPARTNERSHIPS\b|\bOF SCHAUMBURG\b|\bLEND LEASE\b|\bLIONS GATE\b|\bSalon\b|\bRealty\b|\bRESTAURANT\b|\bshop\b|\bshoppe\b|\bMERRILL LYNCH\b|\bSouthwest\b|\bNortheast\b|\bNIPPON\b|\bFLOORING\b|\bPIZZA\b|^Patricia\b|\bDecoration\b|\bSports\b|\bALLSTATE\b|\bPeace\b|\bRealtor(|s)\b|\bSTUDIO\b|\bCOMPANIES\b|\bDDS\b|\btravel\b|\bBoomers\b|\bCurrency\b|\bDistrict\b|\bWATERWORKS\b|\bElevator\b|\bFurniture\b|\bCHEM-DRY\b|\bEFFECTS\b|\bRHYTHM\b|\bSPIRIT\b|^STEVE\b|\bSUBWAY\b|\bSOURCE\b|\bambulance\b|^SUZANNE\b|\bGRILL\b|\bCONDOMINIUM(|S)\b|\bFence\b|\bLAKES\b|\bVersailles\b|^VINCENT\b|\bUMBRELLA\b|\bGIFTS\b|\bHAMBURGERS\b|\bGARAGE\b|\bCamera\b|\bSHELL\b|\bWOODWORKING\b|\bCLEANING\b|\bKITCHEN\b|\bKITCHENS\b|^WILLIAM\b|\bREMODELING\b|\bTAN\b|\bACTIVE\b|\bOF\b|\bMARKET\b|\bBy\b|\bTOWNSHIP\b|\bALLIANCE\b|\bInternet\b|\bDesigns\b|\bSTORAGE\b|\bHAIR\b|\bThermo\b|\bIMPORTS\b|\bDairy\b|\bSTUDENT\b|\bExperience\b|\bFEDEX\b|\bHoldings\b|\bhouse\b|\bDAILY HERALD\b|\bPOOL\b|\bTOWN\b|\bCHOP SUEY\b|\bBEDDING\b|\bFitness\b|\bDentistry\b|\bMASSAGE\b|\bBRAINS\b|\bEXECUTIVE\b|\bORTHOPEDIC\b|\bAPPLIANCES\b|^STEVEN\b|\bNATIONAL\b|\bTelecom\b|\bCHEVROLET\b|\bPHOTOGRAPHY\b|\bBalance\b|\bBATHROOM\b|\bTILE\b|\bGUARDIAN\b|\bEXTERIORS\b|\bTUMBLING\b|^BRIAN\b|\bCONTROL\b|\bComfort\b|\bPOWER\b|\bAttraction\b|\bEnterprises\b|(|#)\d{3,5}|\bRectory\b|\bMissionary\b|\bIrrigation\b|\bDrywall\b|\bFavorite\b|\bRaceway\b|\bLoans\b|\bChicken\b|\bApiar(y|ies)\b|\bTools\b|\bArts\b|\bFlorist\b|\bChef\b|\bPediatrics\b|\bDental\b|\bAffordable\b|\bWINDOW(|S)|\bAutomotive\b|\bRECREATION\b|\bSIGN\b|^Mike\b|\bBuilders\b|\bRooting\b|\bHEATING\b|\bfoodmart\b|P\.A\.|\blomaslaw\b|\bCOOKING\b|^michael\b|\bInteriors\b|\balterations\b|\bLMT$|\bLMT.|\bPLUS\b|\bSPA\b|^sarah?\b|\bsaint\b|\bCUISINE\b|\bCUISINE\b|\bPro-Temp\b|\bair\b|\bconditioning\b|\bappliance\b|\bsprings?\b|\bbelieving\b|\bbookkeeping\b|\bexports?\b|\bTFO\b|\bAYME\b|\bPC\b|\bplumbing\b|advantage\b|\bdespertar\b|\brestaurante?\b|\bFireworks?\b|\branch(ing|er)\b|\bcellphone\b|\btesting\b|\brepair\b|\bengine\b|\baccessor(y|ies)\b|\bcream\b|\bempowerment\b|\bagency\b|\bassociates?\b|\bhousing\b|\bhous(e|ing)\b|.com\b|.net\b|\bNovak\s{0,}\&\s{0,}Kohen\b|\d|\bBRETHRENS M C\b|\bdonuts?\b|\blingerie\b|\bboutique\b|\bave.|\d+|\bout\b|\bconcessions?\b|\bcafeterias?\b|\bon\b|^keith\b(?!,)|\bvillages?\b|\bwelding\b|\blinecords?\b|\b(ph|f)ones?\b)'), Regexp::IGNORECASE)
$var_saints = '(Matthew|Maximilian|Bernardine|Peter|Martin|Benedict|Peregrine|Joseph|Monica|Venerable|Rose|Francis|Thomas|Catharine|Luke|Dominic|Sebastian|Raymond|Elizabeth|Nicholas|Louis|Cosmas|Ambrose|Gile|Lucas|Raphael|Wenceslaus|John|George|Agatha|Stephen|Nichola|Gabriel|Vincent|Robert|Charles|Aloysius|Maria|Jame|Isidore|Lawrence|Brigid|Ansgar|Apollonia|Jude|Rita|Giles|Polycarp|Patrick|Gregory|Augustine|Bridget|Catherine|Clare|Lucy|Andrew|Joan|Boniface|Agnes|Ann|Blessed|Teresa|Frances|Camillus|Martha|James|Jerome|Casimir|Anthony|Zita|Albert|Cecilia|Cyprian|Isaac|Mark|Scholastica|Mary|David|Stanislau|Georg|Ignatius|Basil|Casimi|Bede|Paschal|Cyril|Louise|Timothy|Alphonsus|Blaise|Josep|Philip|Gertrude)'	#This can be inserted as a disjunction into regex whenever we need to convert St. to Saint, or something similar.
$saint_regex = Regexp.new(('\bst\b\.*\s+(' + $var_saints +')' ), Regexp::IGNORECASE)

#$array_test = ['one','two','three','four','five','six','seven','eight','nine','ten','eleven']
#$string_test = 'one|two|three|four|five|six|seven|eight|nine|ten|eleven'
def sub_array(test)
  p $array_test
  p test
  time1 = Time.now
  100000.times do
    $array_test.each {|thing| test.gsub!(/(#{thing})/, '\1')}
  end
  time1 = Time.now - time1
  p "array: #{time1}"
  time1 = Time.now
  regex = Regexp.new(('('+$string_test+')' ), Regexp::IGNORECASE)
  100000.times do    
    test.gsub!(regex, '\1')
  end
  time1 = Time.now - time1
  p "string: #{time1}"
end

def date_standardization (date)
  #common formats
  date.sub!(/(\d{4})(?:-|\/|\\| |\#)(\d{1,2})(?:-|\/|\\| |\#)(\d{1,2})/, '\1-\2-\3')
  date.sub!(/(\d{1,2})(?:-|\/|\\| |\#)(\d{1,2})(?:-|\/|\\| |\#)(\d{4})/, '\3-\1-\2')
  return date
end

#method corresponding to abbreviated_streets algo
def abbreviated_streets(street)

		#Replaces html entities
		abb_street = html_entities(street)

		#P.O. Boxes handled
		abb_street = abb_street.gsub( /((?:P\.?O\.?)?\s+Box\s+[0-9A-Za-z]+)\,\s+(.+)/i, '\2, \1' ).gsub( /(?:P\.?O\.?\s?)?\sbox\s+([0-9A-Za-z]+)/i, 'P.O. Box \1' )
		
		#U.S.
		abb_street = abb_street.gsub( /\bU\b\.?\s*\bS\b\.?/i, 'U.S.' )

		#1st through 9th handled
		abb_street = abb_street.gsub( /\b1st\b/i, 'First' ).gsub( /\b2n?d\b/i, 'Second' ).gsub( /\b3r?d\b/i, 'Third' ).gsub( /\b4th\b/i, 'Fourth' ).gsub( /\b5th\b/i, 'Fifth' ).gsub( /\b6th\b/i, 'Sixth' ).gsub( /\b7th\b/i, 'Seventh' ).gsub( /\b8th\b/i, 'Eighth' ).gsub( /\b9th\b/i, 'Ninth' )

		#St. to Saint
		abb_street = abb_street.gsub( $saint_regex, 'Saint \1' )

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
		
		#Abbreviating compass points <<can probably move ordinals into a separate method
		abb_street = abb_street.gsub( /\bN(orth)?\b\.*/i, 'N.' ).gsub( /\bE(ast)?\b\.*/i, 'E.' ).gsub( /\bW(est)?\b\.*/i, 'W.' ).gsub( /\bN(orth)?\.*\s*e(ast)?\b\.*/i, 'N.E.' ).gsub( /\bN(orth)?\.*\s*w(est)?\b\.*/i, 'N.W.' ).gsub( /\bS(outh)?\.*\s*e(ast)?\b\.*/i, 'S.E.' ).gsub( /\bS(outh)?\.*\s*w(est)?\b\.*/i, 'S.W.' ).gsub( /\b(?<!')S(outh)?\b\.*/i, 'S.' )
		
		#Proper Capitalization
		abb_street = normalize(abb_street)
		
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
    
    abb_street = abb_street.gsub( /\bsaint\b/i, 'St.')
    
		return abb_street
end
