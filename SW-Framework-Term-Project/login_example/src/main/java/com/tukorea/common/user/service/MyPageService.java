package com.tukorea.common.user.service;


import com.tukorea.common.user.dao.MyPageDao;
import com.tukorea.common.user.dto.ModifyUserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import java.util.HashMap;

@Service
public class MyPageService {

    private MyPageDao dao;

    @Autowired
    public MyPageService(MyPageDao dao) {
        this.dao = dao;
    }

    public HashMap<String, Object> getMemberDetail(int memberSeq) {
        HashMap<String, Object> resultMap = new HashMap<>();

        try {
            // [1] 회원 상세 정보 조회
            resultMap = dao.selectMemberInfo(memberSeq);
            System.out.println("[1] 회원 상세 정보 조회");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultMap;
    }

    public HashMap<String, Object> modifyUser(ModifyUserForm modifyUserForm, int userId) {
        HashMap<String, Object> resultMap = new HashMap<>();

        String result_cd = "00";
        String result_msg = "정상";

        try {
            // 파라미터 설정
            HashMap<String, Object> paramMap = new HashMap<>();


            paramMap.put("userId", userId);
            paramMap.put("userNickName", modifyUserForm.getUserNickName());
            paramMap.put("email", modifyUserForm.getEmail());
            paramMap.put("phoneNum", modifyUserForm.getPhoneNum());
            paramMap.put("content", modifyUserForm.getContent());

            // 회원 수정
            int result = dao.updateMember(paramMap);

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

    public void deleteUser(int userId) {
        int result = dao.deleteUser(userId);
    }
}
