package com.stu.student.service;

import com.stu.student.domain.Grade;

import java.util.List;

public interface GradeService {
    List<Grade> selectAllGrade(int before, int after);
    int count();
    int addGrade(Grade grade);
    List<Grade> selectGradeByStuId(String student_id);
    int updateGrade(String source_id,String student_id,String olderSource,String exam);
    int deleteGrade(String source_id,String student_id);
}
