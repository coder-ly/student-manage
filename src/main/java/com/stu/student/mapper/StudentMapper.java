package com.stu.student.mapper;

import com.stu.student.domain.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * dao : 数据持久层 （主要跟数据库打交道 ， StudentDao） @Repository
 * service : 业务处理层 （主要处理业务功能） @Service
 * servlet ： 控制器（主要做是数据中转） @Controller
 */

@Repository
public interface StudentMapper {
    Student checkLogin(Student student);
    List<Student> selectAll(@Param("before") int before, @Param("after") int after);
    int count();
    int addStudent(Student student);
    List<Student> selectStudentById(String id);
    int updateStudent(Student student);
    int deleteStudent(String id);
    List<Student> selectStudent();
}

