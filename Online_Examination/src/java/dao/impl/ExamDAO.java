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
    public ArrayList<Exam> getAllListExam(int pageIndex, int pageSize) {
        ArrayList<Exam> list_exam = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by e.id ASC) as rn, \n"
                    + "e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid ,c.name as cname,c.display_name\n"
                    + "FROM Exam e inner join Course c\n"
                    + "ON e.course_id = c.id) as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageIndex);
            stm.setInt(4, pageSize);
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
    public ArrayList<Exam> getListExamByNameSearch(String name_search, int pageIndex, int pageSize) {
        ArrayList<Exam> list_exam = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by e.id ASC) as rn, \n"
                    + "e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid ,c.name as cname,c.display_name\n"
                    + "FROM Exam e inner join Course c\n"
                    + "ON e.course_id = c.id WHere e.name_exam  like '%'+?+'%') as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
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
    public ArrayList<Exam> getListExamByCourseId(int course_id, int pageIndex, int pageSize) {
        ArrayList<Exam> list_exam = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by e.id ASC) as rn, \n"
                    + "e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid ,c.name as cname,c.display_name\n"
                    + "FROM Exam e inner join Course c\n"
                    + "ON e.course_id = c.id WHere c.id = ?) as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
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
                c.setDisplay_name(rs.getString("display_name"));
                e.setCourse(c);
                list_exam.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_exam;
    }

    @Override
    public ArrayList<Exam> getListExamByNameSearchAndCourseId(String name_search, int course_id, int pageIndex, int pageSize) {
        ArrayList<Exam> list_exam = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by e.id ASC) as rn, \n"
                    + "e.id, e.name_exam, e.time, e.quantity_quiz, e.date_start, e.date_end,\n"
                    + "c.id as cid ,c.name as cname,c.display_name\n"
                    + "FROM Exam e inner join Course c\n"
                    + "ON e.course_id = c.id WHERE c.id = ? AND e.name_exam like '%' + ? + '%') as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setString(2, name_search);
            stm.setInt(3, pageIndex);
            stm.setInt(4, pageSize);
            stm.setInt(5, pageIndex);
            stm.setInt(6, pageSize);
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
                c.setDisplay_name(rs.getString("display_name"));
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

    @Override
    public int countAllExam() {
        int count = 0;
        try {
            String sql = "Select COUNT(id) FROM Exam ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countExamBySearch(String name_search) {
        int count = 0;
        try {
            String sql = "Select COUNT(id) \n"
                    + "FROM Exam \n"
                    + "WHERE name_exam like '%' + ? + '%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countExamByCid(int course_id) {
        int count = 0;
        try {
            String sql = "Select COUNT(e.id) \n"
                    + "FROM Exam e inner join Course c\n"
                    + "ON e.course_id = c.id\n"
                    + "WHERE c.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countExamByCidAndSearch(int course_id, String name_search) {
        int count = 0;
        try {
            String sql = "Select COUNT(e.id) \n"
                    + "FROM Exam e inner join Course c\n"
                    + "ON e.course_id = c.id\n"
                    + "WHERE c.id = ? and name_exam like '%' + ? + '%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setString(2, name_search);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

}
