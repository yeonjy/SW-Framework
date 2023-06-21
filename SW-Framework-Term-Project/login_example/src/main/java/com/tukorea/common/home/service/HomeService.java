package com.tukorea.common.home.service;

import com.tukorea.common.home.dao.HomeDao;
import com.tukorea.common.home.dto.HomeDto;
import com.tukorea.common.home.dto.NoticeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class HomeService {

    private HomeDao dao;

    @Autowired
    public HomeService(HomeDao dao) {
        this.dao = dao;
    }

    public HashMap<String, Object> getProducts() {
        HashMap<String, Object> resultMap = new HashMap<>();

        try {
            //전체 상품 조회
            List<HomeDto> productList = dao.selectProducts();
            resultMap.put("productList", productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;

    }

    public HashMap<String, Object> getNotices() {
        HashMap<String, Object> resultMap = new HashMap<>();

        try {
            //전체 공지사항 조회
            List<NoticeDto> noticeList = dao.selectNotices();
            resultMap.put("noticeList", noticeList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }

    public void deleteNotice(int noticeId) {
        int result = dao.deleteNotice(noticeId);
    }

    public HashMap<String, Object> getNoticeDetail(int noticeId) {
        HashMap<String, Object> resultMap = new HashMap<>();

        try {
            //공지사항 정보 상세 조회
            resultMap = dao.selectNoticeInfo(noticeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
}
