package com.stu.student.mapper;

import com.stu.student.domain.Source;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SourceMapper {
    List<Source> selectAllSource(@Param("before") int before, @Param("after") int after);
    int count();
    int addSource(Source source);
    List<Source> selectSourceByName(@Param("name") String name);
    int deleteSource(@Param("id") String id);
    int updateSource(Source source);
    List<Source> selectSourceByStudent(@Param("student_id") String student_id);



}
