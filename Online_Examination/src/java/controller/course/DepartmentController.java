/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.course;

import controller.auth.BaseRequireAuthentication;
import dao.ICourse;
import dao.IDepartment;
import dao.impl.CourseDAO;
import dao.impl.DepartmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.Department;

/**
 *
 * @author ADMIN
 */
public class DepartmentController extends BaseRequireAuthentication {

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
        String search = request.getParameter("name_search");
        int dept_id = Integer.parseInt(request.getParameter("did"));
        IDepartment department_dao = new DepartmentDAO();
        ICourse course_dao = new CourseDAO();
        ArrayList<Department> list_department = department_dao.getAllDepartment();

        if (search == null) {
            ArrayList<Course> list_course = course_dao.getListCourseByDid(dept_id);
            request.setAttribute("did", dept_id);
            request.setAttribute("list_course", list_course);
            request.setAttribute("list_department", list_department);
        } else {
            ArrayList<Course> list_course = course_dao.getListCourseByDepartmentId(dept_id, search);
            request.setAttribute("did", dept_id);
            request.setAttribute("name_search", search);
            request.setAttribute("list_course", list_course);
            request.setAttribute("list_department", list_department);
        }
        request.getRequestDispatcher("../view/course/department.jsp").forward(request, response);

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
