/*  DB Qiery Example

    Alan Riggins    
    CS645
    Spring 2017
 */

import java.sql.*;
import java.util.*;
import java.io.*;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.*;
import sdsu.*;
import main.*;



public class GetCartAmount extends HttpServlet { 
   


    public void doPost(HttpServletRequest request,
              HttpServletResponse response)
                        throws IOException, ServletException  {
        processRequest(request, response);         
        }

    public void doGet(HttpServletRequest request,
              HttpServletResponse response)
                        throws IOException, ServletException  { 
        processRequest(request, response);
        } 
        
    private void processRequest(HttpServletRequest request,
              HttpServletResponse response) 
                        throws IOException, ServletException {

      PrintWriter out = response.getWriter();  
      int ordertotal=0;
      HttpSession session = request.getSession();
      String id = session.getId();
      Hashtable<String,CartProductDTO> cartTable = PutCart.user.get(id); 
      Set<String> keys = cartTable.keySet();

      for(String key: keys){  
        CartProductDTO cartProductDTO =  cartTable.get(key);
         ordertotal= ordertotal+Integer.parseInt(cartProductDTO.getQuantity());
       }

       response.setContentType("text/html");
       out.println(ordertotal);

 }
}


