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
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>   
    <script src="/jadrn018/JS/productview.js"></script>
    <link rel="stylesheet" href=" https://code.jquery.com/ui/1.12.0/themes/cupertino/jquery-ui.css" >   
    <link rel="stylesheet" href="/jadrn018/CSS/productview.css">
   
</head>



<%
   PreparedStatement pr = null;
   ArrayList<ProductViewDTO> listProduct = new ArrayList<ProductViewDTO>();
   String id = (String) request.getAttribute("id");
   CartProductDTO cartProductDTO = (CartProductDTO) request.getAttribute("cartDTO");
   
   String quantity = "0";

   if(null!=cartProductDTO)
     quantity = cartProductDTO.getQuantity();
   
   StringBuilder sqlBuilder = new StringBuilder();
   
   sqlBuilder = new StringBuilder()
        .append("select * from product p left join on_hand oh on p.sku=oh.sku where p.sku = '" + id + "' ;");
 
   String query = sqlBuilder.toString(); 


   try{
                                  
        Vector<String[]> v = DBHelper.runQuery(query);
   
        for(int i=0; i < v.size(); i++) {
           String [] tmp = v.elementAt(i);     
           ProductViewDTO productViewDTO =  new ProductViewDTO();          
           productViewDTO.setSku(tmp[0]);
           productViewDTO.setVendor(tmp[2]);
           productViewDTO.setMi(tmp[3]);
           productViewDTO.setDescription(tmp[4]);
           productViewDTO.setFeatures(tmp[5]);
           productViewDTO.setPrice(tmp[7]);          
           productViewDTO.setImage("http://jadran.sdsu.edu/~jadrn018/proj1/Images/"+tmp[8]);          
        
           if(tmp[11]==null)
           productViewDTO.setStatus("Coming soon");
           else if(tmp[11].equalsIgnoreCase("0"))
           productViewDTO.setStatus("More on the way");
           else
           productViewDTO.setStatus("In Stock");
        
           listProduct.add(productViewDTO);

        }
             
      }catch(Exception e){}
   
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

<div id="Irecieved">
  <div style="float:left;">
       <img title="product" alt="product" src="<%= listProduct.get(0).getImage() %>" height="500" width="500">
  </div>
     <table>
                <tbody>
                  <% for(ProductViewDTO p : listProduct) {%>
                                        <tr>
                                            <td >Manufacture's Id : <%= p.getMi() %></td>
                                        </tr>
                                        <tr>    
                                            <td >Price : <%= p.getPrice() %></td>
                                        </tr>
                                        <tr>
                                            <td >Description : <%= p.getDescription() %></td>
                                        </tr>
                                        <tr> 
                                            <td >Features : <%= p.getFeatures() %></td>
                                        </tr>
                                        <tr>
                                            <td >Status : <%= p.getStatus() %></td>
                                        </tr>
                                        <tr>
                                            <td >Quantity : <input id="q<%= p.getSku() %>" type="number" name="quantity" min="???" max="???" value="<%= quantity %>"/></td>
                                        </tr>                                                                   
                                        <tr>  
                                            <%if(p.getStatus().equals("In Stock")){%>
                                            <td >  <button type="submit" id=<%= p.getMi()%> value="Click" onclick="addCart('<%= p.getSku()%>')">Add to cart</button>
                                            </td>
                                            <%}else{%>
                                             <td >  <button disabled type="submit" id=<%= p.getMi()%> value="Click" onclick="addCart('<%= p.getSku()%>')">Add to cart</button>
                                             </td>
                                            <%}%>
                                        </tr>
                                      
                            
                  <%} %>  
                </tbody>
              </table>
          <table>

</div>
<p id="error" style="color: #FF0000;"></p>


 </body>
</html>

