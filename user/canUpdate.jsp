<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,src.Booker"%>
<%!
int pid;
int tid;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>can</title>
</head>
<body>
<%
pid = Integer.parseInt(request.getParameter("pid"));
tid = Integer.parseInt(request.getParameter("tid"));
System.out.println(""+pid+"\t"+tid);
Booker.cancel(pid,tid);
%>
</body>
</html>