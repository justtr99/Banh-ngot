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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import registration.DAOorder;
import registration.Order;

/**
 *
 * @author Admin
 */
@WebServlet(name="doanhThu", urlPatterns={"/doanhThu"})
public class doanhThu extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
         
        PrintWriter out = response.getWriter();
        String pick=request.getParameter("pick");
        DAOorder dao=new DAOorder();
        ArrayList<Order> list=dao.getAllOrderDaXacNhan();
        String Ngay=request.getParameter("Ngay");
        String Thang=request.getParameter("Thang");
        String Nam=request.getParameter("Nam");
        int doanhthu=0;
        for(Order a:list){
                    doanhthu+=a.getTotal();
                }
        if(pick!=null){
        
            ArrayList<Order> list1=new ArrayList<>();
            if(Nam.length()>0){
                
                int nam=Integer.parseInt(Nam);
                list1=dao.DoanhThuNam(nam);
                doanhthu=0;
                for(Order a:list1){
                    doanhthu+=a.getTotal();
                }
                if(Thang.length()>0){                    
                    int thang=Integer.parseInt(Thang);
                    list1=dao.DoanhThuNamThang(nam, thang);
                    doanhthu=0;
                    for(Order a:list1){
                    doanhthu+=a.getTotal();
                }
                }
                if(Thang.length()>0&&Ngay.length()>0){
                    int thang=Integer.parseInt(Thang);
                    int ngay=Integer.parseInt(Ngay);
                    list1=dao.DoanhThuNamThangNgay(nam, thang, ngay); 
                    doanhthu=0;
                    for(Order a:list1){
                    doanhthu+=a.getTotal();
                }
                }
                
                
                
            } 
            request.setAttribute("DOANHTHU", doanhthu);
            request.setAttribute("LISTORDER", list1);    
            request.getRequestDispatcher("DoanhThu.jsp").forward(request, response);
        }
        else{
            request.setAttribute("LISTORDER", list);  
                        request.setAttribute("DOANHTHU", doanhthu);
        request.getRequestDispatcher("DoanhThu.jsp").forward(request, response);
        }
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(doanhThu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(doanhThu.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(doanhThu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(doanhThu.class.getName()).log(Level.SEVERE, null, ex);
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
