package org.zerock.boardtest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.boardtest.domain.Reply;
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
    public List<ReplyDTO> getListOfBoard(Integer bno) {

        List<Reply> replyList = replyMapper.selectListOfBoard(bno);

        List<ReplyDTO> dtoList = replyList.stream()
                .map(reply -> modelMapper.map(reply,ReplyDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public void register(ReplyDTO replyDTO) {
        Reply reply = modelMapper.map(replyDTO, Reply.class);

        replyMapper.insert(reply);

        boardMapper.updateReplyCount(replyDTO.getBno(),1);

    }
}
