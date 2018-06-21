<%-- 
    Document   : register
    Created on : Jun 11, 2018, 5:48:45 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,src.Booker"%>
<%@page import="java.io.*,java.sql.DriverManager,java.sql.*,src.Train,javax.servlet.*,javax.servlet.http.*,java.util.*"%>
<%!
   private String message;
   private Connection conn;
   private Statement stmt;
   private ResultSet rs;
   private ArrayList<Train> trains; 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>getTrains</title>
    </head>
    <body>
        <%
        trains = new ArrayList<Train>();
         try{
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/irctc","root","root");
      }catch(Exception e){
          System.out.println("triansget connn: "+e);
      }

      
      try{
          response.setContentType("text/html");

      // Actual logic goes here.
    stmt = conn.createStatement();
    rs = stmt.executeQuery("select * from train");
    Train t1 ;
    while(rs.next()){
        t1 = new Train(rs.getInt("no"),
        rs.getInt("day"),
        rs.getString("name"),
        rs.getString("f"),
        rs.getString("t"),
        rs.getDouble("cost")
        );
        trains.add(t1);
    }
}catch(Exception e){
    System.out.println("triansget adding to al: "+e);
}
message="<table>";
    message+="<tr><th>No</th><th>Name</th><th>From</th><th>To</th><th>Fare</th><th>Day</th></tr>";
    for(Train t:trains){
        message += "<tr>";
        message += "<td>"+t.getNo()+"</td>";
        message += "<td>"+t.getName()+"</td>";
        message += "<td>"+t.getFrom()+"</td>";
        message += "<td>"+t.getTo()+"</td>";
        message += "<td>"+t.getFare()+"</td>";
        message += "<td>"+t.getDay()+"</td>";
        message += "</tr>";
    }
    message+="</table>";
    response.getWriter().write(message);
        %>
    </body>
</html>
