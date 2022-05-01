package org.zerock.boardtest.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/replies/")
@Log4j2
public class ReplyController {

    @GetMapping("/test")
    public String[] get1(){
        return new String[]{"aaa", "bbb", "ccc"};
    }

}
