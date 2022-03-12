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
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
public class SchedulesController extends BaseRequireAuthentication {

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
        String name_search = request.getParameter("name_search");
        IExam exam_dao = new ExamDAO();
        ICourse course_dao = new CourseDAO();
        if(name_search == null){
            name_search= "";
        }
        ArrayList<Course> list_course = course_dao.list_course();
        ArrayList<Exam> list_exam = new ArrayList<>();
        if(name_search.length() == 0){
            list_exam = exam_dao.getListSchedules();
        }else{
            list_exam = exam_dao.getListSchedulesByNameSearch(name_search);
        }
        request.setAttribute("list_course", list_course);
        request.setAttribute("list_exam", list_exam);
        request.setAttribute("name_search", name_search);
        request.getRequestDispatcher("../view/exam/schedules.jsp").forward(request, response);
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
