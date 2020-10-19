package com.stu.student.domain;

import lombok.Data;


@Data

public class Student {
    /**
     * `id` varchar(20) NOT NULL COMMENT '学号',
     * `password` varchar(25) DEFAULT NULL,
     * `name` varchar(10) DEFAULT NULL COMMENT '姓名',
     * `sex` int(1) unsigned zerofill DEFAULT NULL COMMENT '性别',
     * `tel` varchar(15) DEFAULT NULL COMMENT '联系电话',
     * `time_of_school` datetime DEFAULT NULL COMMENT '入学时间',
     * `dept` varchar(25) DEFAULT NULL COMMENT '院系',
     * `major` varchar(25) DEFAULT NULL COMMENT '专业',
     * `of_class` varchar(25) DEFAULT NULL COMMENT '班级',
     */
    private String id;
    private String password;
    private String name;
    private String sex;
    private String tel;
    private String grade;
    private String dept;
    private String major;
    private String of_class;
}
