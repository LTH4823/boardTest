package org.zerock.boardtest.service;

import org.zerock.boardtest.dto.UploadResultDTO;

public interface FileService {
    void register(UploadResultDTO uploadResultDTO);

    void remove(String uuid);
}
