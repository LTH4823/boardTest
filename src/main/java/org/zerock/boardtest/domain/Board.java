package org.zerock.boardtest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Board {
    private Integer bno;
    private String title;
    private String content;
    private String writer;

    private String mainImage;

    private LocalDate regDate;
    private LocalDate updateDate;
}
