package com.stu.student.mapper;

import com.stu.student.domain.Grade;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GradeMapper {
    List<Grade> selectAllGrade(@Param("before") int before, @Param("after") int after);
    int count();
    int addGrade(Grade grade);
    List<Grade> selectGradeByStuId(@Param("student_id") String student_id);
    int updateGrade(@Param("source_id") String source_id,@Param("student_id") String student_id,@Param("olderSource") String olderSource,@Param("exam") String exam);
    int deleteGrade(@Param("source_id") String source_id,@Param("student_id") String student_id);
}
