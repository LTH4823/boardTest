package org.zerock.boardtest.service;

import org.zerock.boardtest.dto.BoardDTO;
import org.zerock.boardtest.dto.ListDTO;
import org.zerock.boardtest.dto.ListResponseDTO;

import java.util.List;

public interface BoardService {

//    List<BoardDTO> getList(ListDTO listDTO); // 
    ListResponseDTO<BoardDTO>getList(ListDTO listDTO);

    BoardDTO getOne(Integer bno);

    void insert(BoardDTO boardDTO);

    void update(BoardDTO boardDTO);

    void remove(Integer bno);



}
