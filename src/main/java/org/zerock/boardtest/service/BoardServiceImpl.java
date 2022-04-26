package org.zerock.boardtest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.boardtest.domain.Board;
import org.zerock.boardtest.dto.BoardDTO;
import org.zerock.boardtest.dto.ListDTO;
import org.zerock.boardtest.dto.ListResponseDTO;
import org.zerock.boardtest.mapper.BoardMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class BoardServiceImpl implements BoardService{

    private final BoardMapper boardMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<BoardDTO> getList(ListDTO listDTO) {
        List<Board> boardList = boardMapper.selectList(listDTO); //.getSkip(),listDTO.getSize()

        // vo -> dto 타입으로 변화 추가
       List<BoardDTO> dtoList =
               boardList.stream().map(board -> modelMapper.map(board, BoardDTO.class))
                       .collect(Collectors.toList());


        return ListResponseDTO.<BoardDTO>builder()
                .dtoList(dtoList)
                .total(boardMapper.getTotal(listDTO))
                .build();
    }

    @Override
    public BoardDTO getOne(Integer bno) {

        Board board = boardMapper.selectOne(bno);

        BoardDTO boardDTO =modelMapper.map(board,BoardDTO.class);

        return boardDTO;
    }

    @Override
    public void insert(BoardDTO boardDTO) {
        boardMapper.insert(Board.builder()
                        .title(boardDTO.getTitle())
                        .content(boardDTO.getContent())
                        .writer(boardDTO.getWriter())
                .build());
    }

    @Override
    public void update(BoardDTO boardDTO) {

        boardMapper.update(Board.builder()
                        .bno(boardDTO.getBno())
                        .title(boardDTO.getTitle()).
                        content(boardDTO.getContent())
                .build());
    }

    @Override
    public void remove(Integer bno) {
        boardMapper.delete(bno);
    }
}
