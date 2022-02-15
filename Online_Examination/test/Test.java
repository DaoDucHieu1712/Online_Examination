
import dao.IAccount;
import dao.impl.AccountDAO;
import model.Account;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ADMIN
 */
public class Test {
    public static void main(String[] args) {
        IAccount iaccount = new AccountDAO();
        Account a = iaccount.getAccount("duc123@gmail.com", "123456");
        System.out.println(a.toString());
        
    }
}
