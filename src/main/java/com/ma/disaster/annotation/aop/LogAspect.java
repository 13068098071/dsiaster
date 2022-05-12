package com.ma.disaster.annotation.aop;

import com.alibaba.fastjson.JSON;
import com.ma.disaster.annotation.LogAnnotation;
import com.ma.disaster.pojo.Log;
import com.ma.disaster.pojo.User;
import com.ma.disaster.service.ILogService;
import com.ma.disaster.utils.AddressUtil;
import com.ma.disaster.utils.IPUtil;
import com.ma.disaster.utils.TokenUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.Arrays;

/**
 * @author 马志超
 * @date 2022/4/6
 * @Description
 */

@Component
@Aspect
@Slf4j
public class LogAspect {
    @Resource
    private ILogService logService;

    @Resource
    private RedisTemplate redisTemplate;
    /**
     * 切点
     */
    @Pointcut("@annotation(com.ma.disaster.annotation.LogAnnotation)")
    public void pointcut() {
    }

    /**
     * 环绕通知
     * @return
     */
    @Around("pointcut()")
    public Object log(ProceedingJoinPoint point) throws Throwable {
        //开始时间
        long beginTime = System.currentTimeMillis();
        Object result = point.proceed();
        Long time =  System.currentTimeMillis() - beginTime;
        recordLog(point,time);
        return  result;
    }

    private void recordLog(ProceedingJoinPoint point, Long time) {
        Log log = new Log();
        MethodSignature signature = (MethodSignature) point.getSignature();
        Method method = signature.getMethod();
        //获取注解
        LogAnnotation logAnnotation = method.getAnnotation(LogAnnotation.class);
        String operator = logAnnotation.operator();
        log.setOperation(operator);
        String className = point.getTarget().getClass().getName();
        String methodName = signature.getName();
        log.setMethod(className+"："+methodName);

        Object[] args = point.getArgs();
        LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();
        String[] paramNames = u.getParameterNames(method);
        log.setParams("paramName:"+ Arrays.toString(paramNames) +",args:"+ Arrays.toString(args));

        HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String username = (String) redisTemplate.opsForValue().get("username");
        log.setUsername(username);
        String ip = IPUtil.getIpAddr(request);
        log.setIp(ip);

        log.setTime(time);
        log.setCreateTime(LocalDateTime.now());
        log.setLocation(AddressUtil.getCityInfo(ip));
        logService.save(log);
    }
}
