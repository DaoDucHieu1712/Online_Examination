/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Course;

/**
 *
 * @author ADMIN
 */
public interface ICourse {

    public ArrayList<Course> list_course();
    public Course getCourse(int id);
    public void insert(Course course);
    public void update(Course course);
    public void delete(int id);
    
}
