package com.hfut.glxy.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.hfut.glxy.entity.Inform;
import org.springframework.stereotype.Component;

/**
 * @author chenliangliang
 * @date: 2017/11/27
 */
@Component
public interface InformMapper extends BaseMapper<Inform>{

    int deleteAll();

    int save(Inform inform);
}
