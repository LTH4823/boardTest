package org.zerock.boardtest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.boardtest.domain.Reply;
import org.zerock.boardtest.dto.ListDTO;
import org.zerock.boardtest.dto.ReplyDTO;

import java.util.List;

@Transactional
public interface ReplyService {

    List<ReplyDTO> getListOfBoard(Integer bno, ListDTO listDTO);

    int register(ReplyDTO replyDTO);

    void remove(Integer rno);
}

