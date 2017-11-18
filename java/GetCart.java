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



public class GetCart extends HttpServlet { 
   


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
           HttpSession session = request.getSession();
           String id = session.getId();
           Hashtable<String,CartProductDTO> cart = new Hashtable<String,CartProductDTO>(); 
            
           if(PutCart.user.get(id)!=null){
              cart = PutCart.user.get(id);
           }
            
            request.setAttribute("cart",cart);
        
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/cart.jsp"); 
            dispatcher.forward(request, response);  
            return;
         
    }
}


