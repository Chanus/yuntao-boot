package com.chanus.yuntao.boot.manager.aspect;

import com.chanus.yuntao.boot.common.pojo.LoginUser;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.mapper.LogMapper;
import com.chanus.yuntao.boot.manager.model.Log;
import com.chanus.yuntao.utils.core.ArrayUtils;
import com.chanus.yuntao.utils.core.IpUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * 系统日志切点类
 *
 * @author Chanus
 * @date 2020-08-01 15:38:54
 * @since 1.0.0
 */
@Aspect
@Component
public class LogAspect {
    @Autowired
    private LogMapper logMapper;
    private static final ObjectMapper objectMapper = new ObjectMapper();

    private static final Logger LOGGER = LoggerFactory.getLogger(LogAspect.class);

    /**
     * 系统操作日志切点
     */
    @Pointcut("@annotation(com.chanus.yuntao.boot.manager.annotation.Log)")
    public void logAspect() {
    }

    /**
     * 记录日志
     *
     * @param proceedingJoinPoint
     * @return
     * @throws Throwable
     */
    @Around("logAspect()")
    public Object writeSystemLog(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        long start = System.currentTimeMillis();

        com.chanus.yuntao.boot.manager.annotation.Log logAnnotation = getSystemLog(proceedingJoinPoint);
        if (logAnnotation == null)
            return proceedingJoinPoint.proceed();

        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();

        LoginUser loginUser = LoginUser.getLoginUser();// 登录用户信息

        Object object = null;

        Log log = new Log();
        if (loginUser != null) {
            log.setOperateNo(loginUser.getLoginNo());
            log.setOperateRoleCode(loginUser.getRoleCode());
            log.setOperateMasterRoleCode(loginUser.getMasterRoleCode());
        }
        log.setOperateIp(IpUtils.getIpAddress(request));
        log.setOperateModuleCode(logAnnotation.module());
        log.setOperateUrl(String.valueOf(request.getRequestURL()));// 请求URL
        log.setOperateMethod(proceedingJoinPoint.getTarget().getClass().getName() + "." + proceedingJoinPoint.getSignature().getName() + "()");// 方法描述
        log.setOperateType(logAnnotation.logType().name());
        log.setOperateTypeDesc(logAnnotation.description());
        log.setOperateTime(LocalDateTime.now());
        if (LogTypeEnum.LOGOUT.equals(logAnnotation.logType())) {// 退出系统时
            object = proceedingJoinPoint.proceed();
            log.setOperateConsumeTime((int) (System.currentTimeMillis() - start));
            logMapper.insertSelective(log);
        } else {
            try {
                object = proceedingJoinPoint.proceed();
                if (LogTypeEnum.LOGIN.equals(logAnnotation.logType())) {// 登录系统时
                    loginUser = LoginUser.getLoginUser();// 登录用户信息
                    if (loginUser != null) {
                        log.setOperateNo(loginUser.getLoginNo());
                        log.setOperateRoleCode(loginUser.getRoleCode());
                        log.setOperateMasterRoleCode(loginUser.getMasterRoleCode());
                    }
                }
                if (object instanceof Message && ((Message) object).isSuccess()) {// 操作成功
                    log.setOperateContent(getParameters(proceedingJoinPoint, null, logAnnotation.ignore()));// 操作内容
                    log.setOperateConsumeTime((int) (System.currentTimeMillis() - start));
                    logMapper.insertSelective(log);
                }
            } catch (Exception ex) {// 记录异常日志
                LOGGER.error(ex.getMessage(), ex);
                log.setOperateType(LogTypeEnum.EXCEPTION.name());
                log.setOperateException(ex.getClass().getName());// 异常代码
                log.setOperateContent(getParameters(proceedingJoinPoint, ex, logAnnotation.ignore()));// 异常信息
                log.setOperateConsumeTime((int) (System.currentTimeMillis() - start));
                logMapper.insertSelective(log);
            }
        }

        return object == null ? Message.fail("系统异常") : object;
    }

    /**
     * 获取系统操作日志注解
     *
     * @param joinPoint
     * @return
     */
    private com.chanus.yuntao.boot.manager.annotation.Log getSystemLog(JoinPoint joinPoint) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        if (method == null)
            return null;

        return method.getAnnotation(com.chanus.yuntao.boot.manager.annotation.Log.class);
    }

    /**
     * 获取请求的参数信息
     *
     * @param joinPoint
     * @param e
     * @param ignore
     * @return 请求的参数信息
     */
    private String getParameters(JoinPoint joinPoint, Throwable e, boolean ignore) {
        StringBuilder parameters = new StringBuilder();
        if (!ignore) {
            int length = joinPoint.getArgs() == null ? 0 : joinPoint.getArgs().length;
            if (length > 0) {
                for (int i = 0; i < length; i++) {
                    try {
                        parameters.append(objectMapper.writeValueAsString(joinPoint.getArgs()[i])).append(";");
                    } catch (Exception ignored) {
                    }

                }
            }
        }

        if (e != null) {
            parameters.append("\r\n").append(e).append("\r\n")
                    .append(ArrayUtils.joinIgnoreNull(e.getStackTrace(), StringUtils.COMMA));
        }

        return parameters.toString();
    }
}
