package org.zerock.boardtest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ReplyDTO {
    private Integer rno;
    private Integer bno;
    private String replyText;
    private String rpelyer;
    private LocalDate regDate;
    private LocalDate updateDate;
}
