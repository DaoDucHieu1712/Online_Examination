/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import context.DBContext;
import dao.IAccount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Feature;
import model.Group;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext implements IAccount {

    @Override
    public Account getAccount(String email, String password) {
        try {
            String sql = "SELECT a.*, g.id as gid, g.group_name ,f.id as fid, f.url\n"
                    + "FROM Account a inner join Group_Account ga\n"
                    + "ON a.id = ga.account_id inner join [Group] g\n"
                    + "ON ga.group_id = g.id inner join Group_Feature gf\n"
                    + "ON g.id = gf.group_id inner join Feature f\n"
                    + "ON gf.feature_id = f.id\n"
                    + "WHERE a.email = ? AND a.password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            Account acc = null;

            while (rs.next()) {
                if (acc == null) {
                    acc = new Account();
                    acc.setId(rs.getInt("id"));
                    acc.setFull_name(rs.getString("full_name"));
                    acc.setGender(rs.getBoolean("gender"));
                    acc.setDob(rs.getDate("dob"));
                    acc.setPhone(rs.getString("phone"));
                    acc.setAddress(rs.getString("address"));
                    acc.setEmail(rs.getString("email"));
                    acc.setPassword(rs.getString("password"));
                    Group g = new Group();
                    g.setId(rs.getInt("gid"));
                    g.setGroup_name(rs.getString("group_name"));
                    acc.setGroup(g);
                }
                int fid = rs.getInt("fid");
                if (fid != 0) {
                    Feature f = new Feature();
                    f.setId(rs.getInt("fid"));
                    f.setUrl(rs.getString("url"));
                    acc.getFeatures().add(f);
                }
            }
            return acc;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
