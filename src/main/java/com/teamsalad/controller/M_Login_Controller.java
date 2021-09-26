package com.teamsalad.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamsalad.domain.memberVO;
import com.teamsalad.service.M_LoginService;

@Controller
@RequestMapping("/M_Login/*")
public class M_Login_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(M_Login_Controller.class);

	@Inject
	private M_LoginService service;
	
	// 로그인 메인 페이지 (GET)
    // http://localhost:8080/M_Login/login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String mLoginGET(HttpSession session) throws Exception {
		
		logger.info("mLoginGET() 실행");
				
		if(session.getAttribute("m_id") != null) { 
			return "redirect:/M_Login/main"; 
		}

		return "/M_Login/login";
	}
	
	// 로그인 처리 (POST)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void mLoginPOST(memberVO mvo, HttpSession session, HttpServletResponse response, Model model) throws Exception {

		logger.info("mLoginPOST() 호출 ");
		
		memberVO loginResultMVO = service.memberLogin(mvo);
		
		logger.info("" + loginResultMVO);
		
		if (loginResultMVO == null) {
			logger.info("로그인 실패");	
			response.getWriter().print(false) ;
			return;
		}

		session.setAttribute("m_id", loginResultMVO.getM_id());
		logger.info("로그인성공");	
		response.getWriter().print(true) ;
		return;
	}
	
	// 구글 연동 로그인하기
	// http://localhost:8080/M_Login/login
	@RequestMapping(value = "/googlelogin", method = RequestMethod.POST)
	public String googleLoginPOST(memberVO mvo, HttpSession session, RedirectAttributes rttr, HttpServletResponse response, Model model) throws Exception{
		
		logger.info("googleLoginPOST() 실행");
		
		memberVO googleLoginResultMVO = service.googleLogin(mvo);
		
		if (googleLoginResultMVO == null) { // 디비에 등록되지 않은 구글 아이디
			
			logger.info("등록되지 않은 구글 아이디");
			
			// 구글 회원가입
			service.googleJoin(mvo);
			logger.info("구글 아이디 등록 완료");
			
			// 구글 로그인
			googleLoginResultMVO = service.googleLogin(mvo);
			session.setAttribute("m_id", googleLoginResultMVO.getM_id());
					
		} else if (googleLoginResultMVO != null){ // 디비에 등록된 구글아이디
			
			logger.info("등록된 구글 아이디");
			
			// 구글 로그인
			googleLoginResultMVO = service.googleLogin(mvo);
			session.setAttribute("m_id", googleLoginResultMVO.getM_id());
		}
		
		return "redirect:/M_Login/main";				
	}
	
	// 임시 구글 로그아웃 페이지
	@RequestMapping(value = "/googleLogout", method = RequestMethod.GET)
	public void googleLogout() throws Exception {
		
	}
	
	// 임시 마이페이지 메인
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mMainGET(HttpSession session, Model model) throws Exception {
		
		logger.info("mMainGET() 실행");
		String id = (String)session.getAttribute("m_id");
		model.addAttribute(id);
        	
	}
	
	// 임시 가입 페이지 메인
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void mJoinGET(memberVO mvo, Model model) throws Exception {
		
		logger.info("mJoinGET() 실행");
		model.addAttribute(mvo);		
	
	}
	

	// 로그아웃 처리 (get)
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String mLogoutGET(HttpSession session) throws Exception {
		
		logger.info(" mLogoutGET() 호출 ");
		session.invalidate();
		
		return "redirect:/main";
	}
	


}
