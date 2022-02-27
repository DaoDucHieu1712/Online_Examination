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
import java.util.ArrayList;
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

    @Override
    public void register(Account a) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [Account]\n"
                    + "           ([full_name]\n"
                    + "           ,[gender]\n"
                    + "           ,[dob]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[email]\n"
                    + "           ,[password])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, a.getFull_name());
            stm.setBoolean(2, a.isGender());
            stm.setDate(3, a.getDob());
            stm.setString(4, a.getPhone());
            stm.setString(5, a.getAddress());
            stm.setString(6, a.getEmail());
            stm.setString(7, a.getPassword());
            stm.executeUpdate();
            // Query account to get identity number for account_id
            String sql_getId = "Select @@IDENTITY AS account_id";// lay id cua cau lenh sql vua insert
            PreparedStatement stm_getId = connection.prepareStatement(sql_getId);
            ResultSet rs = stm_getId.executeQuery();
            if (rs.next()) {
                a.setId(rs.getInt("account_id"));
            }
            // insert Group_Account
            String sql_insert_GroupAccount = "INSERT INTO [Group_Account]\n"
                    + "           ([account_id]\n"
                    + "           ,[group_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,2)";
            PreparedStatement stm_insert_GroupAccount = connection.prepareStatement(sql_insert_GroupAccount);
            stm_insert_GroupAccount.setInt(1, a.getId());
            stm_insert_GroupAccount.executeUpdate();

            connection.commit();

        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> list_account = new ArrayList<>();
        try {
            String sql = "SELECT id, full_name, gender, dob, "
                    + "phone, address FROM Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setFull_name(rs.getString("full_name"));
                a.setGender(rs.getBoolean("gender"));
                a.setDob(rs.getDate("dob"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                list_account.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_account;
    }

    @Override
    public Account detail(int id) {
        try {
            String sql = "SELECT id, full_name, gender, dob, phone, address \n"
                    + "FROM Account where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setFull_name(rs.getString("full_name"));
                a.setGender(rs.getBoolean("gender"));
                a.setDob(rs.getDate("dob"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [Account]\n"
                    + "      WHERE id = ?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Account account) {
        try {
            String sql = "UPDATE [Account]\n"
                    + "   SET [full_name] = ?\n"
                    + "      ,[gender] = ?\n"
                    + "      ,[dob] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[password] = ?\n"
                    + " WHERE id = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getFull_name());
            stm.setBoolean(2, account.isGender());
            stm.setDate(3, account.getDob());
            stm.setString(4, account.getPhone());
            stm.setString(5, account.getAddress());
            stm.setString(6, account.getEmail());
            stm.setString(7, account.getPhone());
            stm.setInt(8, account.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
