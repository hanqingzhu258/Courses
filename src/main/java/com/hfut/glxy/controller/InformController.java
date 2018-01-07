package com.hfut.glxy.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.hfut.glxy.dto.Result;
import com.hfut.glxy.entity.Inform;
import com.hfut.glxy.service.InformService;
import com.hfut.glxy.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Map;

/**
 * @author chenliangliang
 * @date: 2017/11/27
 */
@RestController
@RequestMapping(value = "/notice")
public class InformController {

    private InformService informService;

    @Autowired
    protected InformController(InformService informService) {
        this.informService = informService;
    }

    /**
     * 发布通知
     *
     * @param inform
     * @return
     */
    @PostMapping
    public Result pubNotice(@RequestBody @Valid Inform inform,
                            BindingResult result,HttpSession session) {
        if (result.hasErrors()){
            return ResultUtil.fail(result.getAllErrors().toString());
        }
        String courseId = (String) session.getAttribute("courseId");
        //String courseId="tejnk76rfe";
        inform.setCourseId(courseId);
        try {
            if (informService.insert(inform)) {
                return ResultUtil.OK();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResultUtil.insertError();
    }

    /**
     * 分页获取通知
     * @param pageNum
     * @param session
     * @return
     */
    @GetMapping("/{pageNum}")
    public Result listNotices(@PathVariable(value = "pageNum", required = false) int pageNum,
                              HttpSession session) {

        String courseId = (String) session.getAttribute("courseId");
        //String courseId="tejnk76rfe";
        if(pageNum<=0){
            pageNum=1;
        }
        try {
            Page<Inform> page = informService.selectPage(new Page<>(pageNum, 4),
                    new EntityWrapper<Inform>()
                            .eq("course_id",courseId)
                            .eq("is_delete",0)
                            .orderBy("update_time", false));
            return ResultUtil.OK(page);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.selectError();
        }
    }

    /**
     * 删除通知
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result removeNotice(@PathVariable("id") Long id) {
        try {
            if (id != null && id != 0) {
                Inform inform=new Inform();
                inform.setId(id);
                inform.setIsDelete(1);
                if (informService.updateById(inform)) {
                    return ResultUtil.OK("删除通知成功");
                }
            } else {
                return ResultUtil.fail("id为空或格式不正确");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResultUtil.deleteError();
    }

}
