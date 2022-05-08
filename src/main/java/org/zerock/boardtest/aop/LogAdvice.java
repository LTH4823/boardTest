package org.zerock.boardtest.aop;


import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Arrays;

//라이브러리는 존재하지만 기본은 안잡힘
//aspectj 라이브러리를 추가하면 바로 추가가 가능하다.
@Aspect
@Log4j2
@Component
public class LogAdvice {

    //aop 트랜젝션 설정 경로 -> 해성 경로의 클래스가 적용 될시 아래의 코드가 먼저 실행 된다.
    @Before("execution(* org.zerock.boardtest.service.ReplyService*.*(..))")
    public void printLog(JoinPoint joinPoint) {

        //연결 지점 point cut
        Object[] params = joinPoint.getArgs();

        log.info("------------------------");
        log.info("------------------------");
        //해당 경로의 기능 전 값의 확인
        log.info(Arrays.toString(params));
        log.info("------------------------");
        log.info("------------------------");

    }
}
