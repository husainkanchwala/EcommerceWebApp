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
    <script src="/jquery/jquery.js"></script>
    <script src="/jadrn018/JS/cart.js"></script>
    <link rel="stylesheet" href="/jadrn018/CSS/cart.css">
</head>


<%
Hashtable<String,CartProductDTO> cartTable = (Hashtable<String,CartProductDTO>) request.getAttribute("cart"); 
Set<String> keys = cartTable.keySet();
double ordertotal=0;
%>




<body>

<div Style="  list-style-type: none; margin: 0 padding: 0; overflow: hidden; border: 1px solid #ccc; background-color: #deedf7;">
      <div class="header-left" style="float:left">
      <a href="http://jadran.sdsu.edu/jadrn018/servlet/GetProduct"><img style="float:left;" id="cart" src="http://jadran.sdsu.edu/~jadrn018/proj1/Images/home-512.png" style="" height="50" width="50"></a>
      </div>
      <div class="header-right" style="float:right">
      <div style="float: left"><a style="float: left;" href="http://jadran.sdsu.edu/jadrn018/servlet/GetCart"><img id="cart" src="http://jadran.sdsu.edu/~jadrn018/proj1/Images/carts.png" style="" height="50" width="50"></a>
      <div class="cart-items" style="margin-top: 15px; float: right;"><span>Items:</span><span style="float:right;" id="camount">0</span></div></div>
      </div>
</div>

<%if(cartTable.size()>0){%>  
<div class="_left">
     <table border="1">
      <thead>
        <tr>
          <th>Product</th>
          <th>Manufacture's ID</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Total</th>
          <th>Remove</th>
        </tr>
      </thead>
      <tbody>
        <% for(String key: keys){  CartProductDTO cartProductDTO =  cartTable.get(key); ordertotal=Double.parseDouble(cartProductDTO.getPrice())*Double.parseDouble(cartProductDTO.getQuantity()); %>
        <tr>
            <td ><img title="product" alt="product"
            src="<%= cartProductDTO.getImage() %>" height="100" width="100"></td>
            <td ><%= cartProductDTO.getMi() %></td>
            <td ><span id="p<%= cartProductDTO.getSku() %>" ><%= cartProductDTO.getPrice() %></span></td>
            <td ><input id="q<%= cartProductDTO.getSku() %>" type="number" name="quantity" min="???" max="???" value="<%= cartProductDTO.getQuantity() %>"/></td>
            <td ><span id="ot<%= cartProductDTO.getSku() %>" class="totalprice"><%= ordertotal %></span></td>
            <td ><a href="http://jadran.sdsu.edu/jadrn018/servlet/RemoveCart?sku=<%= cartProductDTO.getSku() %>">Remove</a></td>
          </tr>
          <%} %>  
      </tbody>
      </table>
    <p id="error" style="color: #FF0000;"></p>
  </div>
  <div class="_right">
        <div><span>Grand Total :</span><span id="gt"></span></div>
        <div><span id="cs"><a href="http://jadran.sdsu.edu/jadrn018/servlet/GetProduct"> <button type="submit" value="Click" class="_button" >Continue Shoping</button></a></span></div>
        <div><span id="checkout"><a href="http://jadran.sdsu.edu/jadrn018/servlet/Checkout"> <button type="submit" value="Click" class="_button" >Check out now</button></a></span></div>
 
  </div>
 <%}else{%>
   <div style="text-align: center">
       <p >Please select atleast one item to checkout</p>
  </div>
 
 <%}%>
 </body>
</html>

