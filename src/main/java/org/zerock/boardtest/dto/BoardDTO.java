package org.zerock.boardtest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class BoardDTO {
    private Integer bno;
    private String title;
    private String content;
    private String writer;

    private List<UploadResultDTO> uploads = new ArrayList<>();

    private LocalDate regDate;
    private LocalDate updateDate;
}
