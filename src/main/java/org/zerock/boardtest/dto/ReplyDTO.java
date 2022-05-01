package org.zerock.boardtest.dto;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class ReplyDTO {
    private Integer rno;
    private Integer bno;
    private String replyText;
    private String rpelyer;
    
    //Date 타입 은 기본 타입 데이터가 아니기 때문에 일반적으로 전달이 어려움 
    //2,3가지 정도 방법이 있는데 그중 @를 사용하는 방법
    @DateTimeFormat(pattern = "yyyy-mm-dd:ss")
    private LocalDate regDate;
    @DateTimeFormat(pattern = "yyyy-mm-dd:ss")
    private LocalDate updateDate;
}
