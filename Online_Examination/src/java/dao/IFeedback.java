/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Array;
import java.util.ArrayList;
import model.Feedback;

/**
 *
 * @author ADMIN
 */
public interface IFeedback {
    
    public ArrayList<Feedback> getAllFeedbackAndPaging(int pageIndex, int pageSize);
    
    public ArrayList<Feedback> getAllFeedbackByNameSearch(String name_search, int pageIndex, int pageSize);
    
    public int coutFeedback();
    
    public int countFeedbackByNameSearch(String name_search);
    
    public void insert(Feedback feedback);
    
    public Feedback detail(int id);
    
    public void delete(int id);
    
}
