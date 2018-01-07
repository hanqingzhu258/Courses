package com.hfut.glxy.mapper;

import com.hfut.glxy.entity.CourseInfo;
import com.hfut.glxy.entity.Office;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018/1/7 10:46 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Mapper
@Component(value = "officeDao")
public interface OfficeDao {

    /**   
         * 
         * @Date 2018/1/7 10:52
         * @author students_ManagementSchool
         * @param id
         * @return
         * @since JDK 1.8
         * @condition  根据id获取课程介绍：课程大纲、教学日历、考核方式与标准、学习指南
    */
    @Select("select * from office where id=#{id} and isDelete=0")
    Office queryOfficeById(@Param("id") String id);



}
