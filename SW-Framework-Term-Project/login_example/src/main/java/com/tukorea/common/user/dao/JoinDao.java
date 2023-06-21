package com.tukorea.common.user.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface JoinDao {

    // 회원가입
    HashMap<String, Object> createMember(HashMap<String, Object> paramMap);

}
