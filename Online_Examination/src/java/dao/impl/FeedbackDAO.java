/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import context.DBContext;
import dao.IFeedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;

/**
 *
 * @author ADMIN
 */
public class FeedbackDAO extends DBContext implements IFeedback {

    @Override
    public ArrayList<Feedback> getAllFeedbackAndPaging(int pageIndex, int pageSize) {
        ArrayList<Feedback> list_feedback = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (SELECT ROW_NUMBER() over (order by f.id ASC) as rn,\n"
                    + "f.id, f.full_name, f.email, f.tittle, f.massage\n"
                    + "FROM Feedbacks f ) as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageIndex);
            stm.setInt(4, pageSize);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setFull_name(rs.getString("full_name"));
                f.setEmail(rs.getString("email"));
                f.setTitle(rs.getString("tittle"));
                f.setMassage(rs.getString("massage"));
                list_feedback.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_feedback;
    }

    @Override
    public ArrayList<Feedback> getAllFeedbackByNameSearch(String name_search, int pageIndex, int pageSize) {
        ArrayList<Feedback> list_feedback = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (SELECT ROW_NUMBER() over (order by f.id ASC) as rn,\n"
                    + "f.id, f.full_name, f.email, f.tittle, f.massage\n"
                    + "FROM Feedbacks f \n"
                    + "WHERE f.tittle like '%' + ? + '%'\n"
                    + "or f.full_name like '%' + ? + '%' \n"
                    + "or f.massage like '%' + ? + '%') as x\n"
                    + "WHERE rn between (?-1)*? + 1 and ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            stm.setString(2, name_search);
            stm.setString(3, name_search);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            stm.setInt(6, pageIndex);
            stm.setInt(7, pageSize);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setFull_name(rs.getString("full_name"));
                f.setEmail(rs.getString("email"));
                f.setTitle(rs.getString("title"));
                f.setMassage(rs.getString("massage"));
                list_feedback.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_feedback;

    }

    @Override
    public int coutFeedback() {
        String sql = "SELECT COUNT(id) FROM Feedbacks";
        int count = 0;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public int countFeedbackByNameSearch(String name_search) {
        String sql = "SELECT COUNT(f.id) FROM Feedbacks f\n"
                + "WHERE f.tittle like '%' + ? + '%'\n"
                + "or f.full_name like '%' + ? + '%' \n"
                + "or f.massage like '%' + ? + '%'";
        int count = 0;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name_search);
            stm.setString(2, name_search);
            stm.setString(3, name_search);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public void insert(Feedback feedback) {
        try {
            String sql = "INSERT INTO [Feedbacks]\n"
                    + "           ([full_name]\n"
                    + "           ,[email]\n"
                    + "           ,[tittle]\n"
                    + "           ,[massage])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, feedback.getFull_name());
            stm.setString(2, feedback.getEmail());
            stm.setString(3, feedback.getTitle());
            stm.setString(4, feedback.getMassage());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Feedback detail(int id) {
        try {
            String sql = "SELECT * FROM Feedbacks WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setFull_name(rs.getString("full_name"));
                f.setEmail(rs.getString("email"));
                f.setTitle(rs.getString("tittle"));
                f.setMassage(rs.getString("massage"));
                return f;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [Feedbacks]\n"
                    + "      WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
