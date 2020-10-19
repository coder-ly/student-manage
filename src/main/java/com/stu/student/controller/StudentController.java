package com.stu.student.controller;

import com.stu.student.domain.Student;
import com.stu.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;


    @RequestMapping("/checkUser")
    @ResponseBody
    public boolean checkStu(Student student, HttpSession session) {
       if (studentService.checkedLogin(student,session))
           return  true;
       else
           return false;
    }
    @RequestMapping("/tableStudent")
    @ResponseBody
    public  Map<String,Object> tableStudent(int page,int limit){
        int before = limit * (page-1);
        int after = page * limit;
        int count = studentService.count();
        List<Student> student = studentService.selectAll(before,after);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("code","0");
        map.put("msg","0");
        map.put("count",count);
        map.put("data",student);
        return map;
    }
    @RequestMapping("/addStudent")
    @ResponseBody
    public Map<String,Object> addStudent(Student student){
        int result=studentService.addStudent(student);
        List<Student> listStu=studentService.selectStudentById(student.getId());
        Map<String,Object> map=new HashMap<String, Object>();
        if(result>0){
            map.put("code","100");
            map.put("msg","添加成功");
        }
        else {
            map.put("code","101");
            map.put("msg","添加失败");
        }
        return  map;
    }
    @RequestMapping("/searchStudent")
    @ResponseBody
    public Map<String,Object> selectStudengById(String id){
        List<Student> listStu=studentService.selectStudentById(id);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("code","0");
        map.put("msg","");
        map.put("data",listStu);
        map.put("count","");
        return  map;
    }
    @RequestMapping("/updateStudent")
    @ResponseBody
    public Map<String,Object> updateStudent(Student student){
        int result=studentService.updateStudent(student);
        Map<String,Object> map=new HashMap<String,Object>();
        if(result>0){
            map.put("code","100");
            map.put("count","");
            map.put("data","");
            map.put("msg","修改成功");
        }else{
            map.put("code","101");
            map.put("count","");
            map.put("data","");
            map.put("msg","修改失败");
        }
        return map;
    }
    @RequestMapping("/deleteStudent")
    @ResponseBody
    public Map<String,Object> deleteStudent(String id){
        int result=studentService.deleteStudent(id);
        Map<String,Object> map=new HashMap<String,Object>();
        if(result>0){
            map.put("code","100");
            map.put("count","");
            map.put("data","");
            map.put("msg","删除成功");
        }else{
            map.put("code","101");
            map.put("count","");
            map.put("data","");
            map.put("msg","删除失败");
        }
        return map;
    }
    @RequestMapping("/selectStudent")
    @ResponseBody
    public Map<String,Object> selectStudent(){
        List<Student> student=studentService.selectStudent();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code","");
        map.put("count","");
        map.put("data",student);
        map.put("msg","");
        return map;
    }
    @RequestMapping("/clearSession")
    @ResponseBody
    public Map<String,Object> clearSession(HttpServletRequest request){
        Map<String,Object> map=new HashMap<>();
        HttpSession session = request.getSession();
        session.removeAttribute("student");
        map.put("code","0");
        map.put("data","");
        map.put("msg","");
        map.put("count","");
        return map;
    }
}
