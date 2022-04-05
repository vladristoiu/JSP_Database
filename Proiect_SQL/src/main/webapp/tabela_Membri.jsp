<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Membri</title>
        
        
        <style>
    table, th, td {
    text-align : center;
    border-bottom: 1px solid #818181;
     border-top :none;
     border-left :none;
     border-right :none;
     border-collapse: collapse;
     }
     table{width: 100%;}
     
     th, td {
    font-size: 20px;
    padding : 13px;}
     
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
        
        <h1 align="center"> Tabela Membri:</h1>
        <br/>
        <p align="center"><a href="nou_Membru.jsp" style="text-decoration: none; font-size: 20px;"><b>Adauga un nou membru</b></a></p>
        <form action="sterge_Membru.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdMedic:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Prenume:</b></td>
                    <td><b>Data Nasterii:</b></td>
                    <td><b>Nationalitate:</b></td>
                    <td><b>Avere:</b></td>

                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("membri");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idmembru");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("Nume")%></td>
                    <td><%= rs.getString("Prenume")%></td>
                    <td><%= rs.getString("Data_Nasterii")%></td>
                    <td><%= rs.getString("Nationalitate")%></td>
                    <td><%= rs.getString("Avere")%></td>
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
        <br/>
        
    </body>
</html>
