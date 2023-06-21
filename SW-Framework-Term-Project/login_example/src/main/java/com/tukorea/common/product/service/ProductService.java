package com.tukorea.common.product.service;

import com.tukorea.common.product.dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;

@Service
public class ProductService {

    @Value("C:/temp_file/")
    private String saveDir;  //실제 저장 디렉토리

    @Value("/upload/")
    private String viewDir;  //보여지는 저장 디렉토리

    private ProductDao dao;

    @Autowired
    public ProductService(ProductDao dao) {
        this.dao = dao;
    }

    public HashMap<String, Object> getProductDetail(int productId) {
        HashMap<String, Object> resultMap = new HashMap<>();

        try {
            // [1] 상품 상세 정보 조회
            resultMap = dao.selectProductInfo(productId);

            String dbSavePath = resultMap.get("imageUrl").toString();  // a.png
            resultMap.put("imageUrl", viewDir + dbSavePath);  ///upload/a.png

            System.out.println("[1] 상품 상세 정보 조회");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultMap;
    }

    public HashMap<String, Object> modifyProductImage(HashMap<String, Object> paramMap) {
        HashMap<String, Object> resultMap = new HashMap<>();

        String result_cd = "00";
        String result_msg = "정상";

        try {
            // DB 저장을 위한 파라미터 설정
            MultipartFile file = (MultipartFile) paramMap.get("file");

            // (1) 원본파일명
            String originName = file.getOriginalFilename();
            paramMap.put("imageName", originName);

            // (2) 실제 파일 저장 경로
            // 저장 파일명으로 쓸 UUID를 생성
            String uuid = UUID.randomUUID().toString();

            // 파일 확장자 추출
            String fileExt = originName.substring(originName.lastIndexOf("."));

            // 저장할 파일명
            String saveFileName = uuid + fileExt;
            paramMap.put("imageUrl", saveFileName);

            // 프로필 이미지에 대한 정보를 DB에 저장(update)
            int resultCount = dao.updateProfileImage(paramMap);

            if (resultCount != 1) {
                throw new Exception("상품 이미지 수정에 실패하였습니다.");
            }

            // 프로필 이미지를 서버에 물리 저장
            String serverSavePath = saveDir + saveFileName;
            File serverSaveFile = new File(serverSavePath);

            file.transferTo(serverSaveFile);

        } catch (Exception e) {
            result_cd = "99";
            result_msg = e.getMessage();

            e.printStackTrace();

        } finally {
            resultMap.put("result_cd", result_cd);
            resultMap.put("result_msg", result_msg);
        }

        return resultMap;
    }

    public void deleteProduct(int productId) {
        int result = dao.deleteProduct(productId);

    }
}
