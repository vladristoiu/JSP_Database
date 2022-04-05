<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Contracte</title>
        
        
        <style>
   
      table, th, td {
    text-align : center;
    border-bottom: 1px solid #818181;
     border-top :none;
     border-left :none;
     border-right :none;
     border-collapse: collapse;
     
     }
     
     th, td {
    font-size: 20px;
    padding : 10px;
   } 
    .tab2 {
            display: inline-block;
            margin-left: 1100px;
            
        }
    
    a:visited {
  color: #6B6A6A;
  background-color: transparent;
  text-decoration: none;}
  
  tr:nth-child(even) {background-color: #ECEAEA;}
    
    body {
  background-image: url('perete.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
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
        
        <h1 align="center"> Tabela Contracte:</h1>
        <br/>
        <p align="center"><a href="nou_Contract.jsp" style="text-decoration: none; font-size: 20px;"><b>Adauga un nou contract</b></a></p>
        <form action="sterge_Contract.jsp" method="post">
            <table border="1" align="center" >
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdContract:</b></td>
                    <td><b>IdFormatie:</b></td>
                    <td><b>NumeFormatie:</b></td>
                    <td><b>Data Infiintare:</b></td>
                    <td><b>Numar Albume:</b></td>
                    <td><b>Gen Muzical:</b></td>
                    <td><b>Tara De Origine:</b></td>
                    <td><b>IdMembru:</b></td>
                    <td><b>NumeMembru:</b></td>
                    <td><b>PrenumeMembru:</b></td>
                    <td><b>Data Nasterii:</b></td>
                    <td><b>Nationalitate:</b></td>
                    <td><b>Avere:</b></td>
                    <td><b>Data Semnare:</b></td>
                    <td><b>Data Finalizare:</b></td>
                    <td><b>Clauza De Prelungire:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeContract();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idcontract");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    
                   
                    <td><%= rs.getInt("idformatie_contract")%></td>
                    <td><%= rs.getString("NumeFormatie")%></td>
                    <td><%= rs.getString("Data_Infiintare")%></td>
                    <td><%= rs.getString("Numar_Albume")%></td>
                    <td><%= rs.getString("Gen_Muzical")%></td>
                    <td><%= rs.getString("Tara_De_Origine")%></td>
                    <td><%= rs.getInt("idmembru_contract")%></td>
                    <td><%= rs.getString("NumeMembru")%></td>
                    <td><%= rs.getString("PrenumeMembru")%></td>
                    <td><%= rs.getString("Data_Nasterii")%></td>
                    <td><%= rs.getString("Nationalitate")%></td>
                    <td><%= rs.getString("Avere")%></td>
                    <td><%= rs.getString("Data_Semnare")%></td>
                    <td><%= rs.getString("Data_Finalizare")%></td>
                    <td><%= rs.getString("Clauza_De_Prelungire")%></td>
                    
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/> <!--  table, th, td {
    text-align : center;
    border-bottom: 1px solid #818181;
     border-top :none;
     border-left :none;
     border-right :none;
     border-collapse: collapse;
     
     }
     
     th, td {
    font-size: 20px;
    padding : 13px;
   } -->
        
    </body>
</html>
