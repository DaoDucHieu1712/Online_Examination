/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.exam;

import controller.auth.BaseRequireAuthentication;
import dao.ICourse;
import dao.IExam;
import dao.impl.CourseDAO;
import dao.impl.ExamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.Exam;

/**
 *
 * @author ADMIN
 */
public class UpdateExamController extends BaseRequireAuthentication {

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
            out.println("<title>Servlet UpdateExamController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateExamController at " + request.getContextPath() + "</h1>");
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
            IExam exam_dao = new ExamDAO();
            
            ArrayList<Course> list_course = course_dao.list_course();
            Exam exam = exam_dao.getExam(id);
            
            request.setAttribute("exam", exam);
            request.setAttribute("list_course", list_course);
            request.getRequestDispatcher("../view/exam/update.jsp").forward(request, response);
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
        IExam exam_dao = new ExamDAO();
        Exam e = new Exam();
        e.setName_exam(request.getParameter("name_exam"));
        e.setTime(Integer.parseInt(request.getParameter("time")));
        e.setQuantity_quiz(Integer.parseInt(request.getParameter("quantity_quiz")));
        e.setDate_start(Date.valueOf(request.getParameter("date_start")));
        e.setDate_end(Date.valueOf(request.getParameter("date_end")));
        Course c = new Course();
        c.setId(Integer.parseInt(request.getParameter("cid")));
        e.setCourse(c);
        e.setId(Integer.parseInt(request.getParameter("id")));
        exam_dao.update(e);
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
