package org.zerock.boardtest.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.boardtest.domain.Reply;
import org.zerock.boardtest.dto.ListDTO;

import java.util.List;

public interface ReplyMapper extends GenericMapper<Reply, Integer> {
    List<Reply> selectListOfBoard(@Param("bno") Integer bno, @Param("listDTO") ListDTO listDTO);

    int selectTotalOfBoard(Integer bno);

    void updateAsRemoved(Integer rno);
}
