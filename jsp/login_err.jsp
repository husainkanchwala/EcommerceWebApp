<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Login</title>
	<meta http-equiv="content-type" 
		content="text/html;charset=utf-8" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />        
	<meta http-equiv="Content-Style-Type" content="text/css" />
    
    <script type="text/javascript" src="/jquery/jquery.js"></script>
    <script type="text/javascript" src="/jadrn018/JS/login.js"></script>
    <link rel="stylesheet" type="text/css" href="/jadrn018/CSS/login.css" />    
</head>

<body>
    <div id="main">
        <div id="wrapper">
            <form name="lform" class="lform" action="/jadrn018/servlet/Login" method="post">
                <div class="header">
                    <h1>Login</h1>
                    <span></span>
                </div>
                <div class="content">
                    <input name="username" type="text" class="input username" placeholder="Username" />
                    <input name="password" type="password" class="input password" placeholder="Password" />
                </div>
                <div class="footer">
                    <input type="submit" name="submit" value="Login" class="buttonl" />
                    <input type="reset" value="Clear" class="buttonr">
                </div>
            </form>
            <p class="error">ERROR, wrong username or password</p>
        </div>   
    </div>      
</body>

</html>

