<html>
<HEAD>
	
</HEAD>
<BODY>
	<!--Creo il form per l'inserimento dei dati-->
	<form action="codicefis.asp" method="post">
		Cognome <input type="text" name="cognome"><BR>
     	 Nome <input type="text" name="nome"><br>
		  Data di Nascita <input type="text" name="nascita"><br>
	<!--creazione della connessione al database in ASP-->
	<%	
	conn="Provider=Microsoft.jet.OLEDB.4.0;Data Source="&Server.MapPath("/database/catasto.mdb")
	 set objConn = Server.CreateObject("ADODB.Connection")
	  objConn.Open conn 
	   Set rs=Server.CreateObject("ADODB.Recordset")
	    sql="SELECT comuni,catasto FROM COMUNI ORDER BY comuni"
	%>
	<!--Select per scegliere il comune di nascita-->
	Scegli comune <select name="comuni">
		<% 
		'continuazione della connessione al database, apertura dei record'
		 rs.open sql, objConn,3,3
		  do until rs.eof 
		 %>
		 <!--inserimento dei record nella select-->
			 <option value="<%response.write(rs("catasto"))%>" name="comune">
			 	<% response.write(rs("comuni"))%>
			 </option>
		<%
		 rs.MoveNext
		 Loop
		%>
	</select>
	<%
	rs.close
	set rs=nothing
	objConn.close 
	set objconn=nothing
%>
<input type="submit" value="Invia" name="invio"><br>
	</form>
</BODY>