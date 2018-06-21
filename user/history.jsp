<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="src.Ticket"%>
<%@ page import="src.Booker"%>
<%@ page import="java.util.*"%>
<%!
String mobile;
ArrayList<Ticket> tickets;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booked Tickets</title>
</head>
<body>
<%
tickets = Booker.getTickets((String)session.getAttribute("mobile"));
%>

<table>
<tr>
<th>Ticket ID</th><th>Train Name</th><th>Train No</th><th>from</th><th>to</th><th>day</th><th>Total Fare</th>
</tr>
<%for(Ticket t:tickets){%>
<tr>
<td><%=t.getId()%></td><td><%=t.getTrainName()%></td><td><%=t.getTrainNo()%></td>
<td><%=t.getFrom()%></td><td><%=t.getTo()%></td><td><%=t.getDay()%></td><td><%=t.getTotalFare()%></td>
</tr>
<%
}
%>
</table>
<p>Select the Ticket ID:</p>
<select name="tick" id="tick">
<%for(Ticket t:tickets){%>
<option value='<%=t.getId()%>'><%=t.getId()%></option>
<%}%>
</select>
<button onclick="getPass()">get</button>
<div id="pass">
</div>
<script>
    function getPass(){
        var tid = document.getElementById("tick").value;
        console.log(tid);
        var xh = new XMLHttpRequest();
        xh.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
            document.getElementById("pass").innerHTML = this.responseText;
            }
        };
        xh.open("POST", "histPass.jsp", true);
        xh.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xh.send("tick="+tid);
    }
</script>
</body>
</html>