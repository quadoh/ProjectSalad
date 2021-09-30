package com.teamsalad.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 메일 전송 객체 주입
	@Autowired
	private JavaMailSender mailSender;
	
	// 서비스객체 주입
	@Inject
	private M_JoinService service;
	
	// 회원가입 메인 페이지 (GET)
	// http://localhost:8088/M_Join/join
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public String MemberJoinGETs() throws Exception {

		logger.info("MemberJoinGETs() 호출!!! ");

		return "/M_Join/join";
	}
	
	// 회원가입 처리 (POST)
	// http://localhost:8088/M_Join/join
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	
	public String MemberJoinPOSTs(memberVO vo) throws Exception {
		
		logger.info("MemberJoinPOSTs() 호출!!! ");

		logger.info(" 회원 가입 성공!!! ");
		
		return "redirect:/index";
	}
	
	
	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/memberIdCk", method = RequestMethod.POST)
	public String memberIdCkPOST(String m_id) throws Exception{
		
		logger.info("memberIdChk() 호출");
		
		int result = service.idCheck(m_id);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}	
	
	}
	
	// 이메일 인증
	/* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public void mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "newstart0125@naver.com";
        String toMail = email;
        String title = "샐러드 몰 회원가입 인증 이메일 입니다.";
        String content = 
                "저희 샐러드 몰을 찾아주셔서 감사합니다." +
                "<br><br>" + 
                "회원가입 인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";   
        
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	
	
	
	

}
