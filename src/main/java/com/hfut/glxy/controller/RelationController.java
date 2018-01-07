package com.hfut.glxy.controller;

import com.hfut.glxy.dto.Result;
import com.hfut.glxy.entity.Course;
import com.hfut.glxy.service.RelationService;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017/12/28 11:01 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Controller
public class RelationController {

    @Resource
    private RelationService relationService;

    /**   
         * 
         * @Date 2017/12/28 11:05 
         * @author students_ManagementSchool
         * @param course
         * @return
         * @since JDK 1.8
         * @condition  更新课程所处的课程组
    */
    @ResponseBody
    @RequestMapping(value = "/updateRelation_courseGroup_course",method = RequestMethod.POST)
    public Result<String> updateRelation_courseGroup_course(@RequestBody Course course){

        String courseGroup_id=course.getCourseGroup_id();
        String course_id=course.getId();
        /*String[] teacher_ids=course.getTeacher_ids();*/

        if (courseGroup_id==null||courseGroup_id.trim().isEmpty()){
            return new Result<>(false,"课程组不能为空",null);
        }
        if (course_id==null||course_id.trim().isEmpty()){
            return new Result<>(false,"传参失败，未选择相应课程",null);
        }
        /*if (teacher_ids==null){
            return new Result<>(false,"负责教师不能为空",null);
        }*/

        int updateRelationSuccess;

        try{
            updateRelationSuccess=relationService.updateRelation_courseGroup_course(course);
        }catch(Exception e){
            e.printStackTrace();
            return new Result<>(false,"更新失败",null);
        }

        if (updateRelationSuccess!=1){
            return new Result<>(false,"未知错误",null);
        }

        return new Result<>(true,"更新成功",null);
    }

    @ResponseBody
    @RequestMapping(value = "/updateRelation_teacher_course",method = RequestMethod.POST)
    public Result<String> updateRelation_teacher_course(@RequestBody Course course){

        String courseGroup_id=course.getCourseGroup_id();
        String course_id=course.getId();
       /* String[] teacher_ids=course.getTeacher_ids();*/

        if (courseGroup_id==null||courseGroup_id.trim().isEmpty()){
            return new Result<>(false,"课程组不能为空",null);
        }
        if (course_id==null||course_id.trim().isEmpty()){
            return new Result<>(false,"传参失败，未选择相应课程",null);
        }
        /*if (teacher_ids==null){
            return new Result<>(false,"负责教师不能为空",null);
        }*/
        int updateRelationSuccess;

        try{
            updateRelationSuccess=relationService.updateRelation_teacher_course(course);
        }catch(Exception e){
            e.printStackTrace();
            return new Result<>(false,"更新失败",null);
        }

        if (updateRelationSuccess!=1){
            return new Result<>(false,"未知错误",null);
        }

        return new Result<>(true,"更新成功",null);
    }

}
