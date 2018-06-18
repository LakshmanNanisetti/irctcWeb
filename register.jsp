<%-- 
    Document   : register
    Created on : Jun 11, 2018, 5:48:45 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,src.Booker"%>
<%!
    String name,mobile,password;
    Integer age;
    Connection conn;
    Statement stmt;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <%  
            name = request.getParameter("name");
            mobile = request.getParameter("mobile");
            password = request.getParameter("password");
            age = Integer.parseInt(request.getParameter("age"));
            if(Booker.register(name,mobile,password,age)){
            	RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            	rd.forward(request,response);
            }
            else{
            	response.getWriter().write("failure");
            	RequestDispatcher rd = request.getRequestDispatcher("index.html");
            	rd.forward(request,response);
            }
        %>
    </body>
</html>
