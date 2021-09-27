package com.teamsalad.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamsalad.domain.memberVO;
import com.teamsalad.service.M_JoinService;

@Controller
@RequestMapping("/M_Join/*")
public class M_Join_Controller {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(M_Join_Controller.class);
	
	
	// 서비스객체 주입
	@Inject
	private M_JoinService service;
	
	
	// 회원가입 메인 페이지 (GET)
	// http://localhost:8088/M_Join/join
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public String MemberJoinGETs() throws Exception {
		logger.info("MemberJoinGETs() 호출!!! ");
		logger.info("join.jsp페이지 이동 ");
		
		return "/M_Join/join";
	}
	
	
	// 회원가입 처리 (POST)
	// http://localhost:8088/M_Join/join
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String MemberJoinPOSTs(memberVO vo) throws Exception {
		
		logger.info("MemberJoinPOSTs() 호출!!! ");

		logger.info(" 회원 가입 성공!!! ");
		logger.info(" 페이지 이동!!! ");
		
		return "redirect:/M_Join/login";
	}
	
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String m_id) throws Exception{
		
		logger.info("memberIdChk() 진입");
		
		int result = service.idCheck(m_id);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}	
				
		
	} // memberIdChkPOST() 종료
	
	
	
	
	

}
