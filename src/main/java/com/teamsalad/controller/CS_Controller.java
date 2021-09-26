package com.teamsalad.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamsalad.domain.customerBoardVO;
import com.teamsalad.service.CSService;

@Controller
@RequestMapping("/CS/*")
public class CS_Controller {
	
	private static final Logger logger =
			LoggerFactory.getLogger(CS_Controller.class);
	
	@Inject
	private CSService CS_service;
	
	// 게시판 글 전체 조회
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listALLGET(Model model, @ModelAttribute("result") String result) throws Exception{
		
		logger.info(" C: listALLGET() 호출 -> view 페이지 이동");
		
		// 글쓰기 페이지에서 전달한 정보를 저장후 출력
		logger.info(" 페이지 처리 결과 : "+result);
		
		// 서비스 동작 호출
		// DB에서 가져온 글 정보를 view 페이지로 전달
		model.addAttribute("CS_boardList",CS_service.listALL());
	
	}
	
	// 글쓰기(GET)
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception{
		
		logger.info(" C : registerGET() 호출 -> view 페이지");
	}
	
	// 글쓰기(POST)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(customerBoardVO CS_vo, Model model) throws Exception {
		
		logger.info(" C: registerPOST() 호출");
		
		CS_service.create(CS_vo);
		
		model.addAttribute("result", "success");

		return "redirect:/CS/listAll";
	}
		
	// 글읽기(GET)
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(Integer customer_b_num, Model model ) throws Exception{
		
		logger.info(" C : readGET() 호출! ");
				
		// 서비스객체 - 글번호에 해당하는 정보를 가져오는 동작
		customerBoardVO CS_vo = CS_service.read(customer_b_num);		
		
		// DB에서 가져온 데이터를 저장
		model.addAttribute("CS_vo", CS_vo);
		
	}
	
	// 게시판 글 수정(GET)
	@RequestMapping(value = "/modify", method = {RequestMethod.GET})
	public void modifyGET(Integer customer_b_num, Model model) throws Exception {
		
		logger.info(" C : modifyGET() 호출");
		
		model.addAttribute("CS_uvo", CS_service.read(customer_b_num));
	}
	
	// 게시판 글 수정처리(POST)
	@RequestMapping(value = "/modify" , method = RequestMethod.POST)
	public String modifyPOST(customerBoardVO CS_vo) throws Exception{
		
		logger.info(" C: modifyPOST(customerBoardVO CS_vo) 호출" );

		CS_service.modify(CS_vo);
		
		return "redirect:/CS/listAll";
	}
	
	// 게시판 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(Integer customer_b_num) throws Exception{
		
		// 서비스 객체안에 삭제처리 동작
		CS_service.delete(customer_b_num);
		
		// 리스트페이지로 이동
		return "redirect:/CS/listAll";
	}
	
	

}
