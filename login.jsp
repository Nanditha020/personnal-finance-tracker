<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(135deg, #43e97b, #38f9d7);
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
.login { background:#43e97b; color:white; }
.suggest { background:#4facfe; color:white; }
#strength { font-size:13px; }
</style>

<script>
function generatePassword() {
    const upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const lower="abcdefghijklmnopqrstuvwxyz";
    const num="0123456789";
    const sp="@#$!";

    function r(s){return s[Math.floor(Math.random()*s.length)]}

    let pass=r(upper)+r(lower)+r(num)+r(sp);

    let all=upper+lower+num+sp;
    for(let i=4;i<10;i++) pass+=r(all);

    pass=pass.split('').sort(()=>0.5-Math.random()).join('');

    document.getElementById("password").value=pass;
    document.getElementById("strength").innerHTML="Strong Password (Suggested)";
    document.getElementById("strength").style.color="green";
}

function checkStrength(){
    let p=document.getElementById("password").value;
    let s=document.getElementById("strength");

    let strong=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$!]).{8,}$/;
    let medium=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$/;

    if(p.length==0){s.innerHTML=""; return;}

    if(strong.test(p)){
        s.innerHTML="Strong Password "; s.style.color="green";
    }else if(medium.test(p)){
        s.innerHTML="Moderate Password "; s.style.color="orange";
    }else{
        s.innerHTML="Weak Password "; s.style.color="red";
    }
}
</script>
</head>

<body>
<div class="box">
<h2>Login</h2>

<form action="checkLogin.jsp" method="post">
    <input type="email" name="email" placeholder="Email" required>
    <input type="text" id="password" name="password"
           placeholder="Password" onkeyup="checkStrength()" required>

    <div id="strength"></div>

    <button type="button" class="suggest" onclick="generatePassword()">Suggest Password</button>
    <button class="login">Login</button>
</form>

</div>
</body>
</html>