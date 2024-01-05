/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import registration.Account;
import registration.Cart;
import registration.DAO;
import registration.DAOcart;
import registration.Item;

/**
 *
 * @author Admin
 */
@WebServlet(name="insertCart", urlPatterns={"/insertCart"})
public class insertCart extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");  
        HttpSession session = request.getSession();
                Account acc=(Account) session.getAttribute("ACCOUNT");
                if(acc!=null){
        String ItemID=request.getParameter("IdCart");
        String Type=request.getParameter("Type");
        String Quantity=request.getParameter("Inputnumber");     
        PrintWriter out = response.getWriter();
        try{
            if(ItemID!=null&&Quantity!=null){
                
                int itemid=Integer.parseInt(ItemID);
                int quantity=Integer.parseInt(Quantity);
                DAO dao2=new DAO();
                DAOcart dao=new DAOcart();
                ArrayList<Cart> list=dao.getAllCart();
                
                int id=1;
                if(list.size()>0)
                id=list.get(list.size()-1).getCartId()+1;
                out.print(id+" "+itemid+" "+quantity+" "+acc.getUserName());
                boolean check=dao.insertCart(id, itemid, quantity, acc.getUserName());     
                
            }
        }finally{
            String url="sanpham.jsp";
            if(Type.equals("1"))
                url="sanpham?loaibanh=banhSinhNhat";
            else if(Type.equals("2"))
                url="sanpham?loaibanh=GIFTSET";
            else if(Type.equals("3"))
                url="sanpham?loaibanh=banhLe";
            else if(Type.equals("4"))
                url="sanpham?loaibanh=doUong";
            else if(Type.equals("5")) url= "sanpham?loaibanh=NewIn";
            else url= "sanpham?loaibanh=cc";
            request.getRequestDispatcher(url).forward(request, response);
        }
    }    
                else response.sendRedirect("login.jsp");
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insertCart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insertCart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
