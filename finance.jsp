<%
String user = (String)session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
}
%>

<h2>Personal Finance Tracker</h2>

<form action="saveFinance.jsp" method="post">
    Type:
    <select name="type">
        <option value="income">Income</option>
        <option value="expense">Expense</option>
    </select><br><br>

    Amount: <input type="text" name="amount"><br><br>

    Description: <input type="text" name="desc"><br><br>

    <input type="submit" value="Save">
</form>

<br>
<a href="viewFinance.jsp">View Records</a>