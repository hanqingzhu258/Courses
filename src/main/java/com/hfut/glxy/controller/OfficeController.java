package com.hfut.glxy.controller;

import com.hfut.glxy.dto.Result;
import com.hfut.glxy.entity.Office;
import com.hfut.glxy.mapper.OfficeDao;
import com.hfut.glxy.service.OfficeService;
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
 * date: 2018/1/19 12:32 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Controller
public class OfficeController {

    @Resource
    private OfficeService officeService;

    /**   
         * 
         * @Date 2018/1/19 13:07 
         * @author students_ManagementSchool
         * @param office
         * @return
         * @since JDK 1.8
         * @condition  删除office文件
    */
    @ResponseBody
    @RequestMapping(value = "/deleteOfficeById",method = RequestMethod.POST)
    public Result<String> deleteOffice(@RequestBody Office office){

        try{
            if (officeService.deleteById(office.getId())){
                return new Result<>(false,"删除成功",null);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new Result<>(false,"删除失败",null);
        }
        return new Result<>(false,"删除异常",null);
    }

}
