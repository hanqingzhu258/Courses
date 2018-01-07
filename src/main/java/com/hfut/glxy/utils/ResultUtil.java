package com.hfut.glxy.utils;

import com.hfut.glxy.dto.Result;
import org.jetbrains.annotations.NotNull;

/**
 * @author chenliangliang
 * @date: 2017/11/27
 */
public class ResultUtil {

    @NotNull
    public static Result success(String msg, Object data){
        return new Result(true,msg,data);
    }

    @NotNull
    public static Result success(Object data){
        return new Result(true,null,data);
    }

    @NotNull
    public static Result fail(String msg){
        return new Result(false,msg,null);
    }

    /**
     * 查询数据异常
     * @return Result
     */
    @NotNull
    public static Result selectError(){
        return fail("查询数据异常");
    }

    /**
     * 跟新数据异常
     * @return Result
     */
    @NotNull
    public static Result updateError(){
        return fail("跟新数据异常");
    }

    /**
     * 删除数据异常
     * @return Result
     */
    @NotNull
    public static Result deleteError(){
        return fail("删除数据异常");
    }

    /**
     * 插入数据异常
     * @return Result
     */
    @NotNull
    public static Result insertError(){
        return fail("插入数据异常");
    }

    /**
     * 数据格式错误
     * @return Result
     */
    @NotNull
    public static Result dataError(){
        return fail("数据格式错误");
    }

    /**
     * 未知错误
     * @return Result
     */
    @NotNull
    public static Result unknownError(){
        return fail("未知错误");
    }

    /**
     * OK
     * @param data
     * @return Result
     */
    @NotNull
    public static Result OK(Object data){
        return success("OK",data);
    }

    /**
     * OK
     * @return Result
     */
    @NotNull
    public static Result OK(){
        return success("OK",null);
    }
}
