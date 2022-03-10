/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import context.DBContext;
import dao.IResult;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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

}
