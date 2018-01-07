package com.hfut.glxy.service;

import com.hfut.glxy.entity.Course;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017/12/28 11:07 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
public interface RelationService {

    /**   
         * 
         * @Date 2017/12/28 11:08
         * @author students_ManagementSchool
         * @param course
         * @return
         * @since JDK 1.8
         * @condition  更新课程所处课程组
    */
    Integer updateRelation_courseGroup_course(Course course) throws Exception;

    /**   
         * 
         * @Date 2017/12/28 11:46
         * @author students_ManagementSchool
         * @param course
         * @return
         * @since JDK 1.8
         * @condition  更新课程的负责教师
    */
    Integer updateRelation_teacher_course(Course course) throws Exception;


}
