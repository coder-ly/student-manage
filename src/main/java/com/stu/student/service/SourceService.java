package com.stu.student.service;

import com.stu.student.domain.Source;

import java.util.List;

public interface SourceService {
    List<Source> selectAllSource(int before, int after);
    int count();
    int  addSource(Source source);
    List<Source> selectSourceByName(String name);
    int deleteSource(String id);
    int updateSource(Source source);
    List<Source> selectSourceByStudent(String student_id);
}
