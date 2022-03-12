/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import context.DBContext;
import dao.IResult;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Course;
import model.Exam;
import model.Result;

/**
 *
 * @author ADMIN
 */
public class ResultDAO extends DBContext implements IResult {

    @Override
    public void insert(Result result) {
        try {
            String sql = "INSERT INTO [Result]\n"
                    + "           ([account_id]\n"
                    + "           ,[exam_id]\n"
                    + "           ,[score]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, result.getAccount().getId());
            stm.setInt(2, result.getExam().getId());
            stm.setFloat(3, result.getScore());
            stm.setString(4, result.getStatus());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<Result> getAllResultAndPaging(int pageIndex, int pageSize) {
        ArrayList<Result> list_result = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by r.score desc) as rn, \n"
                    + "r.id, \n"
                    + "a.id as account_id, a.full_name , \n"
                    + "e.name_exam ,\n"
                    + "c.name as course_name,\n"
                    + "r.score, r.status  \n"
                    + "FROM Result r inner join Account a\n"
                    + "ON r.account_id = a.id inner join Exam e\n"
                    + "ON r.exam_id = e.id inner join Course c\n"
                    + "ON e.course_id = c.id ) as x\n"
                    + "WHERE rn between (?-1)* ? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageIndex);
            stm.setInt(4, pageSize);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                Account a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setFull_name(rs.getString("full_name"));
                r.setAccount(a);
                Exam e = new Exam();
                e.setName_exam(rs.getString("name_exam"));
                Course c = new Course();
                c.setName(rs.getString("course_name"));
                e.setCourse(c);
                r.setExam(e);
                r.setScore(rs.getFloat("score"));
                r.setStatus(rs.getString("status"));
                list_result.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_result;
    }

    @Override
    public ArrayList<Result> getAllResultByNameSearchAndPaging(String name_search, int pageIndex, int pageSize) {
        ArrayList<Result> list_result = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by r.score desc) as rn, \n"
                    + "r.id, \n"
                    + "a.id as account_id, a.full_name , \n"
                    + "e.name_exam ,\n"
                    + "c.name as course_name,\n"
                    + "r.score, r.status  \n"
                    + "FROM Result r inner join Account a\n"
                    + "ON r.account_id = a.id inner join Exam e\n"
                    + "ON r.exam_id = e.id inner join Course c\n"
                    + "ON e.course_id = c.id WHERE e.name_exam like '%' + ? +'%') as x\n"
                    + "WHERE rn between (?-1)* ? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                Account a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setFull_name(rs.getString("full_name"));
                r.setAccount(a);
                Exam e = new Exam();
                e.setName_exam(rs.getString("name_exam"));
                Course c = new Course();
                c.setName(rs.getString("course_name"));
                e.setCourse(c);
                r.setExam(e);
                r.setScore(rs.getFloat("score"));
                r.setStatus(rs.getString("status"));
                list_result.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_result;
    }

