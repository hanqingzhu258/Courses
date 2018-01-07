package com.hfut.glxy.service;

import com.baomidou.mybatisplus.service.IService;
import com.hfut.glxy.entity.Inform;
import org.springframework.stereotype.Component;

/**
 * @author chenliangliang
 * @date: 2017/11/27
 */

public interface InformService extends IService<Inform> {


    void save(Inform inform) throws RuntimeException;

}
