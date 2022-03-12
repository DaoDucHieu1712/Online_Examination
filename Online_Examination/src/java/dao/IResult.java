/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Result;

/**
 *
 * @author ADMIN
 */
public interface IResult {

    public void insert(Result result);

    public ArrayList<Result> getAllResultAndPaging(int pageIndex, int pageSize);

    public ArrayList<Result> getAllResultByNameSearchAndPaging(String name_search, int pageIndex, int pageSize);

    public ArrayList<Result> getAllResulyByAccount(int account_id, int pageIndex, int pageSize);

    public ArrayList<Result> getAllResultByAccountAndNameSearch(String name_search, int account_id, int pageIndex, int pageSize);

    public ArrayList<Result> getAllResultByCourse(int course_id, int pageIndex, int pageSize);
    
    public ArrayList<Result> getAllResultByCourseAndNameSearch(String name_search, int course_id, int pageIndex, int pageSize);
    
    public int countResult();

    public int countResultByNameSearch(String name_search);
    
    public int countResultByAccount(int account_id);
    
    public int coutResultByNameSearch(String name_search, int account_id);
    
    public int countResultByCourse(int course_id);
    
    public int countResultByCourseAndNameSearch(String name_search, int course_id);

}
