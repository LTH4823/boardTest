package org.zerock.boardtest.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.boardtest.domain.Board;

import java.util.List;

public interface BoardMapper extends GenericMapper<Board, Integer> {

//    void insert(Board board);
//
//    List<Board> selectList(@Param("skip") int skip,@Param("size") int size);
//
//    void delete(Integer bno);
//
//    Board selectOne(Integer bno);
//
//    void update(Board board);

    //amount?
    void updateReplyCount(@Param("bno") Integer bno,@Param("amount") int amount);

}
