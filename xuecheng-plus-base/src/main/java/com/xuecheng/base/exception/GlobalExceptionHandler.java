package com.xuecheng.base.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * @description 全局异常处理器
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(XueChengPlusException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR) // 该异常枚举错误码为500，
    public RestErrorResponse customException(XueChengPlusException exception) {
        log.error("系统异常啊：{}", exception.getErrMessage());
        exception.printStackTrace();
        return new RestErrorResponse(exception.getErrMessage());
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public RestErrorResponse exception(Exception exception) {
        log.error("系统异常：{}", exception.getMessage());
        exception.printStackTrace();
        if ("不允许访问".equals(exception.getMessage()))
            return new RestErrorResponse("您没有权限操作此功能");
        return new RestErrorResponse(exception.getMessage());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public RestErrorResponse doMethodArgumentNotValidException(MethodArgumentNotValidException exception) {
        BindingResult bindingResult = exception.getBindingResult();
        List<FieldError> fieldErrors = bindingResult.getFieldErrors();
        StringBuffer stringBuffer = new StringBuffer();
        fieldErrors.forEach(fieldError -> stringBuffer.append(fieldError.getDefaultMessage()).append(","));
        log.error(stringBuffer.toString());
        return new RestErrorResponse(stringBuffer.toString());
    }
}