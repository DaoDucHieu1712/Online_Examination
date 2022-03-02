/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import context.DBContext;
import dao.IQuestion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Department;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class QuestionDAO extends DBContext implements IQuestion {

    @Override
    public ArrayList<Question> getListQuestionByPaging(int pageIndex, int pageSize) {
        ArrayList<Question> list_question = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (SELECT ROW_NUMBER() over (order by q.id ASC) as rn,\n"
                    + "q.id, q.quiz, q.op1, q.op2, q.op3, q.op4, q.solution,\n"
                    + "c.id as [cid], c.name as [cname], c.display_name,\n"
                    + "d.id as [did], d.name as [dname]\n"
                    + "FROM Question q INNER JOIN Course c\n"
                    + "ON q.course_id = c.id INNER JOIN Department d\n"
                    + "ON c.department_id = d.id) as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageIndex);
            stm.setInt(4, pageSize);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuiz(rs.getString("quiz"));
                q.setOp1(rs.getString("op1"));
                q.setOp2(rs.getString("op2"));
                q.setOp3(rs.getString("op3"));
                q.setOp4(rs.getString("op4"));
                q.setSolution(rs.getInt("solution"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                q.setCourse(c);
                list_question.add(q);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_question;
    }

    @Override
    public ArrayList<Question> getListQuestionBySearchName(String name_search, int pageIndex, int pageSize) {
        ArrayList<Question> list_question = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (SELECT ROW_NUMBER() over (order by q.id ASC) as rn,\n"
                    + "q.id, q.quiz, q.op1, q.op2, q.op3, q.op4, q.solution,\n"
                    + "c.id as [cid], c.name as [cname], c.display_name,\n"
                    + "d.id as [did], d.name as [dname]\n"
                    + "FROM Question q INNER JOIN Course c\n"
                    + "ON q.course_id = c.id INNER JOIN Department d\n"
                    + "ON c.department_id = d.id\n"
                    + "where q.quiz like '%' + ? +'%') as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuiz(rs.getString("quiz"));
                q.setOp1(rs.getString("op1"));
                q.setOp2(rs.getString("op2"));
                q.setOp3(rs.getString("op3"));
                q.setOp4(rs.getString("op4"));
                q.setSolution(rs.getInt("solution"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                q.setCourse(c);
                list_question.add(q);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_question;
    }

    @Override
    public ArrayList<Question> getListQuestionByCourseAndPaging(int course_id, int pageIndex, int pageSize) {
        ArrayList<Question> list_question = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (SELECT ROW_NUMBER() over (order by q.id ASC) as rn,\n"
                    + "q.id, q.quiz, q.op1, q.op2, q.op3, q.op4, q.solution,\n"
                    + "c.id as [cid], c.name as [cname], c.display_name,\n"
                    + "d.id as [did], d.name as [dname]\n"
                    + "FROM Question q INNER JOIN Course c\n"
                    + "ON q.course_id = c.id INNER JOIN Department d\n"
                    + "ON c.department_id = d.id\n"
                    + "where c.id = ?) as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuiz(rs.getString("quiz"));
                q.setOp1(rs.getString("op1"));
                q.setOp2(rs.getString("op2"));
                q.setOp3(rs.getString("op3"));
                q.setOp4(rs.getString("op4"));
                q.setSolution(rs.getInt("solution"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                q.setCourse(c);
                list_question.add(q);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_question;
    }

    @Override
    public ArrayList<Question> getListQuestionByCourseAndSearchAndPaging(String name_search, int course_id, int pageIndex, int pageSize) {
        ArrayList<Question> list_question = new ArrayList<>();
        try {
            String sql = "";
            if (course_id == 0) {
                sql = "SELECT * FROM (SELECT ROW_NUMBER() over (order by q.id ASC) as rn,\n"
                        + "q.id, q.quiz, q.op1, q.op2, q.op3, q.op4, q.solution,\n"
                        + "c.id as [cid], c.name as [cname], c.display_name,\n"
                        + "d.id as [did], d.name as [dname]\n"
                        + "FROM Question q INNER JOIN Course c\n"
                        + "ON q.course_id = c.id INNER JOIN Department d\n"
                        + "ON c.department_id = d.id\n"
                        + "where q.quiz like '%' + ? +'%') as x\n"
                        + "WHERE rn between (?-1)*? + 1 and ?*?";
            } else {
                sql = "SELECT * FROM (SELECT ROW_NUMBER() over (order by q.id ASC) as rn,\n"
                        + "q.id, q.quiz, q.op1, q.op2, q.op3, q.op4, q.solution,\n"
                        + "c.id as [cid], c.name as [cname], c.display_name,\n"
                        + "d.id as [did], d.name as [dname]\n"
                        + "FROM Question q INNER JOIN Course c\n"
                        + "ON q.course_id = c.id INNER JOIN Department d\n"
                        + "ON c.department_id = d.id\n"
                        + "where c.id = " + course_id + " and q.quiz like '%' + ? +'%') as x\n"
                        + "WHERE rn between (?-1)*? + 1 and ?*?";
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            stm.setInt(2, pageIndex);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuiz(rs.getString("quiz"));
                q.setOp1(rs.getString("op1"));
                q.setOp2(rs.getString("op2"));
                q.setOp3(rs.getString("op3"));
                q.setOp4(rs.getString("op4"));
                q.setSolution(rs.getInt("solution"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                q.setCourse(c);
                list_question.add(q);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_question;
    }

    @Override
    public int countQuestion() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(id) FROM Question";
            PreparedStatement stm = connection.prepareCall(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countQuestionByNameSearch(String name_search) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(id) FROM Question where quiz like '%' + ? + '%'";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setString(1, name_search);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countQuestionByCourse(int course_id) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(q.id) \n"
                    + "FROM Question q inner join Course c\n"
                    + "ON q.course_id = c.id where c.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;

    }

    @Override
    public int countQuestionByCourseIdAndSearch(String search_name, int course_id) {
        int count = 0;
        try {
            
            String sql = "SELECT COUNT(q.id) \n"
                        + "FROM Question q inner join Course c\n"
                        + "ON q.course_id = c.id \n"
                        + "where c.id = ? and q.quiz like '%' + ? + '%'";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setString(2, search_name);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public void insert(Question question) {
        try {
            String sql = "INSERT INTO [Question]\n"
                    + "           ([quiz]\n"
                    + "           ,[op1]\n"
                    + "           ,[op2]\n"
                    + "           ,[op3]\n"
                    + "           ,[op4]\n"
                    + "           ,[solution]\n"
                    + "           ,[course_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, question.getQuiz());
            stm.setString(2, question.getOp1());
            stm.setString(3, question.getOp2());
            stm.setString(4, question.getOp3());
            stm.setString(5, question.getOp4());
            stm.setInt(6, question.getSolution());
            stm.setInt(7, question.getCourse().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public Question getQuestion(int id) {
        try {
            String sql = "SELECT q.id, q.quiz, q.op1, q.op2, q.op3, q.op4, q.solution,\n"
                    + "c.id as cid, c.name as cname, c.display_name,\n"
                    + "d.id as did, d.name as dname\n"
                    + "FROM Question q INNER JOIN Course c\n"
                    + "ON q.course_id = c.id  INNER JOIN Department d\n"
                    + "ON c.department_id= d.id\n"
                    + "WHERE q.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuiz(rs.getString("quiz"));
                q.setOp1(rs.getString("op1"));
                q.setOp2(rs.getString("op2"));
                q.setOp3(rs.getString("op3"));
                q.setOp4(rs.getString("op4"));
                q.setSolution(rs.getInt("solution"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                c.setDisplay_name(rs.getString("display_name"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                c.setDepartment(d);
                q.setCourse(c);
                return q;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void update(Question question) {
        try {
            String sql = "UPDATE [Question]\n"
                    + "   SET [quiz] = ?\n"
                    + "      ,[op1] = ?\n"
                    + "      ,[op2] = ?\n"
                    + "      ,[op3] = ?\n"
                    + "      ,[op4] = ?\n"
                    + "      ,[solution] = ?\n"
                    + "      ,[course_id] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, question.getQuiz());
            stm.setString(2, question.getOp1());
            stm.setString(3, question.getOp2());
            stm.setString(4, question.getOp3());
            stm.setString(5, question.getOp4());
            stm.setInt(6, question.getSolution());
            stm.setInt(7, question.getCourse().getId());
            stm.setInt(8, question.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [Question]\n"
                    + "      WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<Question> getQuestionRandomAndPagging(int quantity, int course_id) {
        ArrayList<Question> list_question = new ArrayList<>();
        try {
            String sql = "SELECT TOP(?) q.id,q.quiz,q.op1,q.op2,q.op3,q.op4,q.solution,\n"
                    + "c.id as cid ,c.name as cname ,c.display_name\n"
                    + "FROM Question q inner join Course c\n"
                    + "on q.course_id = c.id  where c.id = ?\n"
                    + "order by NEWID()";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, course_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuiz(rs.getString("quiz"));
                q.setOp1(rs.getString("op1"));
                q.setOp2(rs.getString("op2"));
                q.setOp3(rs.getString("op3"));
                q.setOp4(rs.getString("op4"));
                q.setSolution(rs.getInt("solution"));
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                c.setDisplay_name(rs.getString("display_name"));
                q.setCourse(c);
                list_question.add(q);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_question;
    }

}
