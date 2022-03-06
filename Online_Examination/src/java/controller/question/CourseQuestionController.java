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
public class CourseQuestionController extends BaseRequireAuthentication {

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
        ICourse course_dao = new CourseDAO();
        IQuestion question_dao = new QuestionDAO();
        String pageId = request.getParameter("pageIndex");
        int course_id = Integer.parseInt(request.getParameter("cid"));
        String name_search = request.getParameter("name_search");
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
        int totalQuestion;
        ArrayList<Course> list_course = course_dao.list_course();
        ArrayList<Question> list_question = new ArrayList<>();
        if (name_search.length() == 0) {
            list_question = question_dao.getListQuestionByCourseAndPaging(course_id, pageIndex, pageSize);
            totalQuestion = question_dao.countQuestionByCourse(course_id);
        } else {
            list_question = question_dao.getListQuestionByCourseAndSearchAndPaging(name_search, course_id, pageIndex, pageSize);
            totalQuestion = question_dao.countQuestionByCourseIdAndSearch(name_search, course_id);
        }
        int maxPage = totalQuestion / pageSize + (totalQuestion % pageSize > 0 ? 1 : 0);
        
        request.setAttribute("course_id", course_id);
        request.setAttribute("list_course", list_course);
        request.setAttribute("list_question", list_question);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("name_search", name_search);
        request.getRequestDispatcher("../view/question/course.jsp").forward(request, response);
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
