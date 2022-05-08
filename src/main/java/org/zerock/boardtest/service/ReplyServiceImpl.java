package org.zerock.boardtest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.boardtest.domain.Reply;
import org.zerock.boardtest.dto.ListDTO;
import org.zerock.boardtest.dto.ReplyDTO;
import org.zerock.boardtest.mapper.BoardMapper;
import org.zerock.boardtest.mapper.ReplyMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class ReplyServiceImpl implements ReplyService{

    private final ReplyMapper replyMapper;
    private final ModelMapper modelMapper;
    private final BoardMapper boardMapper;

    @Override
    public List<ReplyDTO> getListOfBoard(Integer bno, ListDTO listDTO) {

        List<Reply> replyList = replyMapper.selectListOfBoard(bno, listDTO);

        List<ReplyDTO> dtoList = replyList.stream()
                .map(reply -> modelMapper.map(reply, ReplyDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public int register(ReplyDTO replyDTO) {

        Reply reply = modelMapper.map(replyDTO, Reply.class);

        replyMapper.insert(reply);

        boardMapper.updateReplyCount(replyDTO.getBno(), 1);

        return replyMapper.selectTotalOfBoard(replyDTO.getBno());
    }

    @Override
    public void remove(Integer rno) {

        replyMapper.updateAsRemoved(rno);
    }
}
