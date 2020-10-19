package com.stu.student.controller;

import com.stu.student.domain.Source;
import com.stu.student.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/source")
public class SourceController {
    @Autowired
    private SourceService sourceService;
    @RequestMapping("/tableSource")
    @ResponseBody
    public  Map<String,Object> tableSource(int page,int limit){
        int before = limit * (page-1);
        int after = page * limit;
        int count = sourceService.count();
        List<Source> source = sourceService.selectAllSource(before,after);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("code","0");
        map.put("msg","0");
        map.put("count",count);
        map.put("data",source);
        return map;
    }
    @RequestMapping("/addSource")
    @ResponseBody
    public Map<String,Object> addSource(Source source){
        int result=sourceService.addSource(source);
        Map<String,Object> map=new HashMap<String, Object>();
        if(result>0){
            map.put("code","100");
            map.put("msg","添加成功");
            map.put("data","");
            map.put("count","");
        }else{
            map.put("code","101");
            map.put("msg","添加失败");
            map.put("data","");
            map.put("count","");
        }
        return  map;
    }

    @RequestMapping("/selectSourceByName")
    @ResponseBody
    public  Map<String,Object> selectSourceByName(String name){
        List<Source> listSource=sourceService.selectSourceByName(name);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("code","0");
        map.put("msg","");
        map.put("data",listSource);
        map.put("count","");
        return  map;
    }
    @RequestMapping("/deleteSource")
    @ResponseBody
    public  Map<String,Object> deleteSource(String id){
        int result=sourceService.deleteSource(id);
        Map<String,Object> map=new HashMap<String, Object>();
        if(result>0){
            map.put("code","100");
            map.put("data","");
            map.put("count","");
            map.put("msg","删除成功");
        }else{
            map.put("code","101");
            map.put("data","");
            map.put("count","");
            map.put("msg","删除失败");
        }
        return  map;
    }
    @RequestMapping("/editSource")
    @ResponseBody
    public Map<String,Object> editSource(Source source){
        Map<String,Object> map=new HashMap<String,Object>();
        int result = sourceService.updateSource(source);
        if(result>0){
            map.put("code","100");
            map.put("data","");
            map.put("count","");
            map.put("msg","修改成功");
        }else {
            map.put("code","101");
            map.put("data","");
            map.put("count","");
            map.put("msg","修改成功");
        }
        return map;
    }
    @RequestMapping("/selectSourceByStudent")
    @ResponseBody
    public  Map<String,Object> selectSourceByStudent(String student_id){
        List<Source> listSource=sourceService.selectSourceByStudent(student_id);
        Map<String,Object> map=new HashMap<>();
        map.put("code","0");
        map.put("msg","");
        map.put("data",listSource);
        map.put("count","");
        return  map;
    }
}
