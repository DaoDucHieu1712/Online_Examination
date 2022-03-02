/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Question;

/**
 *
 * @author ADMIN
 */
public interface IQuestion {

    public ArrayList<Question> getListQuestionByPaging(int pageIndex, int pageSize);
    
    public ArrayList<Question> getListQuestionBySearchName(String name_search, int pageIndex, int pageSize);

    public ArrayList<Question> getListQuestionByCourseAndPaging(int course_id, int pageIndex, int pageSize);

    public ArrayList<Question> getListQuestionByCourseAndSearchAndPaging(String name_search, int course_id, int pageIndex, int pageSize);
    
    public int countQuestionByNameSearch(String name_search);

    public int countQuestion();

    public int countQuestionByCourse(int course_id);

    public int countQuestionByCourseIdAndSearch(String search_name, int course_id);

    public void insert(Question question);

    public Question getQuestion(int id);

    public void update(Question question);

    public void delete(int id);

    public ArrayList<Question> getQuestionRandomAndPagging(int quantity, int course_id);
}
