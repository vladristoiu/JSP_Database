<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga formatie</title>
        
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
            String Data_Infiintare = request.getParameter("Data_Infiintare");
           String Numar_Albume = request.getParameter("Numar_Albume");
            String Gen_Muzical = request.getParameter("Gen_Muzical");
            String Tara_De_Origine = request.getParameter("Tara_De_Origine");
            if (Nume != null) {
                jb.connect();
                jb.adaugaFormatie(Nume, Data_Infiintare, Numar_Albume, Gen_Muzical, Tara_De_Origine  );
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
        <h1 align="center"> Suntem in tabela Formatii</h1>
        <form action="noua_Formatie.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Nume Formatie:</td>
                    <td> <input type="text" name="Nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Data Infiintare:</td>
                    <td> <input type="text" name="Data_Infiintare" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Numar Albume:</td>
                    <td> <input type="text" name="Numar_Albume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Gen Muzical:</td>
                    <td> <input type="text" name="Gen_Muzical" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Tara De Origine:</td>
                    <td> <input type="text" name="Tara_De_Origine" size="30" /></td>
                </tr>
            </table>
            <p align="center"><input type="submit" value="Adauga formatie" /></p>
        </form>
        <%
            }
        %>
        <br/>
        <p align="center"><a href="index.html" style=" font-size: 20px;  text-decoration: none;" ><b>Acasa</b></a></p>
        <br/>
       
    </body>
</html>
