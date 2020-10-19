package com.stu.student.mapper;

import com.stu.student.domain.Teacher;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherMapper {
    List<Teacher> selectAllTeacher();
}
