package org.zerock.boardtest.domain;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AttachFile {

    private String uuid;
    private String fileName;
    private String savePath;
    private boolean img;

}
