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



public class FinalConfirmation extends HttpServlet { 
   


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
         
            String name = (String) request.getParameter("sName");
            String address1 = (String) request.getParameter("sAddress1");             
            String address2 = (String) request.getParameter("sAddress2");
            String city = (String) request.getParameter("sCity");
            String state = (String) request.getParameter("sState");
            String zip = (String) request.getParameter("sZip");
            String contact = (String) request.getParameter("sContact");
            double shipping = 5;
            double tax = 0;
            double ordertotal=0;
            double grandtotal=0;
       
            Hashtable<String,CartProductDTO> cartTable = PutCart.user.get(id); 
            Set<String> keys = cartTable.keySet();

            for(String key: keys){  
               CartProductDTO cartProductDTO =  cartTable.get(key);
               ordertotal= ordertotal + Double.parseDouble(cartProductDTO.getPrice())*Double.parseDouble(cartProductDTO.getQuantity()); 
            }     
            tax=((ordertotal+shipping)*0.08);
            grandtotal=ordertotal+shipping+tax;

            if(PutCart.user.get(id)!=null){      
            request.setAttribute("cart",PutCart.user.get(id));
            request.setAttribute("name",name);
            request.setAttribute("address1",address1);
            request.setAttribute("address2",address2);
            request.setAttribute("city",city);
            request.setAttribute("zip",zip);
            request.setAttribute("contact",contact); 
            request.setAttribute("totalAmount",ordertotal);
            request.setAttribute("tax",tax); 
            request.setAttribute("shipping",shipping); 
            request.setAttribute("grandtotal",grandtotal); 
            
            }
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/finalconfirmation.jsp"); 
            dispatcher.forward(request, response);  
            return;
         
    }
}


