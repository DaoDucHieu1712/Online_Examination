/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Question {
    private int id;
    private String quiz;
    private String op1;
    private String op2;
    private String op3;
    private String op4;
    private int solution;
    private String solutionStr;
    private Course course;

    public Question() {
    }

    public Question(int id, String quiz, String op1, String op2, String op3, String op4, int solution, Course course) {
        this.id = id;
        this.quiz = quiz;
        this.op1 = op1;
        this.op2 = op2;
        this.op3 = op3;
        this.op4 = op4;
        this.solution = solution;
        this.course = course;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuiz() {
        return quiz;
    }

    public void setQuiz(String quiz) {
        this.quiz = quiz;
    }

    public String getOp1() {
        return op1;
    }

    public void setOp1(String op1) {
        this.op1 = op1;
    }

    public String getOp2() {
        return op2;
    }

    public void setOp2(String op2) {
        this.op2 = op2;
    }

    public String getOp3() {
        return op3;
    }

    public void setOp3(String op3) {
        this.op3 = op3;
    }

    public String getOp4() {
        return op4;
    }

    public void setOp4(String op4) {
        this.op4 = op4;
    }

    public int getSolution() {
        return solution;
    }

    public void setSolution(int solution) {
        this.solution = solution;
    }

    public Course getCourse() {
        return course;
    }
    
    
    
    public String getSolutionStr(){
        switch(solution){
            case 1:
                solutionStr = "Option 1";
                return solutionStr;
            case 2:
                solutionStr = "Option 2";
                return solutionStr;
            case 3:
                solutionStr = "Option 3";
                return solutionStr;
            case 4:
                solutionStr = "Option 4";
                return solutionStr;
        }
        return null;
    }
    
    public void setCourse(Course course) {
        this.course = course;
    }
    
    public String getSolutionIsStr(int solution){
        switch(solution){
            case 1:
                return op1;
            case 2:
                return op2;
            case 3:
                return op3;
            case 4:
                return op4;
        }
        return null;
    }
    
}
