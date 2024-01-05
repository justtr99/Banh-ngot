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
import registration.DAOorder;
import registration.Item;
import registration.Order;

/**
 *
 * @author Admin
 */
@WebServlet(name="thanhToan", urlPatterns={"/thanhToan"})
public class thanhToan extends HttpServlet {
   
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
        PrintWriter out = response.getWriter();
        String chon=request.getParameter("chon");
        if(chon.length()>0){
        chon=chon.trim();
        String[] so = chon.split(", ");
        request.setAttribute("CHON", chon);
        request.setAttribute("LISTTHANHTOAN", so);
        DAOcart dao=new DAOcart();
        DAO dao2=new DAO();
        ArrayList<Cart> list=dao.getAllCart(); 
        ArrayList<Item> listItem=dao2.getItem();
        int a=0;
        int b=0;
        for(int i=0;i<so.length;i++){
            a=Integer.parseInt(so[i]);
         for(Cart cart:list){
             for(Item item:listItem){
                 if(cart.getCartId()==a){
                     if(cart.getItemID()==item.getID()&&cart.getQuantity()>item.getQuantity()){
                        b++;
                     }
                 }
             }
         }
        }
        if(chon.length()>0){
        request.setAttribute("LIST", list);
        if(so[0].length()>0&&b==0)    
        request.getRequestDispatcher("ThanhToan.jsp").forward(request, response);
        else request.getRequestDispatcher("gioHang").forward(request, response);
        }
    }
        else response.sendRedirect("gioHang");
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
            Logger.getLogger(thanhToan.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(thanhToan.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(thanhToan.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(thanhToan.class.getName()).log(Level.SEVERE, null, ex);
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
