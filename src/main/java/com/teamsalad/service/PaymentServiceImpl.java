package com.teamsalad.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teamsalad.domain.orderVO;
import com.teamsalad.persistence.PaymentDAO;

public class PaymentServiceImpl implements PaymentService {
	
	private static final Logger logger =
			LoggerFactory.getLogger(PaymentService.class);
	
	@Inject
	private PaymentDAO pdao;
	
	// 주문정보
	@Override
	public void orderInfo(orderVO order) throws Exception {
		pdao.orderInfo(order);
		}

}
