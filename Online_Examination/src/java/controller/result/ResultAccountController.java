/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.result;

import controller.auth.BaseRequireAuthentication;
import dao.IResult;
import dao.impl.ResultDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Result;

/**
 *
 * @author ADMIN
 */
public class ResultAccountController extends BaseRequireAuthentication {

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
        String pageId = request.getParameter("pageIndex");
        String name_search = request.getParameter("name_search");
        int account_id = Integer.parseInt(request.getParameter("aid"));

        IResult result_dao = new ResultDAO();
        if (name_search == null) {
            name_search = "";
        }

        int pageIndex = 1;
        try {
            pageIndex = Integer.parseInt(pageId);
        } catch (NumberFormatException e) {
            pageIndex = 1;
        }

        int pageSize = 6;
        int totalResult;
        
        ArrayList<Result> list_result = new ArrayList<>();
        if(name_search.length() == 0){
            list_result = result_dao.getAllResulyByAccount(account_id, pageIndex, pageSize);
            totalResult = result_dao.countResultByAccount(account_id);
        }else{
            list_result = result_dao.getAllResultByAccountAndNameSearch(name_search, account_id, pageIndex, pageSize);
            totalResult = result_dao.coutResultByNameSearch(name_search, account_id);
        }
        
        
        int maxPage = totalResult / pageSize + (totalResult % pageSize > 0 ? 1 : 0);
        
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("aid", account_id);
        request.setAttribute("name_search", name_search);
        request.setAttribute("list_result", list_result);
        request.getRequestDispatcher("../view/result/account.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
