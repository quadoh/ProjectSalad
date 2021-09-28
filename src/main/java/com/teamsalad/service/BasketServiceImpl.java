package com.teamsalad.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teamsalad.domain.cartVO;
import com.teamsalad.persistence.BasketDAO;

public class BasketServiceImpl implements BasketService {
	
	private static final Logger logger =
			LoggerFactory.getLogger(BasketService.class);
	
	@Inject
	private BasketDAO bdao;
	
	// 장바구니 정보
	@Override
	public void cartInfo(cartVO cart) throws Exception {
		bdao.cartInfo(cart);
		}

}
