package com.hfut.glxy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.hfut.glxy.entity.Homework;
import com.hfut.glxy.mapper.HomeworkMapper;
import com.hfut.glxy.service.HomeworkService;
import org.springframework.stereotype.Service;

/**
 * @author chenliangliang
 * @date: 2017/11/29
 */
@Service
public class HomeworkServiceImpl extends ServiceImpl<HomeworkMapper,Homework> implements HomeworkService {
}
