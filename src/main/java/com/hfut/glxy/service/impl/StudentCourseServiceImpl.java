package com.hfut.glxy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hfut.glxy.entity.StudentCourse;
import com.hfut.glxy.mapper.StudentCourseMapper;
import com.hfut.glxy.service.StudentCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author chenliangliang
 * @date: 2017/12/6
 */
@Service
public class StudentCourseServiceImpl implements StudentCourseService {

    private StudentCourseMapper studentCourseMapper;


    @Autowired
    protected StudentCourseServiceImpl(StudentCourseMapper studentCourseMapper){
        this.studentCourseMapper=studentCourseMapper;
    }


    @Override
    public boolean save(String sid, String cid) {
        return studentCourseMapper.save(sid, cid)==1;
    }

    @Override
    public boolean cancel(String sid, String cid) {
        return studentCourseMapper.cancel(sid, cid)==1;
    }

    @Override
    public PageInfo<StudentCourse> getCourseStudents(String cid,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<StudentCourse> list=studentCourseMapper.findStudentsByCid(cid);
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<StudentCourse> getStudentCourses(String sid, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<StudentCourse> list= studentCourseMapper.findCourseBySid(sid);
       return new PageInfo<>(list);
    }

    @Override
    public boolean isChosed(String sid, String cid) {
        return studentCourseMapper.isChosed(sid, cid)==1;
    }

    @Override
    public boolean updateTime(String sid, String cid) {
        return studentCourseMapper.updateTime(sid, cid)==1;
    }

    @Override
    public boolean isDelete(String sid, String cid) {
        return studentCourseMapper.isDelete(sid, cid)==1;
    }
}
