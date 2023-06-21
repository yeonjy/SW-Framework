package com.tukorea.common.user.service;

import com.tukorea.common.user.dao.JoinDao;
import com.tukorea.common.user.dto.JoinForm;
import com.tukorea.common.user.dto.LoginForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class JoinService {

    private JoinDao dao;

    @Autowired
    public JoinService(JoinDao dao) {
        this.dao = dao;
    }

    public HashMap<String, Object> join(JoinForm joinForm) {
        HashMap<String, Object> resultMap = new HashMap<>();

        String result_cd = "00";
        String result_msg = "정상";

        try {
            // 파라미터 설정
            HashMap<String, Object> paramMap = new HashMap<>();
            paramMap.put("name", joinForm.getName());
            System.out.println("joinForm.getName() = " + joinForm.getName());
            paramMap.put("userNickName", joinForm.getUserNickName());
            paramMap.put("email", joinForm.getEmail());
            paramMap.put("password", joinForm.getPassword());
            paramMap.put("phoneNum", joinForm.getPhoneNum());
            paramMap.put("content", joinForm.getContent());

            // [1] 회원가입
            HashMap<String, Object> memberMap = dao.createMember(paramMap);
            resultMap.put("member", memberMap);

        } catch (Exception ex) {
            result_cd = "99";
            result_msg = ex.getMessage();

            ex.printStackTrace();

        } finally {
            resultMap.put("result_cd", result_cd);
            resultMap.put("result_msg", result_msg);
        }

        return resultMap;
    }
}
