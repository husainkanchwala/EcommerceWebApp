/*  DB Qiery Example

    Alan Riggins    
    CS645
    Spring 2017
 */
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.*;
import java.io.*;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.*;
import sdsu.*;
import main.*;
import java.util.Date;


public class SubmitOrder extends HttpServlet { 
   


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
            Hashtable<String,CartProductDTO> cartTable = PutCart.user.get(id);             
            Set<String> keys = cartTable.keySet();
            DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            Date date = new Date();

            for(String key: keys){  
               CartProductDTO cartProductDTO =  cartTable.get(key);

               StringBuilder sqlBuilder = new StringBuilder()
                     .append("update on_hand set on_hand_quantity=on_hand_quantity-"+String.valueOf(cartProductDTO.getQuantity())+" where sku='"+cartProductDTO.getSku()+"'");
               String query = sqlBuilder.toString();     
              DBHelper.executeCommand(query);
            
               StringBuilder sqlBuilder1 = new StringBuilder()
                     .append("Insert into merchandise_out (sku,date,quantity) VALUES ('"+cartProductDTO.getSku()+ "','"+dateFormat.format(date)+"',"+String.valueOf(cartProductDTO.getQuantity())+")");
               String query1 = sqlBuilder1.toString();     
               DBHelper.executeCommand(query1);
           
            }     
       
      
            PutCart.user.get(id).clear();             
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/orderfulfilled.jsp"); 
            dispatcher.forward(request, response);  
            return;
         
    }
}


