package com.teamsalad.persistence;

import com.teamsalad.domain.cartVO;

public interface BasketDAO {

	// 장바구니 정보
		public void cartInfo(cartVO cart) throws Exception;
}
