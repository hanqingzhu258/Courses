package com.hfut.glxy.service.impl;

import com.hfut.glxy.entity.*;
import com.hfut.glxy.mapper.*;
import com.hfut.glxy.service.ChapterService;
import com.hfut.glxy.service.InforService;
import com.hfut.glxy.service.KnowledgePointService;
import com.hfut.glxy.service.UnitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017/12/6 15:27 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Service
public class InforServiceImpl implements InforService {

    @Resource
    private CourseGroupDao courseGroupDao;
    @Resource
    private TeacherDao teacherDao;
    @Resource
    private CourseDao courseDao;
    @Resource
    private PictureDao pictureDao;
    @Resource
    private CourseGroup_TeacherDao courseGroup_teacherDao;
    @Resource
    private CourseGroup_CourseDao courseGroup_courseDao;
    @Resource
    private Teacher_CourseDao teacher_courseDao;
    @Resource
    private Teacher_PictureDao teacher_pictureDao;
    @Resource
    private Course_PictureDao course_pictureDao;
    @Resource
    private ChapterService chapterService;
    @Resource
    private UnitService unitService;
    @Resource
    private KnowledgePointService knowledgePointService;
    @Resource
    private OfficeDao officeDao;
    @Resource
    private Course_OfficeDao _courseOfficeDao;
    /**
     *
     * @Date 2017/12/6 15:26
     * @author students_ManagementSchool
     * @return
     * @since JDK 1.8
     * @condition  获取所有的课程以及教师
     */
    @Override
    public Map getCourseGroup_Teacher() throws Exception{

        List<CourseGroup> courseGroups;
        List<Teacher> teachers;

        Map map=new HashMap();

        courseGroups=courseGroupDao.getAllCourseGroups();
        teachers=teacherDao.getAllTeachers();

        map.put("courseGroups",courseGroups);
        map.put("teachers",teachers);

        return map;
    }

    /**
         *
         * @Date 2017/12/6 19:36
         * @author students_ManagementSchool
         * @return
         * @since JDK 1.8
         * @condition  获取全部课程组
    */
    @Override
    public List<CourseGroup> getCourseGroups() throws Exception{

        List<CourseGroup> courseGroups;

        courseGroups=courseGroupDao.getAllCourseGroups();

        return courseGroups;
    }

    /**
         *
         * @Date 2017/12/7 12:02
         * @author students_ManagementSchool
         * @return
         * @since JDK 1.8
         * @condition  获取所有的课程
    */
    @Override
    public List<Course> getCourses() throws Exception{

        List<Course> courses;

        courses=courseDao.getAllCourses();

        return courses;
    }

    /**
         *
         * @Date 2017/12/23 15:57
         * @author students_ManagementSchool
         * @param courseGroup_id
         * @return
         * @since JDK 1.8
         * @condition 获取某课程组所有的信息（包括课程和课程组）
    */
    @Override
    public Map getCourse_Teacher(String courseGroup_id) throws Exception{

        Map map=new HashMap();
        /*List<Map> maps=new ArrayList<>();*/

        List<Course> courses=new ArrayList<>();
        List<Teacher> teachers=new ArrayList<>();
        CourseGroup courseGroup;

        //获取课程组
        courseGroup=courseGroupDao.queryCourseGroupById(courseGroup_id);

        //获取所有的教师
        List<String> teacher_ids=courseGroup_teacherDao.getAllTeachersByCourseGroup(courseGroup_id);
        for (String teacher_id:teacher_ids){
            Teacher teacher=teacherDao.queryTeacherById(teacher_id);
            teachers.add(teacher);
        }

        //获取所有的课程
        List<String> course_ids=courseGroup_courseDao.getAllCoursesByCourseGroup(courseGroup_id);
        for (String course_id:course_ids){
            Course course=courseDao.queryCourseById(course_id);
            courses.add(course);
        }

        map.put("courseGroup",courseGroup);
        map.put("courses",courses);
        map.put("teachers",teachers);

        /*int coursesLength=courses.size();
        int teachersLength=teachers.size();

        *//*if (coursesLength==0&&teachersLength==0){
            maps.add(map);
            return maps;
        }*//*

        if(teachersLength>coursesLength){



        }*/

        return map;
    }

