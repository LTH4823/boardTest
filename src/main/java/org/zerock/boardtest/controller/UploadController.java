package org.zerock.boardtest.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.UUID;

@Controller
@Log4j2
public class UploadController {

    @PostMapping("/upload1")
    public void upload1(MultipartFile[] files) {
        log.info("======================");
        log.info(files);
        //업로드된 파일이 있다고 가정
        for (MultipartFile file : files) {
//            log.info(file.getOriginalFilename());
            String originalFileName = file.getOriginalFilename();
//            log.info(file.getResource());
            //uuid -> 파일 앞에 랜덤아이디값 지정 해줌 -> 파일 분간 및 보안 위하여 사용
            String saveName = UUID.randomUUID().toString()+"_"+ originalFileName;

            log.info(file.getResource());
            String saveFolder = makeFolders();

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

            log.info("------------------------------");
        }
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
