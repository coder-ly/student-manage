package com.stu.student.controller;

import com.stu.student.domain.Teacher;
import com.stu.student.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/selectAllTeacher")
    @ResponseBody
    public Map<String,Object> selectAllTeacher(){
        List<Teacher> teachers=teacherService.selectAllTeacher();
        Map<String,Object> map= new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","");
        map.put("count","");
        map.put("data",teachers);
        return  map;
    }
}
