<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Contracte</title>
       <style> 
   body {
  background-image: url('perete.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}  
    h1 {
  margin-top:250px;
  }
  
   a:visited {
  color: #6B6A6A;
   background-color: transparent;
   text-decoration: none;

</style>
        
        
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String[] s = request.getParameterValues("primarykey");
            jb.connect();
            jb.stergeDateTabela(s, "contracte", "idcontract");
            jb.disconnect();
        %>
         <h1 align="center" >
            <a href="index.html" style="text-decoration: none;"><b>Acasa</b></a>
            <br/>
        </h1>
    </body>
</html>
