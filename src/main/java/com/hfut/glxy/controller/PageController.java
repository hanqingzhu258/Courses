package com.hfut.glxy.controller;

import com.hfut.glxy.dto.Result;
import com.hfut.glxy.service.CourseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017/11/25 16:04 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Controller
public class PageController {

    private static final Logger logger= LoggerFactory.getLogger(ManagerController.class);

    @Resource
    private CourseService courseService;

    /**
         *
         * @Date 2017/11/25 19:03
         * @author students_ManagementSchool
         * @return
         * @since JDK 1.8
         * @condition 从数据库获取全部课程信息，返回前台登录页面，供用户选择登录
    */
    @ResponseBody
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public Result<List<Map>> returnCourses(){
        List<Map> maps;
        try {
            maps = courseService.getAllCourses();
        }catch (Exception e){
            e.printStackTrace();
            return new Result<>(false,"课程获取失败",null);
        }
        return new Result<>(true,"课程获取成功",maps);
    }


    @RequestMapping(value = "/addCourseGroup", method = RequestMethod.GET)
    public String addCourseGroup() {
        return "/superadmin/addCourseGroup";
    }

    @RequestMapping(value = "/courseGroupList", method = RequestMethod.GET)
    public String courseGrouplist() {
        return "/superadmin/courseGroupList";
    }

    @RequestMapping(value="/addCourse",method = RequestMethod.GET)
    public String addCourse(){return "/superadmin/addCourse";}

    @RequestMapping(value="/courseList",method = RequestMethod.GET)
    public String courseList(){return "/superadmin/courseList";}

    /*@RequestMapping(value = "/addChapter", method = RequestMethod.GET)
    public String addchapter() {
        return "/superadmin/addChapter";
    }

    @RequestMapping(value = "apterList", method = RequestMethod.GET)
    public String chapterlist() {
        return "/superadminapterList";
    }*/


    @RequestMapping(value = "/teacherManage", method = RequestMethod.GET)
    public String teacherManage() {
        return "/superadmin/teacherManage";
    }

    @RequestMapping(value = "/teacherList",method = RequestMethod.GET)
    public String teacherList(){return "/superadmin/teacherList";}

    @RequestMapping(value = "/adminManage", method = RequestMethod.GET)
    public String adminManage() {
        return "/superadmin/adminManage";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){return "/superadmin/login";}

}
