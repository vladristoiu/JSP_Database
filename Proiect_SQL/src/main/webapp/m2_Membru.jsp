<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Membru</title>
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
        
          h1 {margin-bottom:100px;
  margin-top:100px;}
        
       
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
        <h1 align="center"> Tabela Membru:</h1>
        <br/>
        <p align="center"><a href="nou_Membru.jsp" style=" font-size: 20px;  text-decoration: none;"><b>Adauga un nou membru</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idmembru"));
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Data_Nasterii = request.getParameter("Data_Nasterii");
            String Nationalitate = request.getParameter("Nationalitate");
            String Avere = request.getParameter("Avere");

            String[] valori = {Nume, Prenume, Data_Nasterii, Nationalitate, Avere };
            String[] campuri = {"Nume", "Prenume", "Data_Nasterii", "Nationalitate", "Avere"};
            jb.modificaTabela("membri", "idmembru", aux, campuri, valori);
            jb.disconnect();
        %>
       <h2 align="center" style=" font-size: 20px;  text-decoration: none;">Modificarile au fost efectuate !</h2>
        <p align="center" style=" font-size: 20px;  text-decoration: none;">
            <a href="index.html" style="text-decoration: none;"><b>Acasa</b></a></p>
            <br/>
    </body>
</html>
