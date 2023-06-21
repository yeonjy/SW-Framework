package com.tukorea.common.product.controller;

import com.tukorea.common.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class ProductController {

    private ProductService service;

    @Autowired
    public ProductController(ProductService service) {
        this.service = service;
    }

    /**
     * 상품 상세 조회
     */
    @GetMapping("/{productId}/detail")
    public String getProduct(@PathVariable("productId") int productId, Model model, HttpServletRequest request) {
        //get session
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("sUserId");

        HashMap<String, Object> productMap = service.getProductDetail(productId);
        model.addAttribute("product", productMap);
        model.addAttribute("userId", userId);

        return "common/product/productDetail";
    }

    /**
     * 상품 수정
     */
    @ResponseBody
    @PostMapping("/{productId}/modify-product-image")
    public HashMap<String, Object> modifyProductImage(@PathVariable("productId") int productId,
                                                      @RequestPart(value = "productImg", required = false) MultipartFile productImg) {

        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("productId", productId);
        paramMap.put("file", productImg);

        // 상품 이미지 수정 Service Method 호출
        HashMap<String, Object> resultMap = service.modifyProductImage(paramMap);

        return resultMap;
    }

    /**
     * 상품 삭제
     */
    @PostMapping("/{productId}/delete")
    public String deleteProduct(@PathVariable("productId") int productId) {
        service.deleteProduct(productId);
        return "redirect:/";
    }



}

