package org.zerock.boardtest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.boardtest.mapper.TimeMapper;

@Service
@RequiredArgsConstructor
@Log4j2
public class TimeServiceImpl implements TimeService{

    private final TimeMapper timeMapper;

    //아래의 메소드 트랜잭션 적용 선언
    @Transactional
    @Override
    public void insertAll(String text) {
        timeMapper.insertA(text);
        timeMapper.insertB(text);
    }
}
