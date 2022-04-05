<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Contracte</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        
        <style>
        
        a:visited {
  color: #6B6A6A;
  background-color: transparent;
  text-decoration: none;}
  
    body {
  background-image: url('perete.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;}
  
   .tab2 {
            display: inline-block;
            margin-left: 1100px;
            
        }
  
      </style>
        
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <p align="center">
           <img src="muzica.png"  alt="produse" width="50" height="30">
         <span class="tab2"></span>
            <a href="index.html" style=" font-size: 20px;  text-decoration: none;" ><b>Acasa</b></a>
        </p>
        <h1 align="center">Tabela Contracte:</h1>
        <br/>
        <p align="center"><a href="nou_Contract.jsp" style=" font-size: 20px;  text-decoration: none;"><b>Adauga un nou contract</b></a></p>
        <%
            jb.connect();
            String NumeFormatie, Data_Infiintare, Numar_Albume, Gen_Muzical, Tara_De_Origine, NumeMembru, PrenumeMembru, Data_Nasterii, Nationalitate, Avere, Data_Semnare,Data_Finalizare,Clauza_De_Prelungire ;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceContractId(aux);
            rs.first();
            int id1 = rs.getInt("idformatie_contract");
            int id2 = rs.getInt("idmembru_contract");

            NumeFormatie = rs.getString("NumeFormatie");
            Data_Infiintare = rs.getString("Data_Infiintare");
            Numar_Albume = rs.getString("Numar_Albume");
            Gen_Muzical = rs.getString("Gen_Muzical");
            Tara_De_Origine = rs.getString("Tara_De_Origine");
            NumeMembru = rs.getString("NumeMembru");
            PrenumeMembru = rs.getString("PrenumeMembru");
            Data_Nasterii = rs.getString("Data_Nasterii");
            Nationalitate = rs.getString("Nationalitate");
            Avere = rs.getString("Avere");
            Data_Semnare = rs.getString("Data_Semnare");
            Data_Finalizare = rs.getString("Data_Finalizare");
            Clauza_De_Prelungire = rs.getString("Clauza_De_Prelungire");

            ResultSet rs1 = jb.vedeTabela("formatii");
            ResultSet rs2 = jb.vedeTabela("membri");
            int idformatie, idmembru;


        %>
        <form action="m2_Contract.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdContratc:</td>
                    <td> <input type="text" name="idcontract" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idformatie:</td>
                    <td> 
                        <SELECT NAME="idformatie">
                            <%
                                while (rs1.next()) {
                                    idformatie = rs1.getInt("idformatie");
                                    NumeFormatie = rs1.getString("Nume");
                                    Data_Infiintare = rs1.getString("Data_Infiintare");
                                    Numar_Albume = rs1.getString("Numar_Albume");
                                    Gen_Muzical = rs1.getString("Gen_Muzical");
                                    Tara_De_Origine = rs1.getString("Tara_De_Origine");
                                    if (idformatie != id1) {
                            %>
                            <OPTION VALUE="<%= idformatie%>"><%= idformatie%>, <%= NumeFormatie%>, <%= Data_Infiintare%>, <%= Numar_Albume%>,<%= Gen_Muzical%>,<%= Tara_De_Origine%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idformatie%>"><%= idformatie%>, <%= NumeFormatie%>, <%= Data_Infiintare%>, <%= Numar_Albume%>,<%= Gen_Muzical%>,<%= Tara_De_Origine%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idmembru:</td>
                    <td> 
                        <SELECT NAME="idmembru">
                            <%
                                while (rs2.next()) {
                                	idmembru = rs2.getInt("idmembru");
                                	NumeMembru = rs2.getString("Nume");
                                	PrenumeMembru = rs2.getString("Prenume");
                                	Data_Nasterii = rs2.getString("Data_Nasterii");
                                	Nationalitate = rs2.getString("Nationalitate");
                                	Avere = rs2.getString("Avere");
                            if (idmembru != id2) {
                            %>
                            <OPTION VALUE="<%= idmembru%>"><%= idmembru%>, <%= NumeMembru%>, <%= PrenumeMembru%>, <%= Data_Nasterii%>,<%= Nationalitate%>,<%= Avere%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idmembru%>"><%= idmembru%>, <%= NumeMembru%>, <%= PrenumeMembru%>, <%= Data_Nasterii%>,<%= Nationalitate%>,<%= Avere%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Data Semnare:</td>
                    <td> <input type="text" name="Data_Semnare" size="30" value="<%= Data_Semnare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data Finalizare:</td>
                    <td> <input type="text" name="Data_Finalizare" size="30" value="<%= Data_Finalizare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Clauza de prelungire:</td>
                    <td> <input type="text" name="Clauza_De_Prelungire" size="30" value="<%= Clauza_De_Prelungire%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"style=" font-size: 20px;  text-decoration: none;"><b>Acasa</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>
