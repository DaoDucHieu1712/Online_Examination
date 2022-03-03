/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import context.DBContext;
import dao.IExam;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Exam;

/**
 *
 * @author ADMIN
 */
public class ExamDAO extends DBContext implements IExam {

    @Override
    public ArrayList<Exam> getAllListExam() {
        ArrayList<Exam> list_exam = new ArrayList<>();
        try {
            String sql = "SELECT e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid , c.name as cname\n"
                    + "FROM Exam e INNER JOIN Course c\n"
                    + "ON e.course_id = c.id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Exam e = new Exam();
                e.setId(rs.getInt("id"));
                e.setName_exam(rs.getString("name_exam"));
                e.setTime(rs.getInt("time"));
                e.setQuantity_quiz(rs.getInt("quantity_quiz"));
                e.setDate_start(rs.getDate("date_start"));
                e.setDate_end(rs.getDate("date_end"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                e.setCourse(c);
                list_exam.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_exam;
    }

    @Override
    public ArrayList<Exam> getListExamByNameSearch(String name_search) {
        ArrayList<Exam> list_exam = new ArrayList<>();
        try {
            String sql = "SELECT e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid , c.name as cname\n"
                    + "FROM Exam e INNER JOIN Course c\n"
                    + "ON e.course_id = c.id Where e.name_exam like '%' + ? + '%'";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exam e = new Exam();
                e.setId(rs.getInt("id"));
                e.setName_exam(rs.getString("name_exam"));
                e.setTime(rs.getInt("time"));
                e.setQuantity_quiz(rs.getInt("quantity_quiz"));
                e.setDate_start(rs.getDate("date_start"));
                e.setDate_end(rs.getDate("date_end"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                e.setCourse(c);
                list_exam.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_exam;
    }

    @Override
    public ArrayList<Exam> getListExamByCourseId(int course_id) {
        ArrayList<Exam> list_exam = new ArrayList<>();
        try {
            String sql = "SELECT e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid , c.name as cname\n"
                    + "FROM Exam e INNER JOIN Course c\n"
                    + "ON e.course_id = c.id Where  c.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exam e = new Exam();
                e.setId(rs.getInt("id"));
                e.setName_exam(rs.getString("name_exam"));
                e.setTime(rs.getInt("time"));
                e.setQuantity_quiz(rs.getInt("quantity_quiz"));
                e.setDate_start(rs.getDate("date_start"));
                e.setDate_end(rs.getDate("date_end"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                e.setCourse(c);
                list_exam.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_exam;
    }

    @Override
    public ArrayList<Exam> getListExamByNameSearchAndCourseId(String name_search, int course_id) {
        ArrayList<Exam> list_exam = new ArrayList<>();
        try {
            String sql = "SELECT e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid , c.name as cname\n"
                    + "FROM Exam e INNER JOIN Course c\n"
                    + "ON e.course_id = c.id Where  c.id = ? an e.name_exam like '%' + ? + '%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setString(2, name_search);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exam e = new Exam();
                e.setId(rs.getInt("id"));
                e.setName_exam(rs.getString("name_exam"));
                e.setTime(rs.getInt("time"));
                e.setQuantity_quiz(rs.getInt("quantity_quiz"));
                e.setDate_start(rs.getDate("date_start"));
                e.setDate_end(rs.getDate("date_end"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                e.setCourse(c);
                list_exam.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_exam;
    }

    @Override
    public void insert(Exam exam) {
        try {
            String sql = "INSERT INTO [Exam]\n"
                    + "           ([name_exam]\n"
                    + "           ,[time]\n"
                    + "           ,[quantity_quiz]\n"
                    + "           ,[course_id]\n"
                    + "           ,[date_start]\n"
                    + "           ,[date_end])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, exam.getName_exam());
            stm.setInt(2, exam.getTime());
            stm.setInt(3, exam.getQuantity_quiz());
            stm.setInt(4, exam.getCourse().getId());
            stm.setDate(5, exam.getDate_start());
            stm.setDate(6, exam.getDate_end());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Exam exam) {
        try {
            String sql = "UPDATE [Exam]\n"
                    + "   SET [name_exam] = ?\n"
                    + "      ,[time] = ?\n"
                    + "      ,[quantity_quiz] = ?\n"
                    + "      ,[course_id] = ?\n"
                    + "      ,[date_start] = ?\n"
                    + "      ,[date_end] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, exam.getName_exam());
            stm.setInt(2, exam.getTime());
            stm.setInt(3, exam.getQuantity_quiz());
            stm.setInt(4, exam.getCourse().getId());
            stm.setDate(5, exam.getDate_start());
            stm.setDate(6, exam.getDate_end());
            stm.setInt(7, exam.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Exam getExam(int id) {
        try {
            String sql = "SELECT e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid , c.name as cname\n"
                    + "FROM Exam e INNER JOIN Course c\n"
                    + "ON e.course_id = c.id Where e.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                Exam e = new Exam();
                e.setId(rs.getInt("id"));
                e.setName_exam(rs.getString("name_exam"));
                e.setTime(rs.getInt("time"));
                e.setQuantity_quiz(rs.getInt("quantity_quiz"));
                e.setDate_start(rs.getDate("date_start"));
                e.setDate_end(rs.getDate("date_end"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                e.setCourse(c);
                return e;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [Exam]\n"
                    + "      WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
