/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Exam {
    private int id;
    private String name_exam;
    private int time;
    private int quantity_quiz;
    private Course course;
    private Date date_start;
    private Date date_end;

    public Exam() {
    }

    public Exam(int id, String name_exam, int time, int quantity_quiz, Course course, Date date_start, Date date_end) {
        this.id = id;
        this.name_exam = name_exam;
        this.time = time;
        this.quantity_quiz = quantity_quiz;
        this.course = course;
        this.date_start = date_start;
        this.date_end = date_end;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName_exam() {
        return name_exam;
    }

    public void setName_exam(String name_exam) {
        this.name_exam = name_exam;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getQuantity_quiz() {
        return quantity_quiz;
    }

    public void setQuantity_quiz(int quantity_quiz) {
        this.quantity_quiz = quantity_quiz;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Date getDate_start() {
        return date_start;
    }

    public void setDate_start(Date date_start) {
        this.date_start = date_start;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }
    
    
    
    
}
