package com.hfut.glxy.controller;

import com.hfut.glxy.dto.Result;
import com.hfut.glxy.entity.Course;
import com.hfut.glxy.entity.Manager;
import com.hfut.glxy.service.ManagerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017/11/25 15:15 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Controller
public class ManagerController {

    private static final Logger logger= LoggerFactory.getLogger(ManagerController.class);

    @Resource
    private ManagerService managerService;

    /**
         *
         * @Date 2017/11/25 16:02
         * @author students_ManagementSchool
         * @param manager
         * @param session
         * @return
         * @since JDK 1.8
         * @condition 管理员登录验证
    */
    @ResponseBody
    @RequestMapping(value="/login",method = RequestMethod.POST)
    public Result<String> login(@RequestBody Manager manager, HttpSession session){

        String course_id=manager.getCourse_id();


        Manager managerT;

        try {

            if (course_id == null) {
                //超级管理员登录
                managerT = managerService.querySuperManager();

                System.out.println("super:account"+manager.getAccount());

            } else {
                //普通课程管理员登录
                managerT = managerService.queryManagerByCourse(course_id);
            }

        }catch(Exception e){
            e.printStackTrace();
            return new Result<>(false,"未知错误",null);
        }

        if (managerT==null){
            return new Result<>(false,"无相应数据",null);
        }

        if (manager.getAccount().equals(managerT.getAccount())&&manager.getPassword().equals(managerT.getPassword())){

            session.setAttribute("id",managerT.getId());

            //对于普通管理员设置角色及管理课程
            if (course_id!=null){
                session.setAttribute("courseId",course_id);
                session.setAttribute("role",new Integer(1));
            }else{
                session.setAttribute("role",new Integer(2));
            }

            return new Result<>(true,"登录成功",null);

        }else{
            return new Result<>(false,"账号或密码错误，请重新登录",null);
        }

    }




    /**
         *
         * @Date 2017/11/25 19:16
         * @author students_ManagementSchool
         * @param session
         * @return
         * @since JDK 1.8
         * @condition  注销登录
    */
    @ResponseBody
    @RequestMapping(value ="/exit",method = RequestMethod.GET)
    public Result<String> exit(HttpSession session){
        //移除管理员id
        session.removeAttribute("id");
        //判断管理员类型
        String course_id=(String)session.getAttribute("courseId");
        if (course_id==null){}//超级管理员
        else{
            //普通管理员
            session.removeAttribute("courseId");
        }
        //移除角色
        session.removeAttribute("role");

        return new Result<>(true,"退出成功",null);
    }

    /**
         *
         * @Date 2017/11/25 22:42
         * @author students_ManagementSchool
         * @param manager
         * @return
         * @since JDK 1.8
         * @condition  根据id获取管理员（用于超级管理员的后台管理）
    */
    /*@ResponseBody
    @RequestMapping(value = "/queryManagerById",method = RequestMethod.POST)
    public Result<Manager> queryManagerById(@RequestBody Manager manager){

        Manager managerG=managerService.queryManagerById(manager.getId());
        return new Result<>(true,"查询成功",manager);

    }*/

    /**
         *
         * @Date 2017/11/25 23:00
         * @author students_ManagementSchool
         * @param null
         * @return
         * @since JDK 1.8
         * @condition 获取全部管理员，用于超级管理员的后台管理
    */
    /*@ResponseBody
    @RequestMapping(value = "/getAllManagers",method = RequestMethod.POST)
    public Result<List<Manager>> getAllManagers(){

        List<Manager> managers=managerService.getAllManagers();
        return new Result<>(true,"全部管理员获取成功",managers);

    }*/


}
