package com.tukorea.common.home.dao;

import com.tukorea.common.home.dto.HomeDto;
import com.tukorea.common.home.dto.NoticeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface HomeDao {
    List<HomeDto> selectProducts();

    List<NoticeDto> selectNotices();

    int deleteNotice(int noticeId);

    HashMap<String, Object> selectNoticeInfo(int noticeId);
}
