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



public class GetProduct extends HttpServlet { 
   


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

         
            String id = (String) request.getParameter("id");
            String category = (String) request.getParameter("category");
            String vendor = (String) request.getParameter("vendor");
            String range = (String) request.getParameter("range");    
   
            request.setAttribute("category",category);
            request.setAttribute("vendor",vendor);
            request.setAttribute("range",range);
            request.setAttribute("id",id);
            
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/product.jsp"); 
            dispatcher.forward(request, response);  
            return;
         
    }
}


