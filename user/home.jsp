<%-- 
    Document   : home
    Created on : Jun 12, 2018, 9:28:12 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Irctc</title>
    </head>
    <body>
    <%-- <%
    if(session.getAttribute("mobile")==null){%>
        <jsp:forward page="index.html" />
    <%} 
    %>--%>
    <p>
    <%=request.getUserPrincipal().getName().toString()%>
    </p>
    <%
    session.setAttribute("mobile",request.getUserPrincipal().getName().toString());
    %>
        <a href='book.jsp'><button>BOOK TICKET</button></a><br/>
        <a href='cancel.jsp'><button>CANCEL TICKET</button></a><br/>
        <a href='history.jsp'><button>BOOKED TICKET HISTORY</button></a><br/>
        <a href='chgpass.jsp'><button>CHANGE PASSWORD</button></a><br/>
    
        <%-- <a href='Form/admin/admin.html'><button>Admin</button></a><br/> --%>
        <%-- <%}%> --%>
        <a href='logout.jsp'><button>LOGOUT</button></a>
        <script>
        function fn(){
			var xh = new XMLHttpRequest();
			xh.open("GET","train.txt",false);
			xh.send();
			document.getElementById('respText').innerHTML=xh.responseText;
		}
        </script>
    </body>
</html>
