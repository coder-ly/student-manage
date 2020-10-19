package com.stu.student.service.impl;

import com.stu.student.domain.Student;
import com.stu.student.mapper.StudentMapper;
import com.stu.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;

    public boolean checkedLogin(Student student, HttpSession session) {
        Student stu = studentMapper.checkLogin(student);
        if (stu != null) {
            session.setAttribute("student", stu);
            return true;
        } else
            return false;
    }
    public List<Student> selectAll(int before, int after){
        return  studentMapper.selectAll(before,after);
    }
    public  int count(){
        return studentMapper.count();
    }
    public  int addStudent(Student student){
        return studentMapper.addStudent(student);
    }
    public List<Student> selectStudentById(String id){
        return studentMapper.selectStudentById(id);
    }
    public int updateStudent(Student student){
        return studentMapper.updateStudent(student);
    }
    public int deleteStudent(String id){
        return studentMapper.deleteStudent(id);
    }
    public List<Student> selectStudent(){
        return  studentMapper.selectStudent();
    }
}
