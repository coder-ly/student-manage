package com.stu.student.controller;

import com.stu.student.domain.Grade;
import com.stu.student.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/grade")
public class GradeController {
    @Autowired
    private GradeService gradeService;

    @RequestMapping("/tableGrade")
    @ResponseBody
    public Map<String, Object> selectAllGrade(int page, int limit) {
        int before = limit * (page - 1);
        int after = page * limit;
        int count = gradeService.count();
        List<Grade> gradelist = gradeService.selectAllGrade(before, after);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", "0");
        map.put("msg", "0");
        map.put("count", count);
        map.put("data", gradelist);
        return map;
    }

    @RequestMapping("/addGrade")
    @ResponseBody
    public Map<String, Object> addGrade(Grade grade) {
        Map<String, Object> map = new HashMap<>();
        int result = gradeService.addGrade(grade);
        if (result > 0) {
            map.put("code", "100");
            map.put("msg", "添加成功");
            map.put("data", "");
            map.put("count", "");
        } else {
            map.put("code", "101");
            map.put("msg", "添加失败");
            map.put("data", "");
            map.put("count", "");
        }
        return  map;
    }
    @RequestMapping("/selectGradeByStudent")
    @ResponseBody
    public Map<String,Object> selectGradeByStudent(String student_id){
        List<Grade> list = gradeService.selectGradeByStuId(student_id);
        Map<String,Object> map = new HashMap<>();
        map.put("code","0");
        map.put("data",list);
        map.put("msg","");
        map.put("count","");
        return  map;
    }
    @RequestMapping("/updateGrade")
    @ResponseBody
    public Map<String,Object> updateGrade(String source_id,String student_id,String olderSource,String exam){
        Map<String,Object> map = new HashMap<>();
        int result = gradeService.updateGrade(source_id,student_id,olderSource,exam);
        if(result>0){
            map.put("code","100");
            map.put("data","");
            map.put("msg","修改成功");
            map.put("count","");
        }else{
            map.put("code","101");
            map.put("data","");
            map.put("msg","修改失败");
            map.put("count","");
        }
        return map;
    }
    @RequestMapping("/deleteGrade")
    @ResponseBody
    public Map<String,Object> deleteGrade(String source_id,String student_id){
        Map<String,Object> map=new HashMap<>();
        int result = gradeService.deleteGrade(source_id,student_id);
        if(result>0){
            map.put("code","100");
            map.put("data","");
            map.put("msg","删除成功");
            map.put("count","");
        }else{
            map.put("code","101");
            map.put("data","");
            map.put("msg","删除失败");
            map.put("count","");
        }
        return map;
    }

}



