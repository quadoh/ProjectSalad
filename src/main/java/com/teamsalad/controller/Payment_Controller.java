package com.teamsalad.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;


public class Payment_Controller {
	
	// 주문
	@RequestMapping(value = "/PaymentList", method = RequestMethod.POST)
	public void order(HttpSession session, orderVO order) throws Exception {
		logger.info("order"); 
	 
	 memberVO member = (memberVO)session.getAttribute("member");  
	 String M_id = member.getM_id();
	 
	 Service.orderInfo(order);  
	 
	}

}
