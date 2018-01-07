package com.hfut.glxy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.baomidou.mybatisplus.toolkit.Sequence;
import com.hfut.glxy.entity.Inform;
import com.hfut.glxy.mapper.InformMapper;
import com.hfut.glxy.service.InformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * @author chenliangliang
 * @date: 2017/11/27
 */
@Service
public class InformServiceImpl extends ServiceImpl<InformMapper,Inform> implements InformService {

    private InformMapper informMapper;

    @Autowired
    protected InformServiceImpl(InformMapper informMapper){
        this.informMapper=informMapper;
    }

    @Override
    public void save(Inform inform) throws RuntimeException {

        int res=informMapper.save(inform);
        if (res!=1){
            throw new RuntimeException("插入异常");
        }
    }
}
