package com.stu.student.service;

import com.stu.student.domain.Student;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface StudentService {
    boolean checkedLogin(Student student, HttpSession session);
    List<Student> selectAll(int before, int after);
    int count();
    int addStudent(Student student);
    List<Student> selectStudentById(String id);
    int updateStudent(Student student);
    int deleteStudent(String id);
    List<Student> selectStudent();
}
