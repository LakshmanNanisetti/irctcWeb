<%-- 
    Document   : train
    Created on : Jun 11, 2018, 6:14:02 PM
    Author     : Administrator
--%>

<%@page import="java.sql.*,java.util.*,src.Booker"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
String from;
String to;
Integer day;
Connection conn;
Statement stmt;
ResultSet rs;
HashMap<Integer,String> trains;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trains</title>
    </head>
    <body>
        <%
        	session.setAttribute("day",request.getParameter("day"));
            from = request.getParameter("from");
            to = request.getParameter("to");
            day = Integer.parseInt(request.getParameter("day"));
            trains = Booker.getTrains(from,to,day);
        %>
        <form method="POST" action="update.jsp">
        <div id="hint">
        </div>
        <br />
        <select name="train">
            <%
               for(Map.Entry<Integer,String> me:trains.entrySet()){ 
            %>
            <option value="<%=me.getKey()%>"><%=me.getValue()%></option>
            <%
            }
            %>
        </select>
        <select name="category">
            <option value="ac">AC</option>
            <option value="sl">SL</option>       
        </select>
        <input id="seats" type="number" name="seats" min=1 max=20 value=1 required>
        <div id="pass"></div>
        <button type="button" onclick="createInputs()">ok</button>
        <button type="button" onclick="clearInputs()">clear</button><br/>
        <input id="submit1" type="submit" value="submit" disabled style="display:none">
        
        </form>
        <script>
	        function createInputs(){
	        	var seats=document.getElementById('seats').value;
	        	var temp="<table>",i=0,age,gender;
	        	
	        	temp +="<tr><th>S.No</th><th>Name</th><th>Age</th><th>Gender</th></tr>"
	        	for(i=1;i<=seats;i++){
	        		temp += "<tr>";
	        		temp += "<td>"+i+"</td>";
	        		age="<td><input id=age"+i+" type=number min=1 name=age"+i+" required></td>";
	        		gender="<td><select id=gen"+i+" name=gen"+i+" required>" +
	        		"<option value=1>male</option>" +
	        		"<option value=2>female</option></select></td>";
	        		temp += ("<td><input id=pass"+i+" name=pass"+i+" required></td>"+age+gender);
	        		temp += "</tr>";
	        	}
	        	temp+="</table>"
	        	document.getElementById('pass').innerHTML=temp;
	        	document.getElementById('submit1').disabled=false;
	        	document.getElementById('submit1').style.display="block";
	        }
	        function clearInputs(){
	        	var seats=document.getElementById('seats').value,i;
	        	for(i=1;i<=seats;i++){
	        		document.getElementById("age"+i).value="";
	        		document.getElementById("pass"+i).value="";
	        	}
	        }
	        function checkNumber(){
	        	if(Number.isNumber(this.value)){
	        		document.getElementById("hint").innerHTML = "";
	        	}
	        	else{
	       			document.getElementById("hint").innerHTML = "age must be a number";
	        	}
	        }
        </script>
    </body>
</html>
