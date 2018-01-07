package com.hfut.glxy.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018/1/7 12:10 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Mapper
@Component(value = "/unit_officeDao")
public interface Unit_OfficeDao {

    /**   
         * 
         * @Date 2018/1/7 12:13
         * @author students_ManagementSchool
         * @param unit_id
         * @return
         * @since JDK 1.8
         * @condition  获取某一教学单元的所有office文件
    */
    @Select("select office_id from unit_office where unit_id=#{unit_id} and isDelete=0")
    String [] getOfficesByUnit(@Param("unit_id") String unit_id);

}
