<%@ page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

String strong="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$!]).{8,}$";
String medium="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{6,}$";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/signupdb","root","");

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM users WHERE email=?");
ps.setString(1,email);

ResultSet rs=ps.executeQuery();

if(rs.next()){

    if(!password.matches(medium)){
%>
<h2 style="text-align:center;"> Weak Password</h2>
<form action="login.jsp" style="text-align:center;">
<button>Go Back</button>
</form>
<%
    }
    else if(!password.matches(strong)){
%>
<h2 style="text-align:center;" Moderate Password</h2>

<form action="login.jsp" style="display:inline;">
<button>Go Back</button>
</form>

<form action="saveModerate.jsp" method="post" style="display:inline;">
<input type="hidden" name="email" value="<%=email%>">
<input type="hidden" name="password" value="<%=password%>">
<button>Continue</button>
</form>
<%
    }
    else{

        String dbPass=rs.getString("password");

        if(dbPass==null){
            PreparedStatement up=con.prepareStatement(
            "UPDATE users SET password=? WHERE email=?");
            up.setString(1,password);
            up.setString(2,email);
            up.executeUpdate();
        }

        // ADD THIS LINE (VERY IMPORTANT)
        session.setAttribute("user", email);

        response.sendRedirect("success.jsp");
    }

}else{
    out.println("User not found");
}
%>