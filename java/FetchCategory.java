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



public class FetchCategory extends HttpServlet { 
   


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

      HttpSession session = request.getSession(true);

    
    StringBuilder sqlBuilder = new StringBuilder()
        .append("select name from category");
    String query = sqlBuilder.toString();     
    PrintWriter out = response.getWriter();  
   
    Vector<String[]> v = DBHelper.runQuery(query);
    response.setContentType("text/html");
    for(int i=0; i < v.size(); i++) {
        String [] tmp = v.elementAt(i);
        for(int j=0; j < tmp.length; j++){          
            out.println(tmp[j]);
            out.println("|");
            }
        }
         
    }
}