    /**
         *
         * @Date 2017/12/23 16:11
         * @author students_ManagementSchool
         * @param teacher_id
         * @return
         * @since JDK 1.8
         * @condition 获取某一教师的基本信息以及其所教授的课程
    */
    @Override
    public Map getTeacher_Courses(String teacher_id) throws Exception{

        Map map=new HashMap();

        Teacher teacher;
        String courseGroup_id;
        List<Course> courses=new ArrayList<>();
        List<CourseGroup> courseGroups;

        teacher=teacherDao.queryTeacherById(teacher_id);
        if (teacher==null){
            throw new RuntimeException("查询失败");
        }

        courseGroup_id=courseGroup_teacherDao.getCurrentCourseGroupIdByTeacher(teacher_id);
        teacher.setCourseGroup_id(courseGroup_id);

        List<String> course_ids=teacher_courseDao.getAllCoursesByTeacher(teacher_id);
        for (String course_id:course_ids){
            Course course=courseDao.queryCourseById(course_id);
            //获取所处课程组id
            String courseGroupId=courseGroup_courseDao.queryCourseGroupByCourse(course_id);
            course.setCourseGroup_id(courseGroupId);
            courses.add(course);
        }

        courseGroups=courseGroupDao.getAllCourseGroups();

        map.put("teacher",teacher);
        map.put("courses",courses);
        map.put("courseGroups",courseGroups);

        return map;
    }

    /**
         *
         * @Date 2018/1/6 17:52
         * @author students_ManagementSchool
         * @param course_id
         * @return
         * @since JDK 1.8
         * @condition 前台页面获取课程详细信息
    */
    @Override
    public Map getCourseDetail(String course_id) throws Exception{

        Map map=new HashMap();//用来存储详细信息

        Course course;//课程基本信息
        course=courseDao.queryCourseById(course_id);
        map.put("course",course);

        Picture picture;//课程图片
        String picture_id=course_pictureDao.getCurrentPictureIdByCourse(course_id);
        picture=pictureDao.queryPictureById(picture_id);
        map.put("picture",picture);

        List<Map> mapCs=new ArrayList<>();
        List<Chapter> chapters;//所有章
        chapters=chapterService.getChaptersByCourse(course_id);
        if (chapters==null){

            map.put("chapterDetails",mapCs);

        }else{

            for (Chapter chapter:chapters){

                Map mapU=new HashMap();
                //所有教学单元
                List<Unit> units=unitService.getUnitsByChapter(chapter.getId());
                mapU.put("chapter",chapter);
                mapU.put("units",units);

                mapCs.add(mapU);
            }

            map.put("chapters",mapCs);
        }

        List<Map> teachers=new ArrayList<>();//所有负责老师
        String [] teacher_ids;
        teacher_ids=teacher_courseDao.getAllTeachersByCourse(course_id);
        if (teacher_ids==null){

        }else{
            for (String teacher_id:teacher_ids){
                Map mapT=new HashMap();
                Teacher teacher=teacherDao.queryTeacherById(teacher_id);
                String picture_idT=teacher_pictureDao.getCurrentPictureIdByTeacher(teacher_id);
                Picture pictureT=pictureDao.queryPictureById(picture_idT);
                mapT.put("teacher",teacher);
                mapT.put("picture",pictureT);
                teachers.add(mapT);
            }
        }
        map.put("teacherDetail",teachers);

        List<KnowledgePoint> knowledgePoints;
        knowledgePoints=knowledgePointService.getKnowledgePointsByCourse(course_id);
        map.put("knowledgePoints",knowledgePoints);

        Map mapTR=new HashMap();//课程介绍：课程大纲、教学日历、考核方式与标准、学习指南
        String [] office_ids= _courseOfficeDao.getCourseInfosByCourse(course_id);
        Office office_outline=null;
        Office office_date=null;
        Office office_standard=null;
        Office office_guide=null;
        if (office_ids==null){

        }else{

            for (String office_id:office_ids){

                Office office= officeDao.queryOfficeById(office_id);

                /*System.out.println("courseInfoT.getName():"+courseInfoT.getName());*/

                switch (office.getDescription()){
                    case "课程大纲":
                        office_outline=office;

                        break;
                    case "教学日历":
                        office_date=office;

                        break;
                    case "考核方式与标准":
                        office_standard=office;

                        break;
                    case "学习指南":
                        office_guide=office;

                        break;
                }

            }


        }

        mapTR.put("outline",office_outline);
        mapTR.put("date",office_date);
        mapTR.put("standard",office_standard);
        mapTR.put("guide",office_guide);

        map.put("courseinfo",mapTR);


        return map;
    }

}
