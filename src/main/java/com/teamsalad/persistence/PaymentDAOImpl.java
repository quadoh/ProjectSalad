package com.teamsalad.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.orderVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
 
	// 디비연결처리 (의존주입)
	//@Inject
	@Autowired
	private SqlSession sqlSession;
		
	private static final Logger logger  
		   = LoggerFactory.getLogger(PaymentDAOImpl.class);
		
	// Mapper 파일을 구분하기위한 사용자 지정 고유값
	private static final String namespace = "com.TeamSalad.mapper.PaymentMapper";
		
	// 장바구니 정보
	@Override
	public void orderInfo(orderVO order) throws Exception {
		sqlSession.insert(namespace + ".orderInfo", order);
	}
	

}
