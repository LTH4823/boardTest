package org.zerock.boardtest.mapper;

import org.zerock.boardtest.domain.Reply;

import java.util.List;

public interface ReplyMapper extends GenericMapper<Reply, Integer> {
    List<Reply> selectListOfBoard(Integer bno);

    
}
