package org.zerock.t1.sevice;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.boardtest.service.TimeService;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TimeServiceTests {

    @Autowired
    private TimeService timeService;

    //기본적으로 실행 시 acid 규칙상 오류로 인하여 데이터 테이블에 다 들어가서는 안된다.
    //기본 실행 시는 tbl_a에 값이 들어가버림
    @Test
    public void testInsertAll(){

        log.info("-------------------------");
        log.info(timeService.getClass().getName());

        String str = "우리는 민족 중흥의 역사적 사명을 띄고 이땅에 태어났다.. 조상의 빛나는 얼을 오늘에 되살려 ";
        timeService.insertAll(str);
    }

}
