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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class loginController extends HttpServlet {

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
            out.println("<title>Servlet loginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginController at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        Boolean remember = Boolean.parseBoolean(request.getParameter("remember"));
        IAccount iAccount = new AccountDAO();
        Account account = iAccount.getAccount(email, password);
        HttpSession session = request.getSession();
        if (account == null) {
            request.setAttribute("notify", "Email hoặc mật khẩu không đúng !");
            request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
        } else {
            if (account.getGroup().getId() == 1) {
                session.setAttribute("account", account);
                if (remember == true) {
                    Cookie usernameCookie = new Cookie("email", email);
                    usernameCookie.setMaxAge(3600 * 24 * 24 * 365);
                    Cookie pwCookie = new Cookie("password", password);
                    pwCookie.setMaxAge(3600 * 24 * 24 * 365);
                    response.addCookie(usernameCookie);
                    response.addCookie(pwCookie);
                }
                response.sendRedirect("auth/dashboard");
            } else {
                session.setAttribute("account", account);
                if (remember == true) {
                    Cookie usernameCookie = new Cookie("email", email);
                    usernameCookie.setMaxAge(3600 * 24 * 24 * 365);
                    Cookie pwCookie = new Cookie("password", password);
                    pwCookie.setMaxAge(3600 * 24 * 24 * 365);
                    response.addCookie(usernameCookie);
                    response.addCookie(pwCookie);
                }
                response.sendRedirect("auth/home");
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
