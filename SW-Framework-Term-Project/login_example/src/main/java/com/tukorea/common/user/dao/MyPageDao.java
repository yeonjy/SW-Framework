package com.tukorea.common.user.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface MyPageDao {

    // 회원 정보 상세 조회
    HashMap<String, Object> selectMemberInfo(int userId);

    int updateMember(HashMap<String, Object> paramMap);

    int deleteUser(int userId);

}
