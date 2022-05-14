package org.zerock.boardtest.controller;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.boardtest.dto.UploadResultDTO;

import java.io.*;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@Log4j2
public class UploadController {

    @PostMapping("/upload1")
    @ResponseBody
    public List<UploadResultDTO> upload1(MultipartFile[] files) {

        log.info("======================");

        log.info(files);

        List<UploadResultDTO> list = new ArrayList<>();

        //업로드된 파일이 있다고 가정
        for (MultipartFile file : files) {
//            log.info(file.getOriginalFilename());
            String originalFileName = file.getOriginalFilename();

            log.info(file.getContentType());
            boolean img = file.getContentType().startsWith("image");

            String uuid = UUID.randomUUID().toString();

//            log.info(file.getResource());
            //uuid -> 파일 앞에 랜덤아이디값 지정 해줌 -> 파일 분간 및 보안 위하여 사용
            String saveName = uuid.toString()+"_"+ originalFileName;

            log.info(file.getResource());
            String saveFolder = makeFolders();

            File savFile = new File("C:\\upload\\"+saveFolder+"\\"+saveName);

            try (
                    //업로드할 파일 정보를 받기 위한 inputStream
                    InputStream in = file.getInputStream();

                    //업로드된 파일 정보 읽기 위한
//                    FileOutputStream fos = new FileOutputStream("C:\\upload\\" + file.getOriginalFilename());
                    //uuid를 포함하여 데이터를 저장
//                    FileOutputStream fos = new FileOutputStream("C:\\upload\\" + saveName);
                    FileOutputStream fos = new FileOutputStream("C:\\upload\\" +saveFolder+"\\"+saveName);
                    ) {

                FileCopyUtils.copy(in,fos);




            } catch (IOException e) {
                e.printStackTrace();
            }

            if(img){
                //saveName = UUID+"_"+fileName
                String thumbFileName = saveFolder+"\\s_"+saveName;
                File thumbFile = new File("C:\\upload\\"+thumbFileName);
                try {
                    Thumbnails.of(savFile)
                            .size(200, 200)
                            .toFile(thumbFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            list.add(UploadResultDTO.builder()
                    .original(originalFileName)
                    .uuid(uuid)
                    .img(img)
                    .savePath(saveFolder)
                    .build());

            log.info("------------------------------");
        }

        return list;
    }

    //저장할 파일들의 폴더 위치 생성
    private String makeFolders(){

        //날짜 데이터는 기본 단순 자료형이 아니기 때문에 자료 형을 단순화 시켜야함
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        //단순화 자료화된 변수에 기본 날짜값 선언
        String str = sdf.format(new java.util.Date());
        //저장 할 폴더 경로 지정
        File folderPath = new File("C:\\upload\\" + str);

        if(!folderPath.exists()){
            //저장 폴더 생성
            folderPath.mkdirs();
        }

        return str;
    }

}
