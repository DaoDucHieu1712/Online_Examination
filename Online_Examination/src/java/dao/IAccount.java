/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
}
