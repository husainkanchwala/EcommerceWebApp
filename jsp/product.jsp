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
<%@ page import="sdsu.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />    
    <title>Shopping Center</title>
    <script src="/jquery/jquery.js"></script>
    <script src="/jadrn018/JS/product.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>   
    <link rel="stylesheet" href=" https://code.jquery.com/ui/1.12.0/themes/cupertino/jquery-ui.css" >   
    <link rel="stylesheet" href="/jadrn018/CSS/product.css">
</head>


<%
   PreparedStatement pr = null;
   ArrayList<ProductDTO> listProduct = new ArrayList<ProductDTO>();

   String id = (String) request.getAttribute("id");    
   String category = (String) request.getAttribute("category"); 
   String vendor = (String) request.getAttribute("vendor");
   String range = (String) request.getAttribute("range");
  
   StringBuilder sqlBuilder = new StringBuilder();
  
  if(category!=null && category.equals("true")){
          sqlBuilder = new StringBuilder()
        .append("select p.sku,p.vendorModel,p.retail,p.image,oh.on_hand_quantity from product p left join on_hand oh on p.sku=oh.sku where p.catID='" + id + "';");    
  }else if(vendor!=null && vendor.equals("true")){
          sqlBuilder = new StringBuilder()
        .append("select p.sku,p.vendorModel,p.retail,p.image,oh.on_hand_quantity from product p left join on_hand oh on p.sku=oh.sku where p.venID='" + id + "'");    
  }else if(range!=null && range.equals("range1")){
       sqlBuilder = new StringBuilder()
        .append("select p.sku,p.vendorModel,p.retail,p.image,oh.on_hand_quantity from product p left join on_hand oh on p.sku=oh.sku where p.retail<=100 and p.retail>0");
  }else if(range!=null && range.equals("range2")){
       sqlBuilder = new StringBuilder()
        .append("select p.sku,p.vendorModel,p.retail,p.image,oh.on_hand_quantity from product p left join on_hand oh on p.sku=oh.sku where p.retail<=200 and p.retail>100");        
  }else if(range!=null && range.equals("range3")){
       sqlBuilder = new StringBuilder()
        .append("select p.sku,p.vendorModel,p.retail,p.image,oh.on_hand_quantity from product p left join on_hand oh on p.sku=oh.sku where retail>200");        
  }else{
       sqlBuilder = new StringBuilder()
        .append("select p.sku,p.vendorModel,p.retail,p.image,oh.on_hand_quantity from product p left join on_hand oh on p.sku=oh.sku");   
  }

  String query = sqlBuilder.toString();
   
   try{
                    
        Vector<String[]> v = DBHelper.runQuery(query);
        for(int i=0; i < v.size(); i++) {
           String [] tmp = v.elementAt(i);
           ProductDTO productDTO =  new ProductDTO();          
           productDTO.setSku(tmp[0]);
           productDTO.setMi(tmp[1]);
           productDTO.setPrice(tmp[2]);          
           productDTO.setImage("http://jadran.sdsu.edu/~jadrn018/proj1/Images/"+tmp[3]);          
           if(tmp[4]==null)
           productDTO.setStatus("Coming soon");
           else if(tmp[4].equalsIgnoreCase("0"))
           productDTO.setStatus("More on the way");
           else
           productDTO.setStatus("In stock");
           
           listProduct.add(productDTO);

        }          
    }catch(Exception e){}
  
%>
   
<body>
<div class="tab">
      <div class="header-left" style="float:left">
      <a href="http://jadran.sdsu.edu/jadrn018/servlet/GetProduct"><img style="float:left;" id="cart" src="http://jadran.sdsu.edu/~jadrn018/proj1/Images/home-512.png" style="" height="50" width="50"></a>
      </div>
      <div class="header-right" style="float:right">
      <div style="float: left"><a style="float: left;" href="http://jadran.sdsu.edu/jadrn018/servlet/GetCart"><img id="cart" src="http://jadran.sdsu.edu/~jadrn018/proj1/Images/carts.png" style="" height="50" width="50"></a>
      <div class="cart-items" style="margin-top: 15px; float: right;"><span>Items:</span><span style="float:right;" id="camount">0</span></div></div>
      </div>
</div>
<div id="Home">

<div class="_left">
 <ul id="menu">
 <li class="ui-widget-header" id="Cli-0"><div>Category</div></li>
 <li class="ui-widget-header" id="Vli-0"><div>Vendor</div></li>
 <li class="ui-widget-header" id="Pli-0"><div>Price</div></li>
 <a href="GetProduct?range=range1" ><li><div>0-100</div></li></a>
 <a href="GetProduct?range=range2" ><li><div>100-500</div></li></a>
 <a href="GetProduct?range=range3" ><li><div>500 plus</div></li></a>
 </ul>
</div>

<div class="_right">
  <% int loopCount = 0; for(ProductDTO p : listProduct) {
     if(loopCount % 3 == 0){ %>
     <div class="widget">
     <% } %>
     <div class="controlgroup">
     <table>
                <tbody>

                                        <tr>
                                            <td ><a href="ProductView?id=<%= p.getSku()%>"><img title="product" alt="product"
                                                  src="<%= p.getImage() %>" height="300" width="300"></a></td>
                                        </tr>
                                        <tr>
                                            <td >Manufacture's Id : <%= p.getMi() %></td>
                                        </tr>
                                        <tr>
                                            <td >Price : <%= p.getPrice() %></td>
                                        </tr>
                                        <tr>
                                           <td >Status : <%= p.getStatus() %></td>
                                        </tr>
                                        <tr>  
                                            <%if(p.getStatus().equals("In stock")){%>
                                            <td >  <button type="submit" id=<%= p.getMi()%> value="Click" class="_button" onclick="addCart('<%= p.getSku()%>')">Add to cart</button>
                                            </td>
                                            <%}else{%>
                                             <td >  <button disabled type="submit" id=<%= p.getMi()%> value="Click" class="_button" onclick="addCart('<%= p.getSku()%>')">Add to cart</button>
                                             </td>
                                            <%}%>
                                        </tr>
                </tbody>
      </table>      
      </div>
      <% loopCount++; if(loopCount % 3 == 0){ %>
    </div>
    <% } %>
    <%} %>            

  </div>
 </div>
 </body>
</html>

