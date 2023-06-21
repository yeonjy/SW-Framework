package com.tukorea.common.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.tukorea.common.user.dto.JoinForm;
import com.tukorea.common.user.dto.ModifyUserForm;
import com.tukorea.common.user.service.JoinService;
import com.tukorea.common.user.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.tukorea.common.user.dto.LoginForm;
import com.tukorea.common.user.service.LoginService;

@Controller
public class UserController {

	private LoginService loginService;
	private JoinService joinService;
	private MyPageService myPageService;
	
	@Autowired
	public UserController(LoginService loginService, JoinService joinService, MyPageService myPageService) {
		this.loginService = loginService;
		this.joinService = joinService;
		this.myPageService = myPageService;
	}
	
	@GetMapping("/login")
	public String login() {
		return "common/login/login";
	}

	@GetMapping("/join")
	public String join() {
		return "common/join/join";
	}

	/**
	 * 로그인
	 */
	@ResponseBody
	@PostMapping("/login")
	public HashMap<String, Object> loginAjax(LoginForm loginForm, HttpServletRequest request) {
		// login Service 메서드 호출
		HashMap<String, Object> resultMap = loginService.login(loginForm);
		
		// 성공 시 Session에 회원 정보 저장
		String result_cd = resultMap.get("result_cd").toString();
		if ("00".equals(result_cd)) {
			// Session 처리
			HttpSession session = request.getSession(); // Session이 없으면 새로 생성한 Session을 반환
			
			HashMap<String, Object> memberMap = (HashMap<String, Object>) resultMap.get("member");
			session.setAttribute("sUserId", memberMap.get("userId"));
		}
		
		return resultMap;
	}


	/**
	 * 로그아웃
	 */
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false); // Session이 없으면 null을 반환
		
		if (session != null) {
			session.invalidate();
		}
		
		return "redirect:/";
	}

	/**
	 * 회원가입
	 */
	@ResponseBody
	@PostMapping("/join")
	public HashMap<String, Object> joinAjax(JoinForm joinForm, HttpServletRequest request) {
		// login Service 메서드 호출
		HashMap<String, Object> resultMap = joinService.join(joinForm);

		return resultMap;
	}

	/**
	 * 회원 상세 페이지
	 */
	@GetMapping("/mypage")
	public String mypage(Model model, HttpServletRequest request) {
		//get session
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("sUserId");

		//user id로 정보 가져오기
		HashMap<String, Object> resultMap = myPageService.getMemberDetail(userId);
		model.addAttribute("member", resultMap);

		return "common/mypage/mypage";
	}


	/**
	 * 회원 정보 수정
	 */
	@GetMapping("/mypage/modify")
	public String modify(Model model, HttpServletRequest request) {

		//get session
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("sUserId");

		//user id로 정보 가져오기
		HashMap<String, Object> resultMap = myPageService.getMemberDetail(userId);
		model.addAttribute("member", resultMap);

		return "common/mypage/modify";
	}

	@PostMapping("/mypage/modify")
	public String modifyUser(ModifyUserForm modifyUserForm, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("sUserId");
		HashMap<String, Object> resultMap = myPageService.modifyUser(modifyUserForm, userId);
		return "common/mypage/mypage";

	}


	/**
	 * 회원 삭제
	 */
	@PostMapping("/mypage/delete")
	public String deleteMember(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("sUserId");
		myPageService.deleteUser(userId);
		session.invalidate();
		return "common/join/join";
	}



}
