package com.stu.student.service.impl;

import com.stu.student.domain.Teacher;
import com.stu.student.mapper.TeacherMapper;
import com.stu.student.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    public List<Teacher> selectAllTeacher(){
        return teacherMapper.selectAllTeacher();
    }

}
