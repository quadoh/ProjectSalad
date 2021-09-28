package com.teamsalad.service;

import com.teamsalad.domain.orderVO;

public interface PaymentService {

	// 주문정보
		public void orderInfo(orderVO order) throws Exception;
}
