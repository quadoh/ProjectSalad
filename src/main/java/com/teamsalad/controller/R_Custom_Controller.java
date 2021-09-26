package com.teamsalad.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamsalad.service.R_CustomService;

@Controller
@RequestMapping("/R_Custom/*")
public class R_Custom_Controller {
	
	// 서비스 작성 후 사용
	@Inject
	private R_CustomService service;
	
	private static final Logger logger = LoggerFactory.getLogger(R_Custom_Controller.class);
	
	// http://localhost:8088/R_Custom/main
	// 메인 화면 호출(GET)
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainGET() throws Exception{

		// R_Custom 메인 페이지 호출 체크
		logger.info("커스텀 샐러드 페이지 호출");
		// /R_Custom/main.jsp
		
	}
	
	// http://localhost:8088/R_Custom/step1	
	// 스텝1
	@RequestMapping(value = "/step1", method = RequestMethod.GET)
	public void step1GET() throws Exception{
		
		// 도시락 크기 선택 호출
		logger.info("도시락 크기 선택 페이지 호출");
		
		// 페이지 이동 /R_Custom/step2
	}
	
	// http://localhost:8088/R_Custom/step2
	// 스텝2
	@RequestMapping(value = "/step2", method = RequestMethod.GET)
	public void step2GET(Model model) throws Exception{
		
		// 야채 선택
		logger.info("야채 선택 페이지 호출");
		
		// 서비스 동작 호출
		// DB에서 가져온 재료 view 페이지로 전달
		model.addAttribute("ingredientList", service.igdtList(1));
		
		// 페이지 이동 /R_Custom/step3
	}
	
	// http://localhost:8088/R_Custom/step3
	// 스텝3
	@RequestMapping(value = "/step3", method = RequestMethod.GET)
	public void step3GET(Model model) throws Exception{
		
		// 고기 선택
		logger.info("고기 선택 페이지 호출");
		
		// 서비스 동작 호출
		// DB에서 가져온 재료 view 페이지로 전달
		model.addAttribute("ingredientList", service.igdtList(2));
		
		// 페이지 이동 /R_Custom/step3
	}
	
	// http://localhost:8088/R_Custom/step4
	// 스텝4
	@RequestMapping(value = "/step4", method = RequestMethod.GET)
	public void step4GET(Model model) throws Exception{
		
		// 소스 선택
		logger.info("소스 선택 페이지 호출");
		
		// 서비스 동작 호출
		// DB에서 가져온 재료 view 페이지로 전달
		model.addAttribute("ingredientList", service.igdtList(3));
		
		// 페이지 이동 /R_Custom/step4
	}
	
	
}
