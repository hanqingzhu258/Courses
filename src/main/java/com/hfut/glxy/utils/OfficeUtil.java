package com.hfut.glxy.utils;

import java.util.Arrays;
import java.util.List;

/**
 * @author chenliangliang
 * @date 2017/12/30
 */
public class OfficeUtil {

    private static final List<String> OFFICE_TYPE = Arrays.asList("doc", "docx", "xls", "xlsx", "ppt", "pptx", "txt");

    public static boolean convertible(String fileType) {
        return OFFICE_TYPE.contains(fileType);
    }






}
