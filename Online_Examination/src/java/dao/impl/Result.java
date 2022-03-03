/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import model.Account;
import model.Exam;

/**
 *
 * @author ADMIN
 */
public class Result {
    private Account account_id;
    private Exam exam_id;
    private float score;
    private String status;

    public Result() {
    }

    public Result(Account account_id, Exam exam_id, float score, String status) {
        this.account_id = account_id;
        this.exam_id = exam_id;
        this.score = score;
        this.status = status;
    }

    public Account getAccount_id() {
        return account_id;
    }

    public void setAccount_id(Account account_id) {
        this.account_id = account_id;
    }

    public Exam getExam_id() {
        return exam_id;
    }

    public void setExam_id(Exam exam_id) {
        this.exam_id = exam_id;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
