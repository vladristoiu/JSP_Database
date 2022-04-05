<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga membru</title>
        
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
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Data_Nasterii = request.getParameter("Data_Nasterii");
            String Nationalitate = request.getParameter("Nationalitate");
            String Avere = request.getParameter("Avere");
            if (Nume != null) {
                jb.connect();
                jb.adaugaMembru(Nume, Prenume, Data_Nasterii, Nationalitate, Avere );
                jb.disconnect();
        %>
        <p align="center">Datele au fost adaugate.</p><%
        } else {
        %>
         <p align="center">
           <img src="muzica.png"  alt="produse" width="50" height="30">
         <span class="tab2"></span>
            <a href="index.html" style=" font-size: 20px;  text-decoration: none;" ><b>Acasa</b></a>
        </p>
        <h1 align="center"> Suntem in tabela Membri</h1>
        <form action="nou_Membru.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Nume Membru:</td>
                    <td> <input type="text" name="Nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume Membru:</td>
                    <td> <input type="text" name="Prenume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Data Nasterii:</td>
                    <td> <input type="text" name="Data_Nasterii" size="30" /></td>
                </tr>
                 <tr>
                    <td align="right">Nationalitate:</td>
                    <td> <input type="text" name="Nationalitate" size="30" /></td>
                </tr>
                 <tr>
                    <td align="right">Avere:</td>
                    <td> <input type="text" name="Avere" size="30" /></td>
                </tr>
            </table>
            <p align="center"><input type="submit" value="Adauga membrul" /></p>
        </form>
        <%
            }
        %>
         <br/>
        <p align="center"><a href="index.html" style=" font-size: 20px;  text-decoration: none;" ><b>Acasa</b></a></p>
        <br/>
        
    </body>
</html>
