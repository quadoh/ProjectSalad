package com.teamsalad.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.cartVO;

@Repository
public class BasketDAOImpl implements BasketDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(BasketDAOImpl.class);
	
	// AdminMapper.xml 파일에 접근가능한 이름(주소)
	private static final String namespace = "com.teamsalad.mapper.BasketMapper";
	
	///////////////////////////////////// 장바구니 화면 ///////////////////////////////////////////////////////////////
	// 장바구니 정보
		@Override
		public void cartInfo(cartVO cart) throws Exception {
			sqlSession.insert(namespace + ".cartInfo", cart);
		}

	




}
