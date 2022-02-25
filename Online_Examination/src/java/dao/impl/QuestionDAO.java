/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import context.DBContext;
import dao.IQuestion;
import java.util.ArrayList;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class QuestionDAO extends DBContext implements IQuestion {

    @Override
    public ArrayList<Question> getListQuestionByPaging(int pageIndex, int PageSize) {
        return null;
    }

    @Override
    public ArrayList<Question> getListQuestionByCourseAndPaging(int course_id, int pageIndex, int pageSize) {
        return null;
    }

    @Override
    public ArrayList<Question> getListQuestionByCourseAndSearchAndPaging(String name_search, int course_id, int pageIndex, int pageSize) {
        return null;
    }

    @Override
    public int countQuestion() {
        return 0;
    }

    @Override
    public int countQuestionByCourse(int course_id) {
        return 0;
    }

    @Override
    public int countQuestionByCourseIdAndSearch(String search_name, int course_id) {
        return 0;
    }

    @Override
    public void insert(Question question) {
    }

    @Override
    public Question getQuestion(int id) {
        return null;
    }

    @Override
    public void update(Question question) {
    }

    @Override
    public void delete(int id) {
    }

    @Override
    public ArrayList<Question> getQuestionRandomAndPagging(int quantity) {
        return null;
    }

}
