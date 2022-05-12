package com.ma.disaster.annotation;

import java.lang.annotation.*;

/**
 * @author 马志超
 * @date 2022/4/6
 * @Description
 */

@Target({ElementType.TYPE,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogAnnotation {

    /**
     * 模块名称
     * @return
     */
    String module() default "";

    /**
     * 操作名称
     * @return
     */
    String operator() default "";
}
