package com.stu.student.service.impl;

import com.stu.student.domain.Source;
import com.stu.student.mapper.SourceMapper;
import com.stu.student.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SourceServiceImpl implements SourceService {
    @Autowired
    private SourceMapper sourceMapper;

    public List<Source> selectAllSource(int before, int after) {
        return sourceMapper.selectAllSource(before, after);
    }

    public int count() {
        return sourceMapper.count();
    }

    public int addSource(Source source) {
        return sourceMapper.addSource(source);
    }

    public List<Source> selectSourceByName(String name) {
        return sourceMapper.selectSourceByName(name);
    }
    public int deleteSource(String id){
        return sourceMapper.deleteSource(id);
    }
    public  int updateSource(Source source){
        return  sourceMapper.updateSource(source);
    }
    public  List<Source> selectSourceByStudent(String student_id){
        return  sourceMapper.selectSourceByStudent(student_id);
    }
}
