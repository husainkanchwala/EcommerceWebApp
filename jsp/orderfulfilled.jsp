 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" import="main.*"%>

 <%@ page import ="java.sql.*" %>
 <%@ page import ="javax.sql.*" %>
 <%@ page import ="com.mysql.jdbc.Connection" %>
 <%@ page import ="com.mysql.jdbc.PreparedStatement" %>
 <%@ page import="java.util.*"%>
 <%@ page import="java.lang.*"%>
 <%@ page import="java.util.*"%>
 <%@ page import="java.util.Hashtable"%>


 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <head>
  <meta charset="utf-8">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="0" />    
  <title>Inventory Merchandise</title>
  <link rel="stylesheet" href="/jadrn018/CSS/orderfull.css">
  <script src="/jquery/jquery.js"></script>
  <script src="/jadrn018/JS/orderfull.js"></script>
</head>




<body>

  <div Style="  list-style-type: none; margin: 0 padding: 0; overflow: hidden; border: 1px solid #ccc; background-color: #deedf7;">
      <div class="header-left" style="float:left">
      <a href="http://jadran.sdsu.edu/jadrn018/servlet/GetProduct"><img style="float:left;" id="cart" src="http://jadran.sdsu.edu/~jadrn018/proj1/Images/home-512.png" style="" height="50" width="50"></a>
      </div>
  </div>

  <div class="summary order">

  <p>Order is fullfilled and is on your way sit tight</p>
 
  </div>
  <div>
        <span id="cs"><a href="http://jadran.sdsu.edu/jadrn018/servlet/GetProduct"> <button type="submit" value="Click" class="_button" >Continue Shoping</button></a></span>
  </div>
 </body>
</html>

