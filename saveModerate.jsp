<%@ page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/signupdb","root","");

PreparedStatement ps=con.prepareStatement(
"UPDATE users SET password=? WHERE email=?");

ps.setString(1,password);
ps.setString(2,email);
ps.executeUpdate();

// ADD THIS (VERY IMPORTANT)
session.setAttribute("user", email);

// redirect after saving
response.sendRedirect("success.jsp");
%>