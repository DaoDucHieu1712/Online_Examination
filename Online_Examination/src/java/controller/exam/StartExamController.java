/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.exam;

import controller.auth.BaseRequireAuthentication;
import dao.IQuestion;
import dao.impl.QuestionDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class StartExamController extends BaseRequireAuthentication {

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
        int cid = Integer.parseInt(request.getParameter("course"));
        int time = Integer.parseInt(request.getParameter("time"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int exam_id = Integer.parseInt(request.getParameter("exam"));
        IQuestion question_dao = new QuestionDAO();
        ArrayList<Question> list_exam = question_dao.getQuestionRandomAndPagging(quantity, cid);
        HttpSession session = request.getSession();
        session.setAttribute("list_exam", list_exam);
        session.setAttribute("exam_id", exam_id);
        request.setAttribute("no_quiz", 0);
        request.setAttribute("mark", 0);
        request.setAttribute("minutes", time-1);
        request.setAttribute("seconds", 59);
        request.setAttribute("question", list_exam.get(0));
        if (list_exam.size() == 1) {
            request.setAttribute("button", "Finish");
        } else {
            request.setAttribute("button", "Next");
        }
        request.getRequestDispatcher("../view/exam/doExam.jsp").forward(request, response);
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
