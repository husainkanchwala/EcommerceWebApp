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



public class ProductView extends HttpServlet { 
   


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
            String sid = session.getId();
      
            String id = (String) request.getParameter("id");
            
            request.setAttribute("id",id);
            if(PutCart.user.get(sid)!=null && PutCart.user.get(sid).get(id)!=null)
            request.setAttribute("cartDTO",PutCart.user.get(sid).get(id));

            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/productview.jsp"); 
            dispatcher.forward(request, response);  
            return;
         
    }
}


