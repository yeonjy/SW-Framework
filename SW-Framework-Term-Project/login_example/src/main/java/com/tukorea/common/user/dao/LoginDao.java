package com.tukorea.common.user.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDao {

	// 로그인 회원 정보 조회
	public HashMap<String, Object> selectMemberForLogin(HashMap<String, Object> paramMap);

}
