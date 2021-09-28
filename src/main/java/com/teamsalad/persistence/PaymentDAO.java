package com.teamsalad.persistence;

import com.teamsalad.domain.orderVO;

public interface PaymentDAO {
    
	// 주문정보
	public void orderInfo(orderVO order) throws Exception;
}
