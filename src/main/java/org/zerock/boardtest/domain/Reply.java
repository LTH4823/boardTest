package org.zerock.boardtest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
    private Integer rno;
    private Integer bno;
    private String replyText;
    private String rpelyer;
    private LocalDate regDate;
    private LocalDate updateDate;
}
