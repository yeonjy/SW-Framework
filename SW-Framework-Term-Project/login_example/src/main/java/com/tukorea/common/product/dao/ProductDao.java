package com.tukorea.common.product.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface ProductDao {

    //상품 상세 조회
    HashMap<String, Object> selectProductInfo(int productId);

    int updateProfileImage(HashMap<String, Object> paramMap);

    int deleteProduct(int productId);
}
