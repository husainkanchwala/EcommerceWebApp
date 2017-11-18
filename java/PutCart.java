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



public class PutCart extends HttpServlet { 

static Hashtable<String,Hashtable<String,CartProductDTO>> user = new Hashtable<String,Hashtable<String,CartProductDTO>>();    

    

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
       
        String sku = (String) request.getParameter("sku");
        HttpSession session = request.getSession();
        String id = session.getId();
        Hashtable<String,CartProductDTO> cart = new Hashtable<String,CartProductDTO>(); 

        if(user.get(id)!=null){
          cart=user.get(id);
        }                
          
        StringBuilder sqlBuilder = new StringBuilder();
         sqlBuilder = new StringBuilder()
        .append("select * from product where sku = '" + sku + "';");
         String query = sqlBuilder.toString();
   
         try{
                                 
            Vector<String[]> v = DBHelper.runQuery(query);
                for(int i=0; i < v.size(); i++) {
                String [] tmp = v.elementAt(i);
                CartProductDTO cartProductDTO =  new CartProductDTO();          
                cartProductDTO.setMi(tmp[3]);
                cartProductDTO.setPrice(tmp[7]);          
                cartProductDTO.setImage("http://jadran.sdsu.edu/~jadrn018/proj1/Images/"+tmp[8]);          
                cartProductDTO.setSku(sku);   
                if(cart.get(sku)!=null){       
                cartProductDTO.setQuantity(cart.get(sku).getQuantity());          
                }
                else{
                cartProductDTO.setQuantity("1");            
                }
                cart.put(sku,cartProductDTO);
        }
       
             
        }catch(Exception e){

        }

       user.put(id,cart);

       PrintWriter out = response.getWriter();  
       response.setContentType("text/html");
       out.println("success");
      

    }
}


