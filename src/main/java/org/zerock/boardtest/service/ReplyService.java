package org.zerock.boardtest.service;

import org.zerock.boardtest.domain.Reply;
import org.zerock.boardtest.dto.ReplyDTO;

import java.util.List;

public interface ReplyService {

    List<ReplyDTO> getListOfBoard(Integer bno);

}
