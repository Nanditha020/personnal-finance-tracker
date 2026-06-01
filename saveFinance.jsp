<%@ page import="java.sql.*" %>

<%
String user = (String)session.getAttribute("user");

String type = request.getParameter("type");
String amount = request.getParameter("amount");
String desc = request.getParameter("desc");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/finance_db","root",""
    );

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO finance(user_email, type, amount, description) VALUES (?, ?, ?, ?)"
    );

    ps.setString(1, user);
    ps.setString(2, type);
    ps.setDouble(3, Double.parseDouble(amount));
    ps.setString(4, desc);

    ps.executeUpdate();

    out.println("Saved Successfully!");

} catch(Exception e){
    out.println(e);
}
%>

<br>
<a href="finance.jsp">Back</a>