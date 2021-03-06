package org.zerock.t1.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.boardtest.dto.ListDTO;
import org.zerock.boardtest.mapper.ReplyMapper;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class ReplyMapperTests {

    @Autowired(required = false)
    private ReplyMapper replyMapper;

    @Test
    public void testList1(){
//        Integer bno = 116;
//        replyMapper.selectListOfBoard(bno).forEach(reply -> log.info(reply));

        Integer bno = 116;

        ListDTO listDTO = new ListDTO();
        listDTO.setPage(2);
        listDTO.setSize(10);

        replyMapper.selectListOfBoard(bno, listDTO).forEach(reply -> log.info(reply));
    }
}
