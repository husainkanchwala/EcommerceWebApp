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



public class CheckQuantity extends HttpServlet { 
   


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
      String sku = (String) request.getParameter("sku");
      int availableAmount=0;
      
      StringBuilder sqlBuilder = new StringBuilder();
  
      sqlBuilder = new StringBuilder()
        .append("select on_hand_quantity from on_hand where sku='" + sku + "';");    
      String query = sqlBuilder.toString();     
      Vector<String[]> v = DBHelper.runQuery(query);
 
      for(int i=0; i < v.size(); i++) { 
         String [] tmp = v.elementAt(i);
         availableAmount = Integer.parseInt(tmp[0]);
      }
      
       PrintWriter out = response.getWriter();  
    
       response.setContentType("text/html");
       if(availableAmount>0)
       out.println(availableAmount);
       else
       out.println("0");
       
 }
}


