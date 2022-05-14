package org.zerock.boardtest.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UploadResultDTO {

    private String uuid;
    private String original;
    private String savePath;
    private boolean img;

    public String getLink(){
        return savePath+"/"+uuid+"_"+original;
    }

    public String getThumbnail(){
        return savePath+"/s_"+uuid+"_"+original;
    }

}
