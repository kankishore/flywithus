<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <form>
         <center>
    <h1>MyFlights</h1></center>
  <center>
    <h3>Fly With Us!!</h3></center>
  <form>
    Source:
    <select name="source">
      <option>Select Source</option>
      <option <% System.out.println("selected='selected'");%> >Bangalore</option>
      <option >Delhi</option>
      <option>Hyderabad</option>
      <option>Goa</option>
      <option>Mangalore</option>
    </select>

    &nbsp &nbsp &nbsp Destination:
    <select name="destination">
      <option>Select Destination</option>
      <option>Bangalore</option>
      <option>Delhi</option>
      <option>Hyderabad</option>
      <option>Goa</option>
      <option>Mangalore</option>
    </select>

    <br>
    <br>
    <input type="submit" value="Search">
  </form>
            <br>
             <table border="2">
<%
String value=request.getParameter("source");
String value1=request.getParameter("destination");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flywithus","root", "123");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from flight_details where source='"+value+"' and destination='"+value1+"'");   
if(rs.next()){
%>
<tr>
    <th>Flight Number</th>
    <th>Airline</th>
    <th>Source</th>
    <th>Destination</th>
    <th>Duration</th>
    <th>Cost</th>
    <th>Start Time</th>
</tr>
<tr>
<td><input type="text" value="<%=rs.getInt("fno")%>"/></td>
<td><input type="text" value="<%=rs.getString("airline")%>"/></td>
<td><input type="text" value="<%=rs.getString("source")%>"/></td>
<td><input type="text" value="<%=rs.getString("destination")%>"/></td>
<td><input type="text" value="<%=rs.getString("duration")%>"/></td>
<td><input type="text" value="<%=rs.getFloat("cost")%>"/></td>
<td><input type="text" value="<%=rs.getTime("starttime")%>"/></td>
</tr>
<%
}
%>       
       </table>
        </form>
    </body>
</html>
