<!DOCTYPE html>
<html>
<head>
<title>Success</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #43e97b, #38f9d7);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Card */
.card {
    background: white;
    padding: 40px;
    border-radius: 15px;
    width: 350px;
    text-align: center;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    animation: fadeIn 0.8s ease;
}

.card h1 {
    color: #2ed573;
    margin-bottom: 10px;
}

.card p {
    color: #555;
    margin-bottom: 20px;
}

/* Button */
.btn {
    padding: 10px 20px;
    background: #4facfe;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

.btn:hover {
    background: #00c6ff;
}

/* Animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>

</head>

<body>

<div class="card">
    <h1>Login Successful</h1>
    <p>You have successfully logged into your account.</p>
    <h2>Welcome to Personal Finance Tracker</h2>
    <a href="finance.jsp">Go Finance Tracker</a>
    <form action="login.jsp">
        <button class="btn">Logout</button>
    </form>
</div>

</body>
</html>