<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Formatii</title>
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
        <h1 align="center">Tabela Formatii:</h1>
        <br/>
        <p align="center"><a href="noua_Formatie.jsp" style=" font-size: 20px;  text-decoration: none;"><b>Adauga o noua formatie</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("formatii", "idformatie", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Data_Infiintare = rs.getString("Data_Infiintare");
            String Numar_Albume = rs.getString("Numar_Albume");
            String Gen_Muzical = rs.getString("Gen_Muzical");
            String Tara_De_Origine = rs.getString("Tara_De_Origine");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Formatie.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdFormatie:</td>
                    <td> <input type="text" name="idformatie" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume :</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data Infiintare:</td>
                    <td> <input type="text" name="Data_Infiintare" size="30" value="<%= Data_Infiintare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Numar Albume:</td>
                    <td> <input type="text" name="Numar_Albume" size="30" value="<%= Numar_Albume%>"/></td>
                </tr>
                 <tr>
                    <td align="right">Gen Muzical:</td>
                    <td> <input type="text" name="Gen_Muzical" size="30" value="<%= Gen_Muzical%>"/></td>
                </tr>
                 <tr>
                    <td align="right">Tara de Origine:</td>
                    <td> <input type="text" name="Tara_De_Origine" size="30" value="<%= Tara_De_Origine%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"style=" font-size: 20px;  text-decoration: none;"><b>Acasa</b></a>
            <br/>
    </body>
</html>
