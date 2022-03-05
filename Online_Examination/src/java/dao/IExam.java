/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Exam;

/**
 *
 * @author ADMIN
 */
public interface IExam {
    
    public ArrayList<Exam> getAllListExam(int pageIndex, int pageSize);
    
    public ArrayList<Exam> getListExamByNameSearch(String name_search, int pageIndex, int pageSize);
    
    public ArrayList<Exam> getListExamByCourseId(int course_id, int pageIndex, int pageSize);
    
    public ArrayList<Exam> getListExamByNameSearchAndCourseId(String name_search, int course_id, int pageIndex, int pageSize);
    
    public int countAllExam();
    
    public int countExamBySearch(String name_search);
    
    public int countExamByCid(int course_id);
    
    public int countExamByCidAndSearch(int course_id, String name_search);
    
    public void insert(Exam exam);
    
    public void update(Exam exam);
    
    public Exam getExam(int id);
    
    public void delete(int id);
}
