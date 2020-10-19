package com.stu.student.service.impl;

import com.stu.student.domain.Grade;
import com.stu.student.mapper.GradeMapper;
import com.stu.student.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {
    @Autowired
    private GradeMapper gradeMapper;
    public List<Grade> selectAllGrade(int before,int after){
            return gradeMapper.selectAllGrade(before, after);
    }
    public int count(){
        return gradeMapper.count();
    }
    public int addGrade(Grade grade){
        return gradeMapper.addGrade(grade);
    }
    public List<Grade> selectGradeByStuId(String student_id){
        return  gradeMapper.selectGradeByStuId(student_id);
    }
    public int updateGrade(String source_id,String student_id,String olderSource,String exam){
        return gradeMapper.updateGrade(source_id,student_id,olderSource,exam);
    }
    public int deleteGrade(String source_id,String student_id){
        return gradeMapper.deleteGrade(source_id,student_id);
    }
}
