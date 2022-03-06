/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.question;

import controller.auth.BaseRequireAuthentication;
import dao.ICourse;
import dao.IQuestion;
import dao.impl.CourseDAO;
import dao.impl.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class UpdateQuestionController extends BaseRequireAuthentication {

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
            out.println("<title>Servlet UpdateQuestionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateQuestionController at " + request.getContextPath() + "</h1>");
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
        
        int id = Integer.parseInt(request.getParameter("id"));
        ICourse course_dao = new CourseDAO();
        IQuestion question_dao = new QuestionDAO();
        
        Question question = question_dao.getQuestion(id);
        ArrayList<Course> list_course = course_dao.list_course();
        request.setAttribute("question", question);
        request.setAttribute("list_course", list_course);
        request.getRequestDispatcher("../view/question/update.jsp").forward(request, response);
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
        IQuestion question_dao = new QuestionDAO();
        Question q = new Question();
        q.setId(Integer.parseInt(request.getParameter("id")));
        q.setQuiz(request.getParameter("quiz"));
        q.setOp1(request.getParameter("op1"));
        q.setOp2(request.getParameter("op2"));
        q.setOp3(request.getParameter("op3"));
        q.setOp4(request.getParameter("op4"));
        q.setSolution(Integer.parseInt(request.getParameter("solution")));
        Course c = new Course();
        c.setId(Integer.parseInt(request.getParameter("cid")));
        q.setCourse(c);
        question_dao.update(q);
        response.sendRedirect("list");
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
