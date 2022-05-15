package org.zerock.boardtest.mapper;

import org.zerock.boardtest.domain.AttachFile;

public interface FileMapper {

    void insert(AttachFile attachFile);

    void delete(String uuid);
}
