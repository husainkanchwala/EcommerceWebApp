
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!-- Kanchwala, Husain    Account:  jadrn018
 CS645, Spring 2015
 Project 2
 -->
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />    
    <title>Inventory Merchandise</title>
    <link rel="stylesheet" href="/jadrn018/CSS/main.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script src="/jquery/jquery.js"></script>
    <script src="/jadrn018/JS/main.js"></script>
</head>
<body>

<% if(session.getAttribute("username") == null)
    response.sendRedirect("/jadrn018/jsp/login_err.jsp");
%>  

<ul class="tab">
  <li><a href="javascript:void(0)" class="tablinks">Error</a></li>
</ul>

<div id="Dummy" class="tabcontent">
</div>
          <h align="center">Update Failed.. Because stock is not available to fulfill this request current stock <%= session.getAttribute("quantity") %> </h><br>
          <a href="/jadrn018/servlet/Redirect" align="center">Back</a>
  </body>





<!-- <body>
<% if(session.getAttribute("username") == null)
	response.sendRedirect("/jadrn065/jsp/login_err.jsp");
%>
    <div>
        <h2>You have Logged In !!!</h2>
	<h3>Welcome <%= session.getAttribute("username") %></h3>
	<h3>The message is: <%= session.getAttribute("message") %>
	<h3>Your session id is <%= session.getId() %>



        <div id="status">
        </div>
	<a href="/jadrn065/servlet/Logout">Logout Now</a>
    </div>
    
</body>
 --></html>

