/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.auth;

import dao.IAccount;
import dao.impl.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class ChangePasswordController extends BaseRequireAuthentication {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("../view/auth/changePassword.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String email = request.getParameter("email");
        String old_pw = request.getParameter("old_pw");
        String new_pw = request.getParameter("new_pw");
        String cf_pw = request.getParameter("cf_pw");
        System.out.println("Email :" +email);
        System.out.println("Email Session :" +account.getEmail());
        System.out.println("old :" +old_pw);
        System.out.println("pass Session :" +account.getPassword());
        System.out.println("new  :" +new_pw);
        System.out.println("cf :" +cf_pw);

        if (email.equals(account.getEmail())== false || old_pw.equals(account.getPassword())== false) {
            request.setAttribute("notify", "email or old password not correct !");
            request.getRequestDispatcher("../view/auth/changePassword.jsp").forward(request, response);
        } else {
            if (new_pw.equals(cf_pw) == false) {
                request.setAttribute("notify", "password and confirm password not central");
                request.getRequestDispatcher("../view/auth/changePassword.jsp").forward(request, response);
            }else{
                IAccount account_dao = new AccountDAO();
                account.setPassword(new_pw);
                account_dao.update(account);
                response.sendRedirect("infomation");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
