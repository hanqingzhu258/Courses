package com.hfut.glxy.config;/*
package com.hfut.glxy.config;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.List;

*/
/**
 * @author chenliangliang
 * @date 2017-11-22
 *//*

@Configuration
public class FastJsonConfiguration extends WebMvcConfigurerAdapter {


    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        super.configureMessageConverters(converters);

        FastJsonHttpMessageConverter fastJsonHttpMessageConverter=new FastJsonHttpMessageConverter();

        FastJsonConfig fastJsonConfig=new FastJsonConfig();

        //fastJsonConfig.setCharset(Charset.forName("UTF-8"));


        fastJsonConfig.setDateFormat("yyyy-MM-dd HH:mm");

        fastJsonConfig.setSerializerFeatures(
                */
/*SerializerFeature.WriteMapNullValue,*//*

                SerializerFeature.SkipTransientField,
                SerializerFeature.PrettyFormat,
                SerializerFeature.DisableCircularReferenceDetect
                );

        fastJsonHttpMessageConverter.setFastJsonConfig(fastJsonConfig);

        converters.add(fastJsonHttpMessageConverter);
    }
}
*/
