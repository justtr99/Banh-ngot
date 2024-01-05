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
import registration.Account;
import registration.DAO;

/**
 *
 * @author Admin
 */
@WebServlet(name="listAccountByAjax", urlPatterns={"/listAccountByAjax"})
public class listAccountByAjax extends HttpServlet  {
   
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
        String txt=request.getParameter("txt");
         DAO dao=new DAO();
            ArrayList<Account> listAcc=dao.getListAccountByName(txt);
            request.setAttribute("LISTACCOUNT", listAcc);
            int i=1;
         for(Account acc:listAcc){
             String url="deleteAccount?txtUsername="+acc.getUserName();
             String url2=null;
             if(acc.getRole()<2){
                out.println("<form action=\"controller\">\n" +
"                <tr>\n" +
"                    <td>"+i+++"\n" +
"                    <td>"+acc.getUserName()+"\n" +
"                     <input type=\"hidden\" name=\"txtUsername\" value=\""+ acc.getUserName() +"\" />\n" +
"                    </td>\n" +
"                    <td>"+acc.getPassWord()+"</td>\n" +
"                    <td>"+acc.getEmail()+"</td>\n" +
"");
                if(acc.getRole()==1){
                    url2="updateRole?txtUsername="+acc.getUserName();
                    out.println("<td>\n" +
"                                        <input type=\"checkbox\" name=\"chkAdmin\" value=\"ADMIN\" checked=\"checked\" />\n" +
"                                    </td>  ");
                }
                else{
                    url2="updateRole?txtUsername="+acc.getUserName()+"&chkAdmin=checked";
                    out.println("<td>\n" +
"                                        <input type=\"checkbox\" name=\"chkAdmin\" value=\"ADMIN\"/>\n" +
"                                    </td>");
                }
                out.println("<td>\n" +
"                                        <div style=\"display:flex\">\n" +
"                                        <a href=\""+url2+"\" class=\"\"><button style=\"color:black\">Update</button></a>\n" +
"                                        <a href=\""+url+"\" class=\"\"><button style=\"color:black\">Delete</button></a>\n" +
"                                        </div>\n" +
"                                    </td>\n" +
"                </tr>\n" +
"                \n" +
"                </form>");
             }
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
            Logger.getLogger(listAccountByAjax.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(listAccountByAjax.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(listAccountByAjax.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(listAccountByAjax.class.getName()).log(Level.SEVERE, null, ex);
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
