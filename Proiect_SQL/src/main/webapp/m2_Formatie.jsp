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
        <h1 align="center"> Tabela Formatii:</h1>
        <br/>
        <p align="center"><a href="noua_Formatie.jsp" style=" font-size: 20px;  text-decoration: none;"><b>Adauga o noua formatie</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idformatie"));
            String Nume = request.getParameter("Nume");
            String Data_Infiintare = request.getParameter("Data_Infiintare");
            String Numar_Albume = request.getParameter("Numar_Albume");
            String Gen_Muzical = request.getParameter("Gen_Muzical");
            String Tara_De_Origine = request.getParameter("Tara_De_Origine");

            String[] valori = {Nume, Data_Infiintare, Numar_Albume,Gen_Muzical, Tara_De_Origine };
            String[] campuri = {"Nume", "Data_Infiintare", "Numar_Albume", "Gen_Muzical" , "Tara_De_Origine"};
            jb.modificaTabela("formatii", "idformatie", aux, campuri, valori);
            jb.disconnect();
        %>
        <h2 align="center" style=" font-size: 20px;  text-decoration: none;">Modificarile au fost efectuate !</h2>
        <p align="center" style=" font-size: 20px;  text-decoration: none;">
            <a href="index.html" style="text-decoration: none;"><b>Acasa</b></a></p>
            <br/>
    </body>
</html>
