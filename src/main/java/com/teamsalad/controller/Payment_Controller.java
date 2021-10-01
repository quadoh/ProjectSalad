package com.teamsalad.controller;



import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;


public class Payment_Controller {
	
	// 주문
	@RequestMapping(value = "/PaymentList", method = RequestMethod.POST)
	public void order(HttpSession session, orderVO order) throws Exception {
	 
	 memberVO member = (memberVO)session.getAttribute("member");  
	 String M_id = member.getM_id(); 
	 
	}

}
