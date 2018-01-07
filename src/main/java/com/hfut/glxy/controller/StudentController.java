package com.hfut.glxy.controller;

import com.hfut.glxy.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author chenliangliang
 * @date 2017/12/30
 */
@RestController
@RequestMapping(value = "/stu")
public class StudentController {

    private StudentService studentService;


    @Autowired
    protected StudentController(StudentService studentService){
        this.studentService=studentService;
    }




}
