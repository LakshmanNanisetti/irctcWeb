<%-- 
    Document   : home
    Created on : Jun 11, 2018, 4:21:09 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,src.Booker"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<%!
    Connection conn;
    Statement stmt;
    ResultSet rs;
    ArrayList<String> fromal=new ArrayList<String>();
    ArrayList<String> toal=new ArrayList<String>();
%>
<%	
	fromal = Booker.getFrom();
	toal = Booker.getTo(); 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IRCTC</title>
    </head>
    <body>
        <form method="POST" action="train.jsp">
        <table>
        <tr>
        <td>
            From:
        </td>
        <td>
            <select name="from">
            <% for(String f:fromal){%>
                <option value="<%=f%>"><%=f%></option>
            <%}%>
            </select>
            <br>
            </td>
        </tr>
        <tr>
        <td>
            To:
            </td>
        <td>
            <select name="to">
            <% for(String t:toal){%>
                <option value="<%=t%>"><%=t%></option>
            <%}%>
            </select>
            <br/>
         </td>
         </tr>
         <tr>
            <td>
            Day:
            </td>
            <td>
            <select name="day">
                <option value=1>Monday</option>
                <option value=2>Tuesday</option>
                <option value=3>Wednesday</option>
                <option value=4>Thursday</option>
                <option value=5>Friday</option>
                <option value=6>Saturday</option>
                <option value=7>Sunday</option>
            </select>
            <br/>
            </td>
            </tr>
            <tr>
            <td>
            <input type="submit" value="search">
            </td>
            </tr>
            </table>
        </form>
    </body>
</html>

