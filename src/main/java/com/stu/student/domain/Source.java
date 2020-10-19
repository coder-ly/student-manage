package com.stu.student.domain;

import lombok.Data;

@Data
public class Source {
    private  String id;
    private  String name;
    private  String teacher_id;
    private  String address;
    private  String credit;
    private  Teacher teacher;
    private  String tname;
}