    @Override
    public ArrayList<Result> getAllResulyByAccount(int account_id, int pageIndex, int pageSize) {
        ArrayList<Result> list_result = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by r.score desc) as rn, \n"
                    + "r.id, \n"
                    + "a.id as account_id, a.full_name , \n"
                    + "e.name_exam ,\n"
                    + "c.name as course_name,\n"
                    + "r.score, r.status  \n"
                    + "FROM Result r inner join Account a\n"
                    + "ON r.account_id = a.id inner join Exam e\n"
                    + "ON r.exam_id = e.id inner join Course c\n"
                    + "ON e.course_id = c.id WHERE a.id = ?) as x\n"
                    + "WHERE rn between (?-1)* ? + 1 and ?*?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, account_id);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                Account a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setFull_name(rs.getString("full_name"));
                r.setAccount(a);
                Exam e = new Exam();
                e.setName_exam(rs.getString("name_exam"));
                Course c = new Course();
                c.setName(rs.getString("course_name"));
                e.setCourse(c);
                r.setExam(e);
                r.setScore(rs.getFloat("score"));
                r.setStatus(rs.getString("status"));
                list_result.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_result;
    }

    @Override
    public ArrayList<Result> getAllResultByAccountAndNameSearch(String name_search, int account_id, int pageIndex, int pageSize) {
        ArrayList<Result> list_result = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by r.score desc) as rn, \n"
                    + "r.id, \n"
                    + "a.id as account_id, a.full_name , \n"
                    + "e.name_exam ,\n"
                    + "c.name as course_name,\n"
                    + "r.score, r.status  \n"
                    + "FROM Result r inner join Account a\n"
                    + "ON r.account_id = a.id inner join Exam e\n"
                    + "ON r.exam_id = e.id inner join Course c\n"
                    + "ON e.course_id = c.id WHERE a.id = ?) as x\n"
                    + "WHERE rn between (?-1)* ? + 1 and ?*?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, account_id);
            stm.setString(2, name_search);
            stm.setInt(3, pageIndex);
            stm.setInt(4, pageSize);
            stm.setInt(5, pageIndex);
            stm.setInt(6, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                Account a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setFull_name(rs.getString("full_name"));
                r.setAccount(a);
                Exam e = new Exam();
                e.setName_exam(rs.getString("name_exam"));
                Course c = new Course();
                c.setName(rs.getString("course_name"));
                e.setCourse(c);
                r.setExam(e);
                r.setScore(rs.getFloat("score"));
                r.setStatus(rs.getString("status"));
                list_result.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_result;
    }

    @Override
    public int countResult() {
        String sql = "SELECT count(id) FROM Result";
        int count = 0;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countResultByNameSearch(String name_search) {
        String sql = "SELECT count(r.id) FROM \n"
                + "Result r inner join Exam e\n"
                + "ON r.exam_id = e.id\n"
                + "where name_exam like '%' + ? + '%'";
        int count = 0;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countResultByAccount(int account_id) {
        String sql = "SELECT count(r.id) FROM \n"
                + "Result r inner join Account a\n"
                + "ON r.account_id = a.id\n"
                + "where a.id = ?";
        int count = 0;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, account_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int coutResultByNameSearch(String name_search, int account_id) {
        String sql = "SELECT count(r.id) FROM \n"
                + "Result r inner join Account a\n"
                + "ON r.account_id = a.id inner join Exam e\n"
                + "ON r.exam_id = e.id\n"
                + "where a.id = ? AND e.name_exam = '%' + ? + '%'";
        int count = 0;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, account_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public ArrayList<Result> getAllResultByCourse(int course_id, int pageIndex, int pageSize) {
        ArrayList<Result> list_result = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by r.score desc) as rn, \n"
                    + "r.id, \n"
                    + "a.id as account_id, a.full_name , \n"
                    + "e.name_exam ,\n"
                    + "c.name as course_name,\n"
                    + "r.score, r.status  \n"
                    + "FROM Result r inner join Account a\n"
                    + "ON r.account_id = a.id inner join Exam e\n"
                    + "ON r.exam_id = e.id inner join Course c\n"
                    + "ON e.course_id = c.id WHERE c.id = ?) as x\n"
                    + "WHERE rn between (?-1)* ? + 1 and ?*?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                Account a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setFull_name(rs.getString("full_name"));
                r.setAccount(a);
                Exam e = new Exam();
                e.setName_exam(rs.getString("name_exam"));
                Course c = new Course();
                c.setName(rs.getString("course_name"));
                e.setCourse(c);
                r.setExam(e);
                r.setScore(rs.getFloat("score"));
                r.setStatus(rs.getString("status"));
                list_result.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_result;
    }

    @Override
    public ArrayList<Result> getAllResultByCourseAndNameSearch(String name_search, int course_id, int pageIndex, int pageSize) {
        ArrayList<Result> list_result = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "SELECT ROW_NUMBER() over (order by r.score desc) as rn, \n"
                    + "r.id, \n"
                    + "a.id as account_id, a.full_name , \n"
                    + "e.name_exam ,\n"
                    + "c.name as course_name,\n"
                    + "r.score, r.status  \n"
                    + "FROM Result r inner join Account a\n"
                    + "ON r.account_id = a.id inner join Exam e\n"
                    + "ON r.exam_id = e.id inner join Course c\n"
                    + "ON e.course_id = c.id WHERE c.id = ? and e.name_exam like '%' + ? + '%') as x\n"
                    + "WHERE rn between (?-1)* ? + 1 and ?*?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                Account a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setFull_name(rs.getString("full_name"));
                r.setAccount(a);
                Exam e = new Exam();
                e.setName_exam(rs.getString("name_exam"));
                Course c = new Course();
                c.setName(rs.getString("course_name"));
                e.setCourse(c);
                r.setExam(e);
                r.setScore(rs.getFloat("score"));
                r.setStatus(rs.getString("status"));
                list_result.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_result;

    }

    @Override
    public int countResultByCourse(int course_id) {
        String sql = "SELECT count(r.id) FROM \n"
                + "Result r inner join  Exam e\n"
                + "ON r.exam_id = e.id inner join Course c\n"
                + "ON e.course_id = c.id\n"
                + "WHERE c.id = ?";
        int count = 0;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countResultByCourseAndNameSearch(String name_search, int course_id) {
        String sql = "SELECT count(r.id) FROM \n"
                + "Result r inner join  Exam e\n"
                + "ON r.exam_id = e.id inner join Course c\n"
                + "ON e.course_id = c.id\n"
                + "WHERE c.id = ? and e.name_exam like '%' + ? + '%'";
        int count = 0;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setString(2, name_search);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

}
