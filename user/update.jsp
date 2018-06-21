<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.sql.*,src.*"
%>
<%!
int no;
int trainNo;
String cat;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update</title>
</head>
<body>
<%
no = Integer.parseInt(request.getParameter("seats"));
trainNo = Integer.parseInt(request.getParameter("train"));
cat = request.getParameter("category");
ArrayList<String> names = new ArrayList<String>();
ArrayList<Integer> ages = new ArrayList<Integer>();
ArrayList<Integer> gens = new ArrayList<Integer>();
for(int i=1;i<=no;i++){
	names.add(request.getParameter("pass"+i));
	ages.add(Integer.parseInt(request.getParameter("age"+i)));
	gens.add(Integer.parseInt(request.getParameter("gen"+i)));
}
if(!Booker.book((String)session.getAttribute("mobile"),Integer.parseInt((String)session.getAttribute("day")),trainNo
		,cat,names,ages,gens)){
	%>
	<jsp:forward page="train.jsp"/>
	<%
}
else{
	%>
	<jsp:forward page="home.jsp"/>
	<%
}
%>
</body>
</html>