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
                c.setDisplay_name("display_name");
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

}
