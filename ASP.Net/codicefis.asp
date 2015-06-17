<%		
option explicit
'dichiarazione di tutte le varibili che utilizzeremo'
dim strnome,strcognome,i
dim consonante, vocale,cf
dim nome,cognome,con1,voc1,comune
dim con2,voc2,data,anno,mese,giorno
'richiamo dal form tutti i dati immessi request.form("cognome") prenderà solo il campo con name="cognome"'
strcognome=replace(ucase(request.form("cognome"))," ","")
strnome=ucase(request.form("nome"))
data=request.form("nascita")


'estrazione lettera per letttera del nome
for i=1 to len(strnome)
	
		if (mid(strnome,i,1))="A" OR (mid(strnome,i,1))="E" OR (mid(strnome,i,1))="I" OR (mid(strnome,i,1))="O" OR (mid(strnome,i,1))="U" then
			voc1 = voc1 & mid(strnome,i,1)
		
		else
			con1 = con1 & mid(strnome,i,1)
		end if
next

'estrazione lettera per lettera del cognome
for i=1 to len(strcognome)
	if (mid(strcognome,i,1))>="A" AND (mid(strcognome,i,1))<="Z" then
		if (mid(strcognome,i,1))="A" OR (mid(strcognome,i,1))="E" OR (mid(strcognome,i,1))="I" OR (mid(strcognome,i,1))="O" OR (mid(strcognome,i,1))="U" Then
			voc2 = voc2 & mid(strcognome,i,1)
		
		else
			con2 = con2 & mid(strcognome,i,1)
		
		end if
	end if
next
'estrazione dalla data del mese'
mese=DatePart("m",data)
select case mese
	case 1
		mese = "A"
	case 2
		mese= "B"
	case 3
		mese= "C"
	case 4
		mese= "D"
	case 5
		mese= "E"
	case 6
		mese = "H"	
	case 7
		mese= "L"
	case 08
		mese= "M"
	case 9
		mese= "P"
	case 10
		mese= "R"
	case 11
		mese= "S"
	case 12
		mese= "T"	
END Select
'composizione delle ultime variabili'
giorno=(DatePart("d",data))
anno = right(DatePart("yyyy",data),2)
nome=left(con1 & voc1 & "XX",3)
cognome=left(con2 & voc2 & "XX",3)
comune= request.form("comuni")
cf= cognome & nome & anno & mese & giorno & comune
'stampa a video della codice fiscale completo'
response.write(cf)
%>