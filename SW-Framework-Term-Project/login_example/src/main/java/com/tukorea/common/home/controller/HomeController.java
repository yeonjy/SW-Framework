package com.tukorea.common.home.controller;

import com.tukorea.common.home.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class HomeController {

	private HomeService service;

	@Autowired
	public HomeController(HomeService service) {
		this.service = service;
	}

	@GetMapping("/")
	public String home(Model model) {

		HashMap<String, Object> productMap = service.getProducts();
		model.addAttribute("productList", productMap.get("productList"));

		return "common/home/home";
	}

	@GetMapping("/notice")
	public String notice(Model model, HttpServletRequest request) {
		//get session
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("sUserId");

		HashMap<String, Object> noticeMap = service.getNotices();
		model.addAttribute("noticeList", noticeMap.get("noticeList"));
		model.addAttribute("userId", userId);

		return "common/home/notice";
	}


	/**
	 * 공지사항 상세 페이지
	 */
	@GetMapping("/notice/{noticeId}/detail")
	public String detailNoticePage(@PathVariable("noticeId") int noticeId, Model model, HttpServletRequest request) {
		//get session
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("sUserId");

		//공지사항 상세정보 가져오기
		HashMap<String, Object> resultMap = service.getNoticeDetail(noticeId);
		model.addAttribute("notice", resultMap);

		model.addAttribute("userId", userId);

		return "common/home/noticeDetail";
	}


	/**
	 * 공지사항 삭제
	 */
	@PostMapping("/notice/{noticeId}/delete")
	public String modify(@PathVariable("noticeId") int noticeId, HttpServletRequest request) {
		service.deleteNotice(noticeId);
		return "redirect:/notice";
	}
}