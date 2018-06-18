<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="src.Booker,src.Passenger,java.util.*"%>
<%!
int tickId=1;
String resp = "";
String resp2 = "";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>passengers</title>
</head>
<body>
<%
String msg = request.getParameter("tick");
response.setContentType("text/html");
ArrayList<Passenger> ps = Booker.getPass(Integer.parseInt(msg));
resp="";
resp2="";
resp += "<table>"
+"<tr><th>ID</th><th>Name</th><th>Category</th><th>Bearh NO</th><th>Wl</th></tr>";
resp2 += "<select id=passengers name='passengers' style='display:none'>";
for(Passenger p:ps){
    resp += "<tr><td>"+p.getId()+"</td><td>"+p.getName()+"</td><td>"+p.getCategory()+"</td><td>"+p.getBearthNo()
    +"</td><td>"+p.getWl()+"</td></tr>";
    resp2 += "<option value="+p.getId()+">"+p.getId()+"\t"+p.getName()+"</option>";
}
resp += "</table>";
resp2 +="</select>";
response.getWriter().write(resp+resp2);
%>
</body>
</html>