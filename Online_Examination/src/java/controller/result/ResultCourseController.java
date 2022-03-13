/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.result;

import controller.auth.BaseRequireAuthentication;
import dao.ICourse;
import dao.IResult;
import dao.impl.CourseDAO;
import dao.impl.ResultDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.Result;

/**
 *
 * @author ADMIN
 */
public class ResultCourseController extends BaseRequireAuthentication {

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
        int course_id = Integer.parseInt(request.getParameter("cid"));
        IResult result_dao = new ResultDAO();
        ICourse course_dao = new CourseDAO();
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

        ArrayList<Course> list_course = course_dao.list_course();
        ArrayList<Result> list_result = new ArrayList<>();
        if (name_search.length() == 0) {
            list_result = result_dao.getAllResultByCourse(course_id, pageIndex, pageSize);
            totalResult = result_dao.countResultByCourse(course_id);
        } else {
            list_result = result_dao.getAllResultByCourseAndNameSearch(name_search, course_id, pageIndex, pageSize);
            totalResult = result_dao.countResultByCourseAndNameSearch(name_search, course_id);
        }

        int maxPage = totalResult / pageSize + (totalResult % pageSize > 0 ? 1 : 0);

        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("course_id", course_id);
        request.setAttribute("name_search", name_search);
        request.setAttribute("list_result", list_result);
        request.setAttribute("list_course", list_course);
        request.getRequestDispatcher("../view/result/course.jsp").forward(request, response);

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
