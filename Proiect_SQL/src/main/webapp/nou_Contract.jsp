<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga contract</title>
        
        <style>
        
        a:visited {
  color: #6B6A6A;
  background-color: transparent;
  text-decoration: none;}
  
 .tab2 {
            display: inline-block;
            margin-left: 1100px;}
    
    body {
  background-image: url('perete.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}
        
        h1 {
  margin-top:100px;
  margin-bottom:75px}
        
        </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idformatie, idmembru;
            String id1, id2, NumeFormatie ,Data_Infiintare, Numar_Albume, Gen_Muzical,Tara_De_Origine, NumeMembru, PrenumeMembru, Data_Nasterii, Nationalitate, Avere, Data_Semnare, Data_Finalizare, Clauza_De_Prelungire;
            id1 = request.getParameter("idformatie");
            id2 = request.getParameter("idmembru");
            Data_Semnare = request.getParameter("Data_Semnare");
            Data_Finalizare = request.getParameter("Data_Finalizare");
            Clauza_De_Prelungire = request.getParameter("Clauza_De_Prelungire");
            if (id1 != null) {
                jb.connect();
                jb.adaugaContract(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Data_Semnare, Data_Finalizare, Clauza_De_Prelungire);
                jb.disconnect();
        %>
        <p align="center">Datele au fost adaugate</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("formatii");
        ResultSet rs2 = jb.vedeTabela("membri");
        %>
         <p align="center">
           <img src="muzica.png"  alt="produse" width="50" height="30">
         <span class="tab2"></span>
            <a href="index.html" style=" font-size: 20px;  text-decoration: none;" ><b>Acasa</b></a>
        </p>
        <h1 align="center"> Suntem in tabela contracte </h1>
        <form action="nou_Contract.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdFormatie:</td>
                    <td> 
                        Selectati formatia:
			<SELECT NAME="idformatie" >
                                <%
                                    while(rs1.next()){
                                    	idformatie = rs1.getInt("idformatie");
                                    	NumeFormatie = rs1.getString("Nume");
                                    	Data_Infiintare = rs1.getString("Data_Infiintare");
                                    	Numar_Albume = rs1.getString("Numar_Albume");
                                    	Gen_Muzical = rs1.getString("Gen_Muzical");
                                    	Tara_De_Origine = rs1.getString("Tara_De_Origine");
                                %>
                                    <OPTION VALUE="<%= idformatie%>"><%= idformatie%>,<%= NumeFormatie%>,<%= Data_Infiintare%>,<%= Numar_Albume%> ,<%= Numar_Albume%> ,<%= Numar_Albume%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdMembru:</td>
                    <td> 
                        Selectati membrul:
			<SELECT NAME="idmembru">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                    	idmembru = rs2.getInt("idmembru");
                                        NumeMembru = rs2.getString("Nume");
                                        PrenumeMembru = rs2.getString("Prenume");
                                        Data_Nasterii = rs2.getString("Data_Nasterii");
                                        Nationalitate = rs2.getString("Nationalitate");
                                        Avere = rs2.getString("Avere");
                                %>
                                    <OPTION VALUE="<%= idmembru%>"><%= idmembru%>,<%= NumeMembru%>,<%= PrenumeMembru%>,<%= Data_Nasterii%>,<%= Nationalitate%> ,<%= Avere%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Data Semnare:</td>
                    <td > <input type="text" name="Data_Semnare" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Data Finalizare:</td>
                    <td> <input type="text" name="Data_Finalizare" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Clauza de Prelungire:</td>
                    <td> <input type="text" name="Clauza_De_Prelungire" size="30" /></td>
                </tr>
            </table>
            <p align="center"><input type="submit" value="Adauga contractul" /></p>
        </form>
        <%
            }
        %>
          <br/>
        <p align="center"><a href="index.html" style=" font-size: 20px;  text-decoration: none;" ><b>Acasa</b></a></p>
        <br/>
        
    </body>
</html>
