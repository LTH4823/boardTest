package org.zerock.boardtest.service;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.boardtest.domain.AttachFile;
import org.zerock.boardtest.dto.UploadResultDTO;
import org.zerock.boardtest.mapper.FileMapper;

@Service
@RequiredArgsConstructor
public class FileServiceImpl implements FileService{

    private final FileMapper fileMapper;
    private final ModelMapper modelMapper;

    @Override
    public void register(UploadResultDTO uploadResultDTO) {
        //UploadResultDTO => AttachFile
        AttachFile attachFile = modelMapper.map(uploadResultDTO, AttachFile.class);

        fileMapper.insert(attachFile);
    }
}
