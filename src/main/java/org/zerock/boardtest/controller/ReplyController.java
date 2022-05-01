package org.zerock.boardtest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.boardtest.dto.ReplyDTO;
import org.zerock.boardtest.service.ReplyService;

import java.util.List;

@RestController
@RequestMapping("/replies/")
@Log4j2
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;

    @GetMapping("/test")
    public String[] get1(){
        return new String[]{"aaa", "bbb", "ccc"};
    }
    @GetMapping(value = "/list/{bno}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<ReplyDTO>  getListOfBoard(@PathVariable("bno") Integer bno){

        return replyService.getListOfBoard(bno);
    }

}
