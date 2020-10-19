package com.stu.student.mapper;

import com.stu.student.domain.Student;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

@SpringJUnitConfig
@ContextConfiguration("classpath:spring-applicationContext.xml")
class StudentMapperTest {

    @Autowired
    private StudentMapper userMapper;

    @Test
    void checkLogin(Student u){
        u.setId("019321752229");
        u.setPassword("1234");
        Student stu=userMapper.checkLogin(u);
        System.out.println("stu = " + stu);
    }


    @Test
    void testCheckLogin() {
        Student student = new Student();
        student.setId("019321752229");
        student.setPassword("1234");
        userMapper.checkLogin(student);
    }
}