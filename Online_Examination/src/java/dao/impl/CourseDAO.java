/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import context.DBContext;
import dao.ICourse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Department;

/**
 *
 * @author ADMIN
 */
public class CourseDAO extends DBContext implements ICourse {

    @Override
    public ArrayList<Course> list_course() {
        ArrayList<Course> list_course = new ArrayList<>();
        String sql = "SELECT c.id,c.name, c.display_name, d.id as did, d.name as dname \n"
                + "FROM Course c inner join Department d\n"
                + "ON c.department_id = d.id";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                list_course.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_course;
    }

    @Override
    public Course getCourse(int id) {
        String sql = "SELECT c.id,c.name, c.display_name, d.id as did, d.name as dname \n"
                + "FROM Course c inner join Department d\n"
                + "ON c.department_id = d.id where c.id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                return c;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    @Override
    public void insert(Course course) {
        try {
            String sql = "INSERT INTO [Course]\n"
                    + "           ([name]\n"
                    + "           ,[display_name]\n"
                    + "           ,[department_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, course.getName());
            stm.setString(2, course.getDisplay_name());
            stm.setInt(3, course.getDepartment().getId());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void update(Course course) {
        try {
            String sql = "UPDATE [Course]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[display_name] = ?\n"
                    + "      ,[department_id] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, course.getName());
            stm.setString(2, course.getDisplay_name());
            stm.setInt(3, course.getDepartment().getId());
            stm.setInt(4, course.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [Course]\n"
                    + "      WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public ArrayList<Course> getListCourseByName(String name_search) {
        ArrayList<Course> list_course = new ArrayList<>();
        try {
            String sql = "SELECT c.id, c.name, c.display_name, d.id as did, d.id as dname \n"
                    + "FROM Course c inner join Department d\n"
                    + "ON c.department_id = d.id\n"
                    + "WHERE display_name LIKE '%' +?+'%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                list_course.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_course;
    }

    @Override
    public ArrayList<Course> getListCourseByDepartmentId(int id, String name_search) {
            ArrayList<Course> list_course = new ArrayList<>();
        try {
            String sql = "SELECT c.id, c.name, c.display_name, d.id as did, d.id as dname \n"
                    + "FROM Course c inner join Department d\n"
                    + "ON c.department_id = d.id\n"
                    + "WHERE d.id = ? and c.display_name like '%'+?+'%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, name_search);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                list_course.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_course;
    }

    @Override
    public ArrayList<Course> getListCourseByDid(int id) {
        ArrayList<Course> list_course = new ArrayList<>();
        try {
            String sql = "SELECT c.id, c.name, c.display_name, d.id as did, d.id as dname \n"
                    + "FROM Course c inner join Department d\n"
                    + "ON c.department_id = d.id\n"
                    + "WHERE d.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                list_course.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_course;
    }

}
