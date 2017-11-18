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
  <title>Shopping Center</title>
  <link rel="stylesheet" href="/jadrn018/CSS/finalconfirmation.css">
  <script src="/jquery/jquery.js"></script>
  <script src="/jadrn018/JS/finalconfirmation.js"></script>
</head>



<%
Hashtable<String,CartProductDTO> cartTable = (Hashtable<String,CartProductDTO>) request.getAttribute("cart"); 
Set<String> keys = cartTable.keySet();
double subordertotal=0;
String ordertotal= "";
String name = "";
String address1 = "";
String address2 = "";
String city = "";
String zip = "";
String contact = "";
String tax = "";
String grandTotal = "";
String shipping = "";

ordertotal= String.valueOf(request.getAttribute("totalAmount"));
tax= String.valueOf(request.getAttribute("tax"));
grandTotal= String.valueOf(request.getAttribute("grandtotal"));
shipping= String.valueOf(request.getAttribute("shipping"));

name =(String) request.getAttribute("name");
address1 =(String) request.getAttribute("address1");
if(address2!=null)
address2 =(String) request.getAttribute("address2");

city =(String) request.getAttribute("city");
zip =(String) request.getAttribute("zip");
contact =(String) request.getAttribute("contact");

%>




<body>

  <div Style="  list-style-type: none; margin: 0 padding: 0; overflow: hidden; border: 1px solid #ccc; background-color: #deedf7;">
      <div class="header-left" style="float:left">
      <a href="http://jadran.sdsu.edu/jadrn018/servlet/GetProduct"><img style="float:left;" id="cart" src="http://jadran.sdsu.edu/~jadrn018/proj1/Images/home-512.png" style="" height="50" width="50"></a>
      </div>
  </div>

  
  <div class="summary order">
   <div class="_left">
    <table border="1">
      <thead>
        <tr>
          <th>Manufacture's ID</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Total</th>
        </tr>
      </thead>
      <tbody>
        <% for(String key: keys){  CartProductDTO cartProductDTO =  cartTable.get(key); subordertotal=Double.parseDouble(cartProductDTO.getPrice())*Double.parseDouble(cartProductDTO.getQuantity()); %>
        <tr>
            <td ><%= cartProductDTO.getMi() %></td>
            <td ><span id="p<%= cartProductDTO.getSku() %>" ><%= cartProductDTO.getPrice() %></span></td>
            <td ><span id="q<%= cartProductDTO.getSku() %>"/><%= cartProductDTO.getQuantity() %></span></td>
            <td ><span id="ot<%= cartProductDTO.getSku() %>" class="totalprice"><%= subordertotal %></span></td>
          </tr>
          <%} %>  
      </tbody>
    </table>
   </div>
  <div class="_right">
   <br><span>Name  :  </span><span><%= name %></span><br>
   <span>Address  :  </span><span><%= address1 %> <%= address2 %></span><br>
   <span>City  :  </span><span><%= city %></span><br>
   <span>Zip  :  </span><span><%= zip %></span><br>
   <span>Contact  :  </span><span><%= contact %></span><br>
   <span>order total  :  </span><span><%= ordertotal %></span><br>
   <span>shipping  :  </span><span><%= shipping %></span><br>
   <span>tax  :  </span><span><%= tax %></span><br>
   <span>grand total  :  </span><span><%= grandTotal %></span><br>
   <div><span id="cs"><a href="http://jadran.sdsu.edu/jadrn018/servlet/SubmitOrder"> <button type="submit" value="Click" class="_button" >Submit Order</button></a></span></div>
   <div><span id="checkout"><a href="http://jadran.sdsu.edu/jadrn018/servlet/CancelOrder"> <button type="submit" value="Click" class="_button" >Cancel order</button></a></span></div>
   </div>
  </div>
 </body>
</html>

