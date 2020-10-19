package com.stu.student.domain;

import lombok.Data;

@Data
public class Grade {
    private  String student_id;
    private  String source_id;
    private  String grade;
    private  String name;
    private  String tname;
    private  String address;
    private  String credit;
    private  Source source;
    private  Teacher teacher;
}
