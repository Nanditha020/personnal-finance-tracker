<%@ page import="java.sql.*" %>

<%
String user = (String)session.getAttribute("user");

double totalIncome = 0;
double totalExpense = 0;
double balance = 0;

Connection con = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/finance_db","root",""
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT type, SUM(amount) as total FROM finance WHERE user_email=? GROUP BY type"
    );

    ps.setString(1, user);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
        if(rs.getString("type").equals("income")){
            totalIncome = rs.getDouble("total");
        } else {
            totalExpense = rs.getDouble("total");
        }
    }

    balance = totalIncome - totalExpense;

%>

<h2>Finance Summary</h2>

<div style="border:2px solid black; padding:15px; width:300px;">
    <p style="color:green;">Income: ₹ <%= totalIncome %></p>
    <p style="color:red;">Expense: ₹ <%= totalExpense %></p>
    <p style="color:blue;">Balance: ₹ <%= balance %></p>
</div>

<br>

<h3>All Records</h3>

<table border="1">
<tr>
<th>Type</th>
<th>Amount</th>
<th>Description</th>
</tr>

<%
PreparedStatement ps2 = con.prepareStatement(
    "SELECT * FROM finance WHERE user_email=?"
);

ps2.setString(1, user);
ResultSet rs2 = ps2.executeQuery();

while(rs2.next()){
%>
<tr>
<td><%= rs2.getString("type") %></td>
<td><%= rs2.getDouble("amount") %></td>
<td><%= rs2.getString("description") %></td>
</tr>
<%
}
%>

</table>

<br>

<!-- GRAPH -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<canvas id="myChart"></canvas>

<script>
new Chart(document.getElementById('myChart'), {
    type: 'bar',
    data: {
        labels: ["Income", "Expense"],
        datasets: [{
            label: "Finance",
            data: [<%= totalIncome %>, <%= totalExpense %>]
        }]
    }
});
</script>

<%
} catch(Exception e){
    out.println(e);
}
%>