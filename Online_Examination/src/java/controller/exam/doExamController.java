/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.exam;

import controller.auth.BaseRequireAuthentication;
import dao.IExam;
import dao.IResult;
import dao.impl.ExamDAO;
import dao.impl.ResultDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Exam;
import model.Question;
import model.Result;

/**
 *
 * @author ADMIN
 */
public class doExamController extends BaseRequireAuthentication {

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

        HttpSession session = request.getSession();
        ArrayList<Question> list_exam = (ArrayList<Question>) session.getAttribute("list_exam");
        int order_quiz = Integer.parseInt(request.getParameter("question_no"));
        int score = Integer.parseInt(request.getParameter("mark"));
        int answer = Integer.parseInt(request.getParameter("answer"));

        if (answer == list_exam.get(order_quiz).getSolution()) {
            score++;
        }

        if (order_quiz + 1 == list_exam.size() || request.getParameter("timeOut") == "1") {
            int exam_id = Integer.parseInt(request.getParameter("exam_id"));
            IExam exam_dao = new ExamDAO();
            Exam exam = exam_dao.getExam(exam_id);
            Account account = (Account) session.getAttribute("account");
            float final_score = ((float) score / list_exam.size()) * 10;
            String status = "";
            if (final_score >= 5) {
                status = "PASS";
            } else {
                status = "NOT PASS";
            }
            IResult result_dao = new ResultDAO();
            Result result = new Result();
            result.setAccount(account);
            result.setExam(exam);
            result.setScore(final_score);
            result.setStatus(status);
            result_dao.insert(result);
            session.removeAttribute("list_exam");
            response.sendRedirect("../auth/home");
        } else {
            String minutes = request.getParameter("minutes");
            String seconds = request.getParameter("seconds");
            request.setAttribute("minutes", minutes);
            request.setAttribute("seconds", seconds);
            request.setAttribute("mark", score);
            request.setAttribute("no_quiz", order_quiz + 1);
            request.setAttribute("question", list_exam.get(order_quiz + 1));
            if (order_quiz + 1 == list_exam.size()) {
                request.setAttribute("button", "Finish");
            } else {
                request.setAttribute("button", "Next");
            }
            request.getRequestDispatcher("../view/exam/doExam.jsp").forward(request, response);
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
