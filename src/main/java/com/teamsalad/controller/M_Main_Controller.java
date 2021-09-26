package com.teamsalad.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.service.M_MainService;

@Controller
@RequestMapping("/M_Main/*")
public class M_Main_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(M_Main_Controller.class);

	@Inject
	private M_MainService service;

	// 회원 정보조회(GET)
	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public String memberInfoGET(HttpSession session, Model model) throws Exception {
		
		logger.info( "memberInfoGET() 호출" );
		
		// 세션값 저장
		String m_id = (String) session.getAttribute("id");
		// 임시
		m_id = "tester001";
		
		// 서비스 계층 - getMember(id)
		memberVO mvo = service.getMemberInfo(m_id);
		// 모델 객체에 저장 - view 페이지 까지 전달
		model.addAttribute("mvo", mvo);
		// 페이지 이동 /member/info.jsp
		return "/M_Main/memberInfo";
	}

	// 회원정보 수정(GET)
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String memberUpdateGET(HttpSession session, Model model) throws Exception {
		
		logger.info(" memberUpdateGET() 호출 ");

		// 세션값(id) 가져오기
		String m_id = (String) session.getAttribute("m_id");
		m_id ="admin";
		
		// 기존의 회원정보를 가져오기		
		model.addAttribute("mvo", service.getMemberInfo(m_id));
		
		// view 페이지에 출력 (전달)		
		return "/M_Main/memberUpdate";
	}

	// 회원정보 수정 처리(POST)
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdatePOST(memberVO mvo) throws Exception {

		logger.info(" memberUpdatePOST()호출 ");

		System.out.println(mvo);
		// 서비스를 사용하여 회원정보 수정
		service.updateMember(mvo);
		
		// 페이지 이동
		return "redirect:./myPage";
	}

	// 회원 탈퇴(GET)
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public void memberDeleteGET() throws Exception {
		
		logger.info(" memberDeleteGET() 호출 ");
	}

	// 회원 탈퇴(POST)
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDeletePOST(memberVO mvo, HttpSession session) throws Exception {
		
		logger.info(" memberDeletePOST() 호출! ");

		// 세션정보
		String m_id = (String) session.getAttribute("m_id");
		
		// 임시
		m_id = "admin";

		mvo.setM_id(m_id);
		// 서비스에 탈퇴 동작
		service.deleteMember(mvo);
		// 로그인정보(세션값)
		session.invalidate();
		
		return "redirect:./main";
	}

	// 주문목록조회(GET)
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderListGET(Model model, HttpSession session) throws Exception {

		logger.info(" C : orderListGET() 호출 ");

		// 세션값(id) 가져오기
		String m_id = (String) session.getAttribute("m_id");
		m_id = "test1";

		// 서비스 동작 호출
		List<orderVO> orderList = service.orderList(m_id);

		// 모델 객체에 저장 - view 페이지 까지 전달
		model.addAttribute("orderList", orderList);

		// 페이지 이동/M_Main/orderList.jsp
		return "/M_Main/orderList";
	}

	// 특정 주문 조회
	@RequestMapping(value = "/orderInfo", method = RequestMethod.GET)
	public void orderInfoGET(Integer order_num, Model model) throws Exception {
		
		logger.info( " C : orderInfoGET() 호출! ");
		
		order_num = 1;
		// 서비스객체 - 글번호에 해당하는 정보를 가져오는 동작
		orderVO ovo = service.orderInfo(order_num);

		model.addAttribute("ovo", ovo);

	}

	// 주문 수정 (GET)
	@RequestMapping(value = "/orderUpdate", method = RequestMethod.GET)
	public void orderUpdateGET(Integer order_num, Model model) throws Exception {
		
		logger.info(" C : orderUpdateGET() 호출");

		order_num = 1;
		// 서비스객체 - 글번호에 해당하는 정보를 가져오는 동작
		orderVO ovo = service.orderInfo(order_num);
		
		model.addAttribute("ovo", ovo);
	}

	// 주문 수정 (POST)
	@RequestMapping(value = "/orderUpdate", method = RequestMethod.POST)
	public String orderUpdatePOST(orderVO ovo) throws Exception {

		logger.info("orderUpdatePOST()호출");

		service.orderUpdate(ovo);
		
		return "redirect:./orderList";
	}

	// 주문 삭제
	@RequestMapping(value = "/orderDelete", method = RequestMethod.GET)
	public String orderDeleteGET(Integer order_num) throws Exception {
		
		logger.info("orderDeleteGET() 호출");
		
		System.out.println(order_num);

		// 서비스에 삭제 동작
		service.orderDelete(order_num);

		// 페이지 이동
		return "redirect:/M_Main/orderList";
	}

	

}
