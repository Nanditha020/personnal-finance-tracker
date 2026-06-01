<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/signupdb",
        "root",
        ""
    );

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO users(name,email) VALUES(?,?)"
    );

    ps.setString(1, name);
    ps.setString(2, email);

    int i = ps.executeUpdate();

    if(i > 0){
        response.sendRedirect("login.jsp");
    } else {
        out.println("Insert Failed");
    }

} catch(Exception e){
    e.printStackTrace();
    out.println(e);
}
%>