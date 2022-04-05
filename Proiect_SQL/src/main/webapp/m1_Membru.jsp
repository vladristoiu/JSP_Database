<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Membri</title>
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
        <h1 align="center">Tabela Membri:</h1>
        <br/>
        <p align="center"><a href="nou_Membru.jsp" style=" font-size: 20px;  text-decoration: none;"><b>Adauga un nou membru</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("membri", "idmembru", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Prenume = rs.getString("Prenume");
            String Data_Nasterii = rs.getString("Data_Nasterii");
            String Nationalitate = rs.getString("Nationalitate");
            String Avere = rs.getString("Avere");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Membru.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdMembru:</td>
                    <td> <input type="text" name="idmembru" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="Prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data Nasterii:</td>
                    <td> <input type="text" name="Data_Nasterii" size="30" value="<%= Data_Nasterii%>"/></td>
                </tr>
                <tr>
                    <td align="right">Nationalitate:</td>
                    <td> <input type="text" name="Nationalitate" size="30" value="<%= Nationalitate%>"/></td>
                </tr>
                <tr>
                    <td align="right">Avere:</td>
                    <td> <input type="text" name="Avere" size="30" value="<%= Avere%>"/></td>
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
