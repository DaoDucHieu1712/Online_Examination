/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Account;

/**
 *
 * @author ADMIN
 */
public interface IAccount {
     /**
     * Describe the Function: Authentication information user input
     * @param email 
     * @param password
     * @return account 
     */
    public Account getAccount(String email, String password);
    
    /**
     * Describe the function: user login 
     * @param a
     * --> insert User 
     */
    public void register(Account a);
    
    public ArrayList<Account> getAllAccount();
    
    public Account detail(int id);
    
    public void delete(int id);
    
    public void update(Account account);
    
}
