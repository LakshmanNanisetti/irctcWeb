<%-- 
    Document   : login
    Created on : Jun 11, 2018, 3:56:28 PM
    Author     : Administrator
--%>

<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="src.Booker"%>
<%@page import="java.security.Principal"%>
<!DOCTYPE html>
<%!
    String formMobile;
    String formPassword;
    Principal p;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%-- <%
           formMobile = request.getParameter("mobile");
           formPassword = request.getParameter("password");
           if(Booker.login(formMobile,formPassword)){
               session.setAttribute("mobile", formMobile);
              %>
              <jsp:forward page="home.jsp" />
               <%       
           }
           else{
               %>
               <jsp:forward page="index.html" />
        <%}%> --%>
        
        <%
            
           formMobile = request.getParameter("mobile");
           formPassword = request.getParameter("password");
           
           
           if(Booker.login(formMobile,formPassword)){
               session.setAttribute("mobile", formMobile);
            
           %>
               <jsp:forward page="home.jsp" />
           <%}else{ %>
           		<jsp:forward page="index.html" />
           	<%} %>

    </body>
</html>
