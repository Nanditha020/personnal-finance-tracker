<!DOCTYPE html>
<html>
<head>
<title>Signup</title>
<style>
body {
    font-family: Arial;
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    display:flex; justify-content:center; align-items:center; height:100vh;
}
.box {
    background:white; padding:30px; border-radius:12px;
    width:350px; box-shadow:0 8px 20px rgba(0,0,0,0.2);
}
input, button {
    width:100%; padding:10px; margin:10px 0;
    border-radius:8px; border:1px solid #ccc;
}
button {
    background:#4facfe; color:white; border:none;
}
button:hover { background:#00c6ff; }
</style>
</head>

<body>
<div class="box">
<h2>Create Account for Personal Finance Tracker</h2>

<form action="saveUser.jsp" method="post">
    <input type="text" name="name" placeholder="Full Name" required>
    <input type="email" name="email" placeholder="Email" required>
    <button>Sign Up</button>
</form>

</div>
</body>
</html>