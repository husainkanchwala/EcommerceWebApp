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
  <link rel="stylesheet" href="/jadrn018/CSS/checkout.css">
  <script src="/jquery/jquery.js"></script>
  <script src="/jadrn018/JS/checkout.js"></script>
</head>



<%
Hashtable<String,CartProductDTO> cartTable = (Hashtable<String,CartProductDTO>) request.getAttribute("cart"); 
if(cartTable!=null){
Set<String> keys = cartTable.keySet();
}
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

  
  <div class="summary order">
    <h>Billing Address</h>
      <form action="FinalConfirmation" id="bsAddress" method="post" >
        <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" id="bName" name="bName" size="15"></td>
            <td><p type="text" id="bp1"></p></td>
            <td>Address:</td>
            <td><input type="text" id="bAddress1" name="bAddress1" size="15"></td>
            <td><p type="text" id="bp2"></p></td>
            <td>Address:</td>
            <td><input type="text" id="bAddress2" name="bAddress2" size="15"></td>
            <td><p type="text" id="bp3"></p></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><input type="text" id="bCity" name="bCity" size="15"></td>
            <td><p type="text" id="bp4"></p></td>
            <td>State:</td>
            <td><input type="text" id="bState" name="bState" size="15"></td>
            <td><p type="text" id="bp5"></p></td>
            <td>Zip:</td>
            <td><input type="text" id="bZip" name="bZip" size="15"></td>
            <td><p type="text" id="bp6"></p></td>
        </tr>
        <tr>
            <td>Contact:</td>
            <td><input type="text" id="bContact" name="bContact" size="15"></td>
            <td><p type="text" id="bp7"></p></td>
        </tr>
        <tr>
            <td>Credit card Type:</td>
            <td><input type="text" id="bCCT" name="bCCT" size="15"></td>
            <td><p type="text" id="bp8"></p></td>
            <td>Credit card Number:</td>
            <td><input type="text" id="bCCN" name="bCCN" size="15"></td>
            <td><p type="text" id="bp9"></p></td>
            <td>Credit card expiration date:</td>
            <td><input type="text" id="bCCE" name="bCCE" size="15"></td>
            <td><p type="text" id="bp10"></p></td>
            <td>Security code:</td>
            <td><input type="text" id="bSC" name="bSC" size="15"></td>
            <td><p type="text" id="bp11"></p></td>
        </tr>
     
      </table>
 
      <input type="checkbox" onclick="FillBilling(this.form)" name="billingtoo">Shipping Address same as billing address<br>
 
      <h>Shipping Address</h>
        <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" id="sName" name="sName" size="15"></td>
            <td><p type="text" id="sp1"></p></td>
            <td>Address:</td>
            <td><input type="text" id="sAddress1" name="sAddress1" size="15"></td>
            <td><p type="text" id="sp2"></p></td>
            <td>Address:</td>
            <td><input type="text" id="sAddress2" name="sAddress2" size="15"></td>
            <td><p type="text" id="sp3"></p></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><input type="text" id="sCity" name="sCity" size="15"></td>
            <td><p type="text" id="sp4"></p></td>
            <td>State:</td>
            <td><input type="text" id="sState" name="sState" size="15"></td>
            <td><p type="text" id="sp5"></p></td>
            <td>Zip:</td>
            <td><input type="text" id="sZip" name="sZip" size="15"></td>
            <td><p type="text" id="sp6"></p></td>
        </tr>
        <tr>
            <td>Contact:</td>
            <td><input type="text" id="sContact" name="sContact" size="15"></td>
            <td><p type="text" id="sp6"></p></td>
        </tr>
        </table>
        <button type="submit" value="Click" class="_button" id="billingform" >Proceed</button><br>
        <div><p id = "adderror" style="color: #FF0000;"></p></div>
        <div><p id = "adderror2" style="color: #FF0000;"></p></div>
    </form>
   </div>
  <div>
     
  </div>
 </body>
</html>

