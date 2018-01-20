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

    private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
    @Resource
    private CourseService courseService;
    /**
     * @return
     * @Date 2017/11/25 19:03
     * @author students_ManagementSchool
     * @condition 从数据库获取全部课程信息，返回前台登录页面，供用户选择登录
     * @since JDK 1.8
     */
    @ResponseBody
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public Result<List<Map>> returnCourses() {
        List<Map> maps;
        try {
            maps = courseService.getAllCourses();
        } catch (Exception e) {
            e.printStackTrace();
            return new Result<>(false, "课程获取失败", null);
        }
        return new Result<>(true, "课程获取成功", maps);
    }
    /**
     * @Author: yanni
     * @Description:超级管理员
     * @Date: 13:10 2018/1/14
     * @Modified By:
     * @Params: * @param null
     */
    @RequestMapping(value = "/superadmin", method = RequestMethod.GET)
    public String superadmin() {
        return "/superadmin/superindex";
    }
    @RequestMapping(value = "/addCourseGroup", method = RequestMethod.GET)
    public String addCourseGroup() {
        return "/superadmin/addCourseGroup";
    }
    @RequestMapping(value = "/courseGroupList", method = RequestMethod.GET)
    public String courseGrouplist() {
        return "/superadmin/courseGroupList";
    }
    @RequestMapping(value = "/addCourse", method = RequestMethod.GET)
    public String addCourse() {
        return "/superadmin/addCourse";
    }
    @RequestMapping(value = "/courseList", method = RequestMethod.GET)
    public String courseList() {
        return "/superadmin/courseList";
    } @RequestMapping(value = "/superadminsidebar", method = RequestMethod.GET)
    public String superadminsidebar() {
        return "/superadmin/supersidebar";
    }
    /*@RequestMapping(value = "/addChapter", method = RequestMethod.GET)
    public String addchapter() {
        return "/superadmin/addChapter";
    }
    @RequestMapping(value = "apterList", method = RequestMethod.GET)
    public String chapterlist() {
        return "/superadminapterList";
    }*/
    @RequestMapping(value = "/addTeacher", method = RequestMethod.GET)
    public String addTeacher() {
        return "/superadmin/addTeacher";
    }
    @RequestMapping(value = "/teacherList", method = RequestMethod.GET)
    public String teacherList() {
        return "/superadmin/teacherList";
    }
    @RequestMapping(value = "/superadminWelcome", method = RequestMethod.GET)
    public String superadminWelcome() {
        return "/superadmin/superwelcome";
    }
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/superadmin/login";
    }
    /**
     * @Author: yanni
     * @Description: 普通管理员
     * @Date: 14:33 2018/1/11
     * @Modified By:
     * @Params: * @param null
     */
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminIndex() {
        return "/admin/adminindex";
    }
    @RequestMapping(value = "/adminsidebar", method = RequestMethod.GET)
    public String adminsidebar() {
        return "/admin/adminsidebar";
    } @RequestMapping(value = "/addInfo", method = RequestMethod.GET)
    public String addInfo() {
        return "/admin/addInfo";
    } @RequestMapping(value = "/infoList", method = RequestMethod.GET)
    public String infoList() {
        return "/admin/infoList";
    }
    @RequestMapping(value = "/addChapter", method = RequestMethod.GET)
    public String addChapter() {
        return "/admin/addChapter";
    }
    @RequestMapping(value = "/addData", method = RequestMethod.GET)
    public String addData() {
        return "/admin/addData";
    }
    @RequestMapping(value = "/addExercise", method = RequestMethod.GET)
    public String addExercise() {
        return "/admin/addExercise";
    }
    @RequestMapping(value = "/addHomework", method = RequestMethod.GET)
    public String addHomework() {
        return "/admin/addHomework";
    }
    @RequestMapping(value = "/chapterDetail", method = RequestMethod.GET)
    public String chapterDetail() {
        return "/admin/chapterDetail";
    }
    @RequestMapping(value = "/chapterList", method = RequestMethod.GET)
    public String chapterList() {
        return "/admin/chapterList";
    }
    @RequestMapping(value = "/dataList", method = RequestMethod.GET)
    public String dataList() {
        return "/admin/dataList";
    }
    @RequestMapping(value = "/exerciseList", method = RequestMethod.GET)
    public String exerciseList() {
        return "/admin/exerciseList";
    }
    @RequestMapping(value = "/homeworkList", method = RequestMethod.GET)
    public String homeworkList() {
        return "/admin/homeworkList";
    }
    @RequestMapping(value = "/adminwelcome", method = RequestMethod.GET)
    public String adminwelcome() {
        return "/admin/adminwelcome";
    }


}

